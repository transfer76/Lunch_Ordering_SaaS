[
  { email: 'exemple@exemple.com', password: '123123' }
].each do |hash|
  User.create!(hash) unless User.exists?(hash.slice(:email))
end

user = User.first
user.add_role :admin

[
  { date: Date.today }
].each do |hash|
  Menu.create!(hash) unless Menu.exists?(hash)
end

[
  { course: :drink, name: 'coke', price: 1 },
  { course: :drink, name: 'pepsi', price: 1 },
  { course: :first_course, name: 'soup', price: 5 },
  { course: :main_course, name: 'meat', price: 10 }
].each do |hash|
  Item.create!(hash) unless Item.exists?(hash)
end
