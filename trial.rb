require 'csv'

# 1: Print the 3 most commonly used languages and the count of parents for each language.

parents = CSV.parse(File.read("parents.csv"), headers: true)

language = parents["language"].group_by{|x| x}.transform_values{|values| values.count}.sort_by{|k, v| -v}


puts language.first(3)


# avoid doing everything on one line (for each method, do separate variable)
# sort them oppositely, call keys on that --> pull first three keys 


#  2: Print a list of students (student_id, first_name, last_name) who do not have a cell phone number.



students = CSV.parse(File.read("students.csv"), headers: true)

no_cellphone = students.select{|student| student["cellphone"] == nil}.map do |n| "First Name: #{n['FirstName']} Last Name: #{n['LastName']} Student ID: #{n['student_id']}" end 


puts no_cellphone







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

file1_lines = CSV.read("parents.csv")
file2_lines = CSV.read("students.csv")

studentArray = []

newArray=[]

# for i in 0..studentArray.size
#     newArray.push(studentArray[i])
# end



trialArray=[]

for i in 1..file1_lines.size
    # studentArray.push(file1_lines[i][1])
#   puts file1_lines[i][1]
    # puts file1_lines[i][1]
    trialArray.push(file1_lines[i][1])
end

puts trialArray
# for i in 0..file1_lines.size
#   if (file1_lines[0][1] == file2_lines[0][1])
#     puts "Same #{file1_lines[i]}"
#   else
#     puts "#{file1_lines[i]} != #{file2_lines[i]}"
#   end
# end

