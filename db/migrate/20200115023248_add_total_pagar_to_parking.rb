class AddTotalPagarToParking < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :total_pagar, :decimal
  end
end
