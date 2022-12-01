class AddColumnToVisits < ActiveRecord::Migration[7.0]
  def change
    add_column :visits, :cleaner_than, :float
  end
end
