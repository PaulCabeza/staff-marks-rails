class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.string :mark_type
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
