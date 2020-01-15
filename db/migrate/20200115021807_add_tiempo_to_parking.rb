class AddTiempoToParking < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :tiempo, :integer
  end
end
