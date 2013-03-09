class AddStapleToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :staple, :boolean, :default => false
  end
end
