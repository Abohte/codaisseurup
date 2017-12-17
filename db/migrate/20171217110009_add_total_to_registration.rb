class AddTotalToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :total, :decimal
  end
end
