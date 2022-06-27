require 'csv'


#  2: Print a list of students (student_id, first_name, last_name) who do not have a cell phone number.

students_csv = CSV.parse(File.read("students.csv"), headers: true)


# Select all students in array whose attribute of cellphone equals nil
selected_students = students_csv.select{|student| student["cellphone"] == nil}

# Map through students, and return their first name, last name, and student ID.
students_no_cellphones = selected_students.map do |student| "First Name: #{student['FirstName']} Last Name: #{student['LastName']} Student ID: #{student['student_id']}" end 

puts students_no_cellphones

