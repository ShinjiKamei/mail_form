class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :inquiry_id

      t.timestamps
    end
    add_index :responses, :inquiry_id
  end
end
