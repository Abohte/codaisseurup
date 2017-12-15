class AddPriceToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :price, :decimal
  end
end
