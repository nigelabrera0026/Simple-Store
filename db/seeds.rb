# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"
# Seed products with associated categories
CSV.foreach(Rails.root.join("db", "products.csv"), headers: true) do |row|
  # Find or create the category
  category = Category.find_or_create_by(name: row["category"])

  # Create the product with the associated category
  category.products.create(
    title: row['name'],
    description: row['description'],
    price: row['price'],
    stock_quantity: row['stock quantity']
  )
end

# Generate fake data with Faker
# require "faker"
# 676.times do
#   Product.create(
#     title:          Faker::Commerce.product_name,
#     description:    Faker::Lorem.paragraph,
#     price:          Faker::Commerce.price(range: 0..999.9, as_string: false),
#     stock_quantity: Faker::Number.between(from: 0, to: 9999)
#   )
# end
