require 'faker'

puts "Destroying restaurants..."
Restaurant.destroy_all

puts "Creating restaurants.."

10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    city: Faker::Address.city
  )
end

puts "Done!"
