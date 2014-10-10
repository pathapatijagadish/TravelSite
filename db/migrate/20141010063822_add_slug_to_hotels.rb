class AddSlugToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :slug, :string
    add_index :hotels, :slug, unique: true
  end
end
