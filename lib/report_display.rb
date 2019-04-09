# frozen_string_literal: true

# Displaying reports of class and students
module ReportDisplay
  # Displaying student score

  def self.display_student_score(class_report)
    return if class_report.students.length.zero?

    print "\n\nScore card\n\n"
    print " ID | Subject 1 | Subject 2 | Subject 3 | Subject 4 | Grand-Total | Grade | Average-Compare |\n"
    class_report.students.each do |student|
      printf(" %02d |     %02d    |     %02d    |     %02d    |     %02d    |     %03d     |   %s   |      %s      |\n", student.student_id, student.subject1, student.subject2, student.subject3, student.subject4, student.total, student.grade, student.category)
    end
    print "--------------------------------------------------------------\n\n\n"
  end

  # Displaying class report
  def self.display_class_report(class_report)
    print "------------------------------------------------------------------\n"
    print "Grade report\n"
    print "\nNumber of students in A Grade :: ", class_report.agrade_count
    print "\nNumber of students in B Grade :: ", class_report.bgrade_count
    print "\nNumber of students in C Grade :: ", class_report.cgrade_count
    print "\nNumber of students above their grade average :: ", class_report.calculate_above_students
    print "\nNumber of students below their grade average :: ", class_report.calculate_below_students
    print "\n----------------------------------------------------------------\n"
  end
end