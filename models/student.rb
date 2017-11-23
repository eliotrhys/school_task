require_relative('../db/sql_runner')
require_relative('./house.rb')

class Student

  attr_reader :id, :first_name, :last_name, :house_id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
  end


  def save
    sql = "INSERT INTO students(
      first_name,
      last_name,
      house_id
    )
    VALUES
    (
      $1, $2, $3
    )
      RETURNING *"
    values = [@first_name, @last_name, @house_id]
    student_data = SqlRunner.run(sql, values)
    @id = student_data[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM students"
    values = []
    student_data = SqlRunner.run(sql, values)
    result = student_data.map {|student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    student_data = SqlRunner.run(sql, values)
    result = Student.new(student_data[0])
    return result
  end

  def return_name
    return "#{@first_name} #{@last_name}"
  end

  def return_house_id
    return "#{@house_id}"
  end

  def house
    sql = "SELECT * FROM houses
      WHERE id = $1"
      values = [@house_id]
      house = SqlRunner.run(sql, values)
      result = House.new(house[0])
    return result
  end

end
