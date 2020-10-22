class ShopsPresenter
  def initialize(result)
    @result = result
  end

  def as_json
    @result.map do |item|
      {
        id:               item.id,
        name:             item.name,
        books_sold_count: item.sold_book_count,
        books_in_stock:   prepare_book(item.book_id, item.book_title, item.copie_count, item.author)  
      }  
    end
  end

  def prepare_book(book_ids, book_titles, copie_counts, authors)
    books_in_stock = []
    id     = book_ids.split(',')
    title  = book_titles.split(',')
    copie  = copie_counts.split(',')
    author = authors.split(',')

    id.each_with_index do |value, index|
      books_in_stock << { 
        id:             value.to_i, 
        author:         author[index], 
        title:          title[index], 
        copie_in_stock: copie[index].to_i 
      }
    end       
    books_in_stock
  end 
end
