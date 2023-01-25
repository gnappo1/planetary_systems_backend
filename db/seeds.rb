puts "Destroying existing objects!"
Planet.delete_all
System.delete_all
User.delete_all

puts "Creating two users"
u1 = User.create(username: "matteo", email: "matteo@gmail.com", password: "password")
u2 = User.create(username: "matt", email: "matt@gmail.com", password: "password")

puts "Creating the first system for the first user, along with three planets"
s1 = u1.created_systems.create(name: "Solar")
s1.planets.create(name: "Earth")
s1.planets.create(name: "Venus")
s1.planets.create(name: "Mars")

puts "Creating the second system for the second user, along with three planets"

s2 = u1.created_systems.create(name: "Alpha Centauri")
s2.planets.create(name: "Alpha Centauri B")
s2.planets.create(name: "Alpha Centauri D")

puts "Done! ✅"