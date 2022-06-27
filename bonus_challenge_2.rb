require 'csv'
require 'set'

students_csv = CSV.parse(File.read("students.csv"), headers: true)
staff_csv = CSV.parse(File.read("staff.csv"), headers: true)
parents_csv = CSV.parse(File.read("parents.csv"), headers: true)


# Create arrays of the phone numbers for each of the files and assign them to variables
student_cellphones = []
staff_mobiles = []
parents_mobiles = []

students_csv.filter do |student|
    student_cellphones.push(student["cellphone"])
end

staff_csv.filter do |staff|
    staff_mobiles.push(staff["mobile"])
end

parents_csv.filter do |parent|
    parents_mobiles.push(parent["mobile"])
end

# Create sets of each phone numbers
s1 = student_cellphones.to_set
s2 = staff_mobiles.to_set
s3 = parents_mobiles.to_set

# Find common elements from both arrays using the intersection and creates new variable
# Prints each variable for all the comparative sets
student_staff_numbers = s1.intersection(s2)
student_parent_numbers = s1.intersection(s3)
staff_parent_numbers = s2.intersection(s3)


puts student_staff_numbers
puts student_parent_numbers
puts staff_parent_numbers
