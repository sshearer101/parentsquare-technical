require 'csv'


# 5. Print a list of sections (section_id, course_name) who do not have any students enrolled.

sections_csv = CSV.parse(File.read("sections.csv"), headers: true)
students_csv = CSV.parse(File.read("students.csv"), headers: true)


puts sections_csv