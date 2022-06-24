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



# students = CSV.parse(File.read("students.csv"), headers: true)
# parents = CSV.parse(File.read("parents.csv"), headers: true)


# data1 = students.group_by{|r| r["student_id"]}
# data2 = parents.group_by{|r| r["student_id"]}

# joined_data = data1.keys.sort.map do |student|
#     data1["student_id"].merge(data2["student_id"])
# end

parents_csv = CSV.read("parents.csv")
students_csv = CSV.read("students.csv")


parent_si=[]
student_si=[]

parents_csv.filter do |x|
    parent_si.push(x[1])
end

students_csv.filter do |x|
    student_si.push(x[1])
end

students_with_parents = student_si & parent_si

parents_no_contact = []

parents_csv.filter do |x|
    if(x[4] == nil && x[5] == nil)
        parents_no_contact.push(x[1])
    end
end

# filters through the students, matches them with the parents who have no contact info, returns the necessary student arrtributes that match
students_csv.filter do |x|
    parents_no_contact.filter do |i|
         if(x[1] == i)
            # puts  x[1]
            # puts  x[3]
            # puts  x[4] 
         end
    end
end

# sorted_students = student_si.sort
# sorted_parents = parent_si.sort


# students_csv.filter do |x|
#     parents_csv.filter do |i|
        
#         end
#     end
# end




# spreaded = [...student_si, ...parent_si]
#     spreaded.filter do |x|
#         puts !(student_si.includes(x) && parent_si.includes(x))
#     end

# trial_zip = student_si.zip(parent_si)



# for i in 0..file1_lines.size
#   if (file1_lines[0][1] == file2_lines[0][1])
#     puts "Same #{file1_lines[i]}"
#   else
#     puts "#{file1_lines[i]} != #{file2_lines[i]}"
#   end
# end