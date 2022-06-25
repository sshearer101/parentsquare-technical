require 'csv'
# require 'set'





# 4 join students and parents on Student ID
# Use Inner join (keep data where value matches both)
# Left join, keeps everything in first table as well as middle 
    # null condition for contact info
    # make note --> can simplify since single expression can complement both conditions



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



# Parse the csv files
parents_csv = CSV.parse(File.read("parents.csv"), headers: true)
students_csv = CSV.parse(File.read("students.csv"), headers: true)


# storing the student IDs in an array
student_ids=[]

students_csv.filter do |x|
    student_ids.push(x["student_id"])
end

parents_no_contact = []
parents_with_contact=[]

# Storing parents with no contact information in an array

parents_csv.filter do |x|
    if(x["email"] == nil && x["mobile"] == nil )
        parents_no_contact.push(x[1])
    end
end

# Storing student_ids of parents with some type of contact information in an array

parents_csv.filter do |x|
    if(x["email"] != nil || x["mobile"] != nil )
        parents_with_contact.push(x[1])
    end
end

# Comparing the student IDs to the parents with contact information, and returning remaining students with no parents

students_with_no_parents = student_ids - parents_with_contact


students_csv.filter do |x|
    students_with_no_parents.filter do |i|
        if(x["student_id"] == i)
            puts "#{x["student_id"]} #{x["FirstName"]} #{x["LastName"]}"
        end
    end
end

# filters through the students, matches them with the parents who have no contact info, returns the necessary student arrtributes that match
students_csv.filter do |x|
    parents_no_contact.filter do |i|
         if(x["student_id"] == i)
            puts "#{x["student_id"]} #{x["FirstName"]} #{x["LastName"]}"
         end
    end
end


