class ChangeAddColumnNamesRefactorCards < ActiveRecord::Migration[6.1]
  def change
    rename_column :marks, :latitude, :latitude_in
    rename_column :marks, :longitude, :longitude_in
    rename_column :marks, :address, :address_in
    add_column :marks, :latitude_out, :float
    add_column :marks, :longitude_out, :float
    add_column :marks, :address_out, :float
    add_column :marks, :completed, :boolean
  end
end
