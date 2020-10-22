require 'rails_helper'

RSpec.describe Api::ShopsController, :type => :controller do
  describe '#index' do
    it 'should return result in json' do
      2.times do 
        shop = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20)})
      end 

      book_1 = Book.create(
        { 
          author: Faker::Name.middle_name, 
          book_title: Faker::Name.name, 
          copie_count: rand(50), 
          shop_id: 1 
        }
      )

      book_2 = Book.create(
        { 
          author: Faker::Name.middle_name, 
          book_title: Faker::Name.name, 
          copie_count: rand(50), 
          shop_id: 2 
        }
      )
            

      result = get(:index)
      expect(result.body).to include(book_1.book_title)
      expect(result.body).to include(book_2.book_title)
      expect(result.body).to include(book_1.copie_count.to_s)
      expect(result.body).to include(book_2.copie_count.to_s)
    end

    it 'should return one result in json with params author' do 
      shop = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20)})

      book_1 = Book.create(
        { 
          author: Faker::Name.middle_name, 
          book_title: Faker::Name.name, 
          copie_count: rand(50), 
          shop_id: 1 
        }
      )

      book_2 = Book.create(
        { 
          author: Faker::Name.middle_name, 
          book_title: Faker::Name.name, 
          copie_count: rand(50), 
          shop_id: 2 
        }
      )
            

      result = get(:index, params:{ author: book_1.author })
      expect(result.body).to include(book_1.book_title)
      expect(result.body).to include(book_1.copie_count.to_s)
      expect(result.body).to include(shop.name)


      result = get(:index, params:{ shop_id: shop.id})
      expect(result.body).to include(shop.id.to_s)
      expect(result.body).to include(shop.name)
      expect(result.body).to include(book_1.author)
      expect(result.body).to include(book_1.book_title)
    end    
  end
end
