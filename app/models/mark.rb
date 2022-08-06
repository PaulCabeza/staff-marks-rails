class Mark < ApplicationRecord
	belongs_to :user

	# private
	# ransacker :purchaseorder do
	# 	table_name = 'marks'
	# 	Arel.sql("to_char(\"#{table_name}\".\"purchaseorder\", '99999')")
	# 	# Arel.sql("CONVERT(marks.purchaseorder, CHAR(8))")
		
	# end

	
end
