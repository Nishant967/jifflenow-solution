# frozen_string_literal: true

# Representing student of the class and associated parameters with each student
class Student
  attr_accessor :student_id, :subject1, :subject2, :subject3
  attr_accessor :subject4, :total, :grade, :category

  def initialize(s_id, sub1, sub2, sub3, sub4)
    @student_id = s_id
    @subject1 = sub1
    @subject2 = sub2
    @subject3 = sub3
    @subject4 = sub4
    @total = calculate_total
    @grade = calculate_grade
    @category = ''
  end

  def calculate_grade
    return 'A' if @total >= 340
    return 'B' if @total >= 300 && @total < 340

    'C'
  end

  def calculate_total
    @total = @subject1 + @subject2 + @subject3 + @subject4
  end


end