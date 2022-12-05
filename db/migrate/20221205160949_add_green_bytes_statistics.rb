class AddGreenBytesStatistics < ActiveRecord::Migration[7.0]
  def change
    add_column :visits, :green, :boolean
    add_column :visits, :bytes, :integer
    add_column :visits, :statistics, :jsonb
  end
end
