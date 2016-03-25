class AddNameToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :name, :string
  end
end
