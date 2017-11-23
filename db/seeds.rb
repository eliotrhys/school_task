require_relative('../models/student.rb')

student1 = Student.new({
  "first_name" => "Coconut",
  "last_name" => "Head",
  "house_name" => "The Bigglesbury House"
  })

student2 = Student.new({
  "first_name" => "Fuzz",
  "last_name" => "Büthedd",
  "house_name" => "The Bigglesbury House"
  })

student3 = Student.new({
  "first_name" => "William",
  "last_name" => "Loser",
  "house_name" => "The Salami House"
  })



student1.save
student2.save
student3.save
