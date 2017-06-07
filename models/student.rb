require_relative('../db/sql_runner')
require_relative('./house')

class Student

  attr_accessor :first_name, :last_name, :house_id, :age, :id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students ( first_name, last_name, house_id, age) VALUES ( '#{@first_name}', '#{@last_name}', #{@house_id}, #{@age}) RETURNING * ;"
    student = SqlRunner.run(sql)
    @id = student[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = #{id} ;"
    student = SqlRunner.run(sql)
    result = Student.new(student.first())
    return result
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = #{house_id} ;"
    result = SqlRunner.run(sql)
    return House.new(result.first())
  end

  def update(options)
    sql = "UPDATE students SET
    first_name = '#{options['first_name']}',
    last_name = '#{options['last_name']}',
    age = '#{options['age']}',
    house_id = '#{options['house_id']}'
    WHERE id = '#{options['id']}' ;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM students WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


end