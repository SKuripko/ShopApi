5.times do
  shops = Shop.create({ name: Faker::Name.name, sold_book_count: rand(20) })
end

20.times do
  books = Book.create({author: Faker::Name.middle_name, book_title: Faker::Name.name, copie_count: rand(50)})
end
