class CreatePackageTypes < ActiveRecord::Migration
  def change
    create_table :package_types do |t|
      t.string :transport
      t.decimal :price,:precision => 8, :scale => 2
      t.integer :days
      t.integer :nights
      t.integer :package_id

      t.timestamps
    end
  end
end
