class AddEndTimeToVisit < ActiveRecord::Migration[7.0]
  def change
    add_column :visits, :end_time, :timestamp
  end
end
