# Create senders table
class CreateSenders < ActiveRecord::Migration[5.1]
  def change
    create_table :senders do |t|
      t.string :uid, null: false, index: true
      t.datetime :created_at, null: false
    end
  end
end
