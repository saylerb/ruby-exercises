require 'pry'
class Student
  attr_reader :grade

  def initialize
    @grades = ['F', 'D', 'C', 'B', 'A']
    @grade = 'C'
  end

  def study
   @grade = upgrade_grade(@grade)
  end

  def index_grade(grade)
    @grades.index(grade) 
  end

  def upgrade_grade(grade)
    index = index_grade(grade)
    unless index == @grades.length - 1 
      @grades[index + 1]
    else
      @grade
    end
  end

  def slack_off
    @grade = downgrade_grade(@grade)
  end

  def downgrade_grade(grade)
    index = index_grade(grade)
    unless index == 0
      @grade = @grades[index - 1]
    else
      @grade
    end
  end

end
