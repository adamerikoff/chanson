# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "luke2", password: "12345")
User.create(username: "admin", password: "admin", admin_status: true)


Genre.create(name: "rap")
Genre.create(name: "rock")
Genre.create(name: "pop")
Genre.create(name: "classic")
Genre.create(name: "punk")
Genre.create(name: "jazz")
Genre.create(name: "rap")