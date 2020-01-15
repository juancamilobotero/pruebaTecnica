class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :placa
      t.string :marca
      t.date :fecha_entrada
      t.time :hora_entrada
      t.date :fecha_salida
      t.time :hora_salida

      t.timestamps
    end
  end
end
