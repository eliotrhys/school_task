require_relative('../models/student.rb')
require_relative('../models/house.rb')

bigglesbury = House.new({
  "house_name" => "The Bigglesbury House"
  })

salami = House.new({
  "house_name" => "The Salami House"
  })


bigglesbury.save
salami.save

student1 = Student.new({
  "first_name" => "Coconut",
  "last_name" => "Head",
  "house_id" => bigglesbury.id
  })

student2 = Student.new({
  "first_name" => "Fuzz",
  "last_name" => "Büthedd",
  "house_id" => bigglesbury.id
  })

student3 = Student.new({
  "first_name" => "William",
  "last_name" => "Loser",
  "house_id" => salami.id
  })


student1.save
student2.save
student3.save
