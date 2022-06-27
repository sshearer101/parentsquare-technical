# Do Bonus 2 - do two inner joins
# sets are special type of array, all elements on unique, can't have dupes
# .intersection - will return intersecting points

# take keys that overlap between them
# take column from table 1, make a set, intersection between sets, creating union to make individual set of unique sets


# students = CSV.parse(File.read("students.csv"), headers: true)
# parents = CSV.parse(File.read("parents.csv"), headers: true)


# puts students.left_outer_joins(:parents).distinct.select('mobile.*, COUNT(parents.*) AS parents_count').group('student_id')

# puts students.left_joins(parents).group()

# left_join<-merge(parents, students, by = "student_id", all.x=true)

# together = merge(students, parents, all.student_id = TRUE)
# puts together


# Check if any phone numbers appear in two or more of these files: students.csv, staff.csv, and parents.csv.


require 'csv'


students_csv = CSV.parse(File.read("students.csv"), headers: true)
staff_csv = CSV.parse(File.read("staff.csv"), headers: true)
parents_csv = CSV.parse(File.read("staff.csv"), headers: true)


students_csv.filter do |x|
    staff_csv.filter do |i|
        parents_csv.filter do |a|
            if (x["cellphone"] == i["mobile"] && x["cellphone"] == a["mobile"] || i["mobile"] == a["mobile"] && i["mobile"] == x["cellphone"] || a["mobile"] == i["mobile"] && a["mobile"] == x["cellphone"])
                 
            end
        end
    end
end