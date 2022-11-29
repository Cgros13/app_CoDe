# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

User.create!(email: 'Allan@example.com', password: 'azerty')
User.create!(email: 'Cgros@example.com', password: 'azerty')
User.create!(email: 'Jojo@example.com', password: 'azerty')
User.create!(email: 'Ines@example.com', password: 'azerty')
