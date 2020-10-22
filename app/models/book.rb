class Book < ApplicationRecord
	self.table_name = 'books'

	belongs_to :shop
end
