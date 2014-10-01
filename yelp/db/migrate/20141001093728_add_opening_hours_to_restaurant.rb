class AddOpeningHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :opening_hours, :string
  end
end
