class AddStaffToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :staff, :boolean, default: false
  end
end
