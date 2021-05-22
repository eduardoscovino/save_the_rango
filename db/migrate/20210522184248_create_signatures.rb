class CreateSignatures < ActiveRecord::Migration[6.0]
  def change
    create_table :signatures do |t|
      t.string :title
      t.string :type_of
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
