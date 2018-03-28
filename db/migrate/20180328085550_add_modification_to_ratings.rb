class AddModificationToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :modification, :integer
    add_column :ratings, :updated_at, :datetime
  end
end
