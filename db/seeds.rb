# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'toto@gmail.com', 
  name: 'Toto', 
  password: '123456', 
  password_confirmation: '123456',
  role: User.roles[:admin])

User.create(email: 'dean@gmail.com', 
  name: 'Dean', 
  password: "password", 
  password_confirmation: "password")


10.times do |x|
  project = Project.create(title: "Title #{x}", 
                body: "Body #{x} Words go here Idk", 
                user_id: User.first.id)

5.times do |y|
  Discussion.create(body: "Discussion #{y}",
                user_id: User.second.id,
                project_id: project.id)
  end
end


