class AddForreignKeyToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :category_id, :integer, :null => false
  end
end
