require 'csv'

parents_csv = CSV.parse(File.read("parents.csv"), headers: true)
students_csv = CSV.parse(File.read("students.csv"), headers: true)


# Storing the student IDs in an array
student_ids=[]

students_csv.filter do |student|
    student_ids.push(student["student_id"])
end

parents_no_contact = []
parents_with_contact=[]

# Storing parents with no contact information in an array
parents_csv.filter do |parent|
    if(parent["email"] == nil && parent["mobile"] == nil )
        parents_no_contact.push(parent["student_id"])
    end
end

# Storing student_ids of parents with some type of contact information in an array
parents_csv.filter do |parent|
    if(parent["email"] != nil || parent["mobile"] != nil )
        parents_with_contact.push(parent["student_id"])
    end
end

# Comparing the student IDs to the parents with contact information, and returning remaining students with no parents
students_with_no_parents = student_ids - parents_with_contact

students_csv.filter do |student|
    students_with_no_parents.filter do |x|
        if(student["student_id"] == x)
            puts "#{student["student_id"]} #{student["FirstName"]} #{student["LastName"]}"
        end
    end
end

# Filters through the students, matches them with the parents who have no contact info, returns the necessary student arrtributes that match
students_csv.filter do |student|
    parents_no_contact.filter do |x|
         if(student["student_id"] == x)
            puts "#{student["student_id"]} #{student["FirstName"]} #{student["LastName"]}"
         end
    end
end


