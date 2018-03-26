class CreateApiUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :api_users do |t|
      t.string :url, null: false
      t.string :api_key, null: false, index: true

      t.timestamps
    end
  end
end
