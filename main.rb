# frozen_string_literal: true

require_relative './lib/student'
require_relative './lib/class_student'
require_relative './lib/report_display'

DATA_ERR_MSG = 'Problem with input content of file. Please check file content!'
FILE_ERR_MSG = 'Problem with input file. Please check file!'

def class_student_creation(input_file)
  class_student = ClassStudent.new
  file = File.open(input_file, 'r')

  file.each_line do |input_record|
    student = student_creation(input_record)
    class_student.add(student)
  end
  file.close
  class_student
end

def student_creation(input_record)
  student_attr = input_record.split(',')
  if student_attr.length != 5
    puts DATA_ERR_MSG
    exit(0)
  end

  id = student_attr[0]
  sub1 = extract_mark(student_attr[1])
  sub2 = extract_mark(student_attr[2])
  sub3 = extract_mark(student_attr[3])
  sub4 = extract_mark(student_attr[4])
  Student.new(id, sub1, sub2, sub3, sub4)
rescue StandardError => e
  puts e.message.to_s
  exit(0)
end

def extract_mark(arg)
  fields = arg.split('-')
  if fields.length != 2 || !(fields[1].strip !~ /\D/)
    puts DATA_ERR_MSG
    exit(0)
  end
  fields[1].to_i
end

input_file = ARGV.first
if input_file.nil? || input_file.length.zero? || !File.file?(input_file.strip) || File.empty?(input_file.strip)
  puts FILE_ERR_MSG
  exit(0)
end

class_student = class_student_creation(input_file)
unless class_student.nil?
  class_student.find_students_category
  ReportDisplay.display_student_score(class_student)
  ReportDisplay.display_class_report(class_student)
end
exit(1)