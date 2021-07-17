# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  Company.create!(
    name: 'テスト#{n + 1}',
    kana_name: 'テスト#{n + 1}',
    phone_number: '1111111111',
    email: 'test#{n + 1}@test.com',
    website: 'https://github.com/',
    encrypted_password: '111111'
  )
end
