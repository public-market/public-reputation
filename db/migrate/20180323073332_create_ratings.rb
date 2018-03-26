# Create ratings table
class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.string :uid, null: false, index: true
      t.references :api_user, null: false, foreign_key: true, index: true
      t.references :sender, null: false, foreign_key: true, index: true
      t.references :receiver, null: false, foreign_key: true, index: true
      t.integer :value, null: false
      t.datetime :created_at, null: false
    end
  end
end
