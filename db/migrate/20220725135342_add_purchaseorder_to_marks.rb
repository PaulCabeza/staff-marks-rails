class AddPurchaseorderToMarks < ActiveRecord::Migration[6.1]
  def change
    add_column :marks, :purchaseorder, :integer
  end
end
