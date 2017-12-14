class CreateBrochures < ActiveRecord::Migration[5.1]
  def change
    create_table :brochures do |t|
      t.references :event, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
