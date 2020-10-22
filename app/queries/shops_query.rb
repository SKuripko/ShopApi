class ShopsQuery
	def initialize(params)
		@params = params
	end

	def fetch_shops
		items = Shop.select(
			"shops.id, 
			shops.name, 
			shops.sold_book_count, 
			group_concat(books.id) as 'book_id', 
			group_concat(books.book_title) as 'book_title', 
			group_concat(books.copie_count) as 'copie_count',
			group_concat(books.author) as 'author'"
		)
		items = items.joins(:books)
		items = items.where('books.author = ?', @params[:author]) if @params[:author].present?
		items = items.where('books.book_title = ?', @params[:book_title]) if @params[:book_title].present?
		items = items.where('books.id = ?', @params[:book_id]) if @params[:book_id].present?
		items = items.where('shops.name = ?', @params[:shop_name]) if @params[:shop_name].present?

		items = items.group('shops.id, shops.name, shops.sold_book_count')
		items = items.order('shops.sold_book_count DESC')
	end
end
