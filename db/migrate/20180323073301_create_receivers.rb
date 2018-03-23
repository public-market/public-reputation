# Create receivers table
class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.string :uid, null: false
      t.datetime :created_at, null: false
    end
  end
end
