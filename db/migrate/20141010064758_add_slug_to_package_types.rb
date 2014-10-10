class AddSlugToPackageTypes < ActiveRecord::Migration
  def change
    add_column :package_types, :slug, :string
    add_index :package_types, :slug, unique: true
  end
end
