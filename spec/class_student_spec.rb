# frozen_string_literal: true

require './lib/class_student'

describe ClassStudent do
  it 'instantiates class with some students' do
    student1 =  Student.new(1, 50, 70, 60, 80)
    student2 =  Student.new(2, 90, 80, 60, 80)
    student3 =  Student.new(3, 70, 50, 70, 98)
    student4 =  Student.new(4, 90, 80, 90, 90)
    class_student = ClassStudent.new
    class_student.add(student1)
    class_student.add(student2)
    class_student.add(student3)
    class_student.add(student4)
    expect(class_student.students.length).to eq 4
    expect(class_student.calculate_above_students).to eq 0
    expect(class_student.calculate_below_students).to eq 0
    expect(class_student.calculate_agrade_avg).to eq 350.0
    expect(class_student.calculate_bgrade_avg).to eq 310.0
    expect(class_student.calculate_cgrade_avg).to eq 274.0
    expect(class_student.agrade_count).to eq 1
    expect(class_student.bgrade_count).to eq 1
    expect(class_student.cgrade_count).to eq 2
    expect(class_student.find_students_category.class).to eq Array
    expect(class_student.find_students_category.length).to eq 4
  end

  it 'instantiates class without student data' do
    class_student = ClassStudent.new
    expect(class_student.students.length).to eq 0
    expect(class_student.calculate_above_students).to eq 0
    expect(class_student.calculate_below_students).to eq 0
    expect(class_student.calculate_agrade_avg).to eq 0.0
    expect(class_student.calculate_bgrade_avg).to eq 0.0
    expect(class_student.calculate_cgrade_avg).to eq 0.0
    expect(class_student.agrade_count).to eq 0
    expect(class_student.bgrade_count).to eq 0
    expect(class_student.cgrade_count).to eq 0
    expect(class_student.find_students_category.class).to eq Array
    expect(class_student.find_students_category.length).to eq 0
  end
end