shop_1 = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20) })
shop_2 = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20) })
shop_3 = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20) })
shop_4 = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20) })
shop_5 = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20) })


5.times do
  books = Book.create(
  	{
  		author: Faker::Name.middle_name, 
  		book_title: Faker::Name.name, 
  		copie_count: rand(50),
  		shop_id: shop_1.id
  	})
end

5.times do
  books = Book.create(
  	{
  		author: Faker::Name.middle_name, 
  		book_title: Faker::Name.name, 
  		copie_count: rand(50),
  		shop_id: shop_2.id
  	})
end

5.times do
  books = Book.create(
  	{
  		author: Faker::Name.middle_name, 
  		book_title: Faker::Name.name, 
  		copie_count: rand(50),
  		shop_id: shop_3.id
  	})
end

5.times do
  books = Book.create(
  	{
  		author: Faker::Name.middle_name, 
  		book_title: Faker::Name.name, 
  		copie_count: rand(50),
  		shop_id: shop_4.id
  	})
end

5.times do
  books = Book.create(
  	{
  		author: Faker::Name.middle_name, 
  		book_title: Faker::Name.name, 
  		copie_count: rand(50),
  		shop_id: shop_5.id
  	})
end
