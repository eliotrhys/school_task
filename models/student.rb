require_relative('../db/sql_runner')

class Student

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_name = options['house_name']
  end


  def save
    sql = "INSERT INTO students(
      first_name,
      last_name,
      house_name
    )
    VALUES
    (
      $1, $2, $3
    )
      RETURNING *"
    values = [@first_name, @last_name, @house_name]
    student_data = SqlRunner.run(sql, values)
    @id = student_data[0]['id'].to_i
  end

end
