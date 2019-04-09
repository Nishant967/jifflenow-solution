# frozen_string_literal: true

require_relative 'student'

# Representing class and other information required about class
class ClassStudent
  attr_accessor :students

  def initialize
    @students = []
  end

  def add(student)
    @students << student unless student.nil?
  end

  def agrade_count
    count_grade('A')
  end

  def bgrade_count
    count_grade('B')
  end

  def cgrade_count
    count_grade('C')
  end

  def calculate_above_students
    count_students_in_category('ABOVE')
  end

  def calculate_below_students
    count_students_in_category('BELOW')
  end

  def calculate_agrade_avg
    calculate_grade_avg('A')
  end

  def calculate_bgrade_avg
    calculate_grade_avg('B')
  end

  def calculate_cgrade_avg
    calculate_grade_avg('C')
  end

  def find_students_category
    avg_a = calculate_agrade_avg
    avg_b = calculate_bgrade_avg
    avg_c = calculate_cgrade_avg
    @students.each do |student|
      student.category = case student.grade
                         when 'A' then compare_average(student.total, avg_a)
                         when 'B' then compare_average(student.total, avg_b)
                         else compare_average(student.total, avg_c)
                         end
    end
  end

  private

  def count_students_in_category(category)
    total_students = 0
    @students.each do |student|
      total_students += 1 if student.category == category
    end
    total_students
  end

  def compare_average(total, grade_average)
    return 'ABOVE' if total > grade_average

    'BELOW'
  end

  def calculate_grade_avg(grade)
    sum = 0.0
    total_students = 0
    @students.each do |student|
      if student.grade == grade
        sum += student.total
        total_students += 1
      end
    end
    return sum / total_students if total_students.positive?

    0
  end

  def count_grade(grade)
    no_of_students = 0
    @students.each do |student|
      no_of_students += 1 if student.grade == grade
    end
    no_of_students
  end
end