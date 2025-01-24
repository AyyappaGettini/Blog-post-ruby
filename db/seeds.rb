# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user=User.where(email: "ayyappag8876@gmail.com").first_or_initialize

user.update!(
   password: "vijay@123",
   password_confirmation: "vijay@123"
)

100.times do |i|
  BlogPost.where(title: "Blog Post #{i}").delete_all
end
