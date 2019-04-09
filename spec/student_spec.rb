# frozen_string_literal: true

require './lib/student'

describe Student do

    it 'instantiates student with subject marks with total less than 300' do
      student = Student.new(1, 50, 70, 60, 80)
      expect(student.student_id).to eq 1
      expect(student.subject1).to eq 50
      expect(student.subject2).to eq 70
      expect(student.subject3).to eq 60
      expect(student.subject4).to eq 80
      expect(student.total).to eq 260
      expect(student.grade).to eq 'C'
    end

    it 'instantiates student with subject marks with total less than 340 and greater than 300' do
      student = Student.new(1, 90, 85, 75, 80)
      expect(student.student_id).to eq 1
      expect(student.subject1).to eq 90
      expect(student.subject2).to eq 85
      expect(student.subject3).to eq 75
      expect(student.subject4).to eq 80
      expect(student.total).to eq 330
      expect(student.grade).to eq 'B'
    end

    it 'instantiates student with subject marks with total greater than equal to 340' do
      student = Student.new(1, 95, 85, 75, 85)
      expect(student.student_id).to eq 1
      expect(student.subject1).to eq 95
      expect(student.subject2).to eq 85
      expect(student.subject3).to eq 75
      expect(student.subject4).to eq 85
      expect(student.total).to eq 340
      expect(student.grade).to eq 'A'
    end
end