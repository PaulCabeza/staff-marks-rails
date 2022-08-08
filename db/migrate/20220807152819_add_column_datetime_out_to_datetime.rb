class AddColumnDatetimeOutToDatetime < ActiveRecord::Migration[6.1]
  def change
    add_column :marks, :datetime_out, :datetime
  end
end
