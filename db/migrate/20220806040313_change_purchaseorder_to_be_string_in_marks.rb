class ChangePurchaseorderToBeStringInMarks < ActiveRecord::Migration[6.1]
  def change
    change_column :marks, :purchaseorder, :string
  end
end
