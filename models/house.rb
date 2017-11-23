require_relative('../db/sql_runner')

class House

  attr_reader :id, :house_name

  def initialize(options)
    @id = options['id'].to_i
    @house_name = options['house_name']
  end


  def save
    sql = "INSERT INTO houses(
      house_name
    )
    VALUES
    (
      $1
    )
      RETURNING *"
    values = [@house_name]
    house_data = SqlRunner.run(sql, values)
    @id = house_data[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM houses"
    values = []
    house_data = SqlRunner.run(sql, values)
    result = house_data.map {|house| House.new(house)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    house_data = SqlRunner.run(sql, values)
    result = House.new(house_data[0])
    return result
  end


end
