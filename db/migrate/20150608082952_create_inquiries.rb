class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :email
      t.string :content

      t.timestamps
    end
    add_index :inquiries, [:email, :created_at]
  end
end
