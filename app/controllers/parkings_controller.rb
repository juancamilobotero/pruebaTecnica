class ParkingsController < ApplicationController

	def index 
		@parkings = Parking.all
	end

	def new
		@parking = Parking.new
	end
	def create
		@parking = Parking.new(params_parking)
		if @parking.save
		redirect_to new_parking_path
		else
		render :new
		end	
	end

	def salida_vehiculo
		placa = params[:placa_vehiculo]
		parking = Parking.where("placa = '#{placa}' and fecha_salida is null").first
		if !parking.nil?
			hora_entrada = parking.hora_entrada.strftime("%I:%M%p")

			parking.fecha_salida = Date.today
			parking.hora_salida = Time.now - 5.hours

			tiempo = ((parking.hora_salida - parking.hora_entrada) / 60)
			parking.tiempo = tiempo
			if tiempo < 60
				parking.total_pagar = 3000
			else
				parking.total_pagar = ((parking.tiempo.to_f/60)*3000)
			end

			if parking.save
				hora_salida = parking.hora_salida.strftime("%I:%M%p")
			end
		end
		render json:{parking:parking, hora_entrada:hora_entrada,hora_salida:hora_salida}
	end

	private
	def params_parking
		params.require(:parking).permit(:placa, :marca, :fecha_entrada, :hora_entrada)
	end
end
