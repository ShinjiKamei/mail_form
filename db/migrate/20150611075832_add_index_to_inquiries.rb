class AddIndexToInquiries < ActiveRecord::Migration
  def change
    add_index :inquiries, :created_at
  end
end
