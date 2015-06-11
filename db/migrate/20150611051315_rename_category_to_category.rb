class RenameCategoryToCategory < ActiveRecord::Migration
  def up
    rename_column :categories, :category, :name
  end

  def down
    rename_column :categories, :name, :category
  end
end
