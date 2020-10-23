require 'rails_helper'

RSpec.describe Api::ShopsController, :type => :controller do
  describe '#index' do
    it 'should return result in json' do 
      shop_1 = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20)})

      shop_2 = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20)})

      book_1 = Book.create(
        { 
          author: Faker::Name.middle_name, 
          book_title: Faker::Name.name, 
          copie_count: rand(50), 
          shop_id: shop_1.id
        }
      )

      book_2 = Book.create(
        { 
          author: Faker::Name.middle_name, 
          book_title: Faker::Name.name, 
          copie_count: rand(50), 
          shop_id: shop_2.id 
        }
      )

      result = get(:index)
      expect(result.body).to include(book_1.book_title)
      expect(result.body).to include(book_2.book_title)
      expect(result.body).to include(book_1.copie_count.to_s)
      expect(result.body).to include(book_2.copie_count.to_s)
      

      result = get(:index, params:{ author: book_1.author })
      expect(result.body).to include(book_1.book_title)
      expect(result.body).to include(book_1.copie_count.to_s)
      expect(result.body).to include(shop_1.name)


      result = get(:index, params:{ shop_id: shop_1.id})
      expect(result.body).to include(shop_1.id.to_s)
      expect(result.body).to include(shop_1.name)
      expect(result.body).to include(book_1.author)
      expect(result.body).to include(book_1.book_title)

      result = get(:index, params:{ shop_name: shop_1.name})
      expect(result.body).to include(shop_1.id.to_s)
      expect(result.body).to include(shop_1.name)
      expect(result.body).to include(book_1.author)
      expect(result.body).to include(book_1.book_title) 
      
      result = get(:index, params:{ book_title: book_2.book_title})
      expect(result.body).to include(shop_2.id.to_s)
      expect(result.body).to include(shop_2.name)
      expect(result.body).to include(book_2.author)
      expect(result.body).to include(book_2.book_title)
    end    
  end
end
