require 'csv'


#  2: Print a list of students (student_id, first_name, last_name) who do not have a cell phone number.



students_csv = CSV.parse(File.read("students.csv"), headers: true)

no_cellphone = students_csv.select{|student| student["cellphone"] == nil}.map do |n| "First Name: #{n['FirstName']} Last Name: #{n['LastName']} Student ID: #{n['student_id']}" end 


puts no_cellphone


