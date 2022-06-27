require 'csv'

# 7. Print a list of staff members (staff_id, first_name, last_name) who are connected to a section.

sections_csv = CSV.parse(File.read("sections.csv"), headers: true)
staff_csv = CSV.parse(File.read("staff.csv"), headers: true)


# Filters through sections, filters through staff, and matches the staff_ids in each of the arrays. If they match, puts the course name, first name, last name, and staff ID. 
# In the CSV files, no current staff that are associated with sections but if that changes, it should return the results.
sections_csv.filter do |section|
    staff_csv.filter do |staff|
        if (section["staff_id"] == staff["staff_id"])
            puts "#{section["course_name"]} #{staff["first_name"]} #{staff["last_name"]} #{staff["staff_id"]}" 
        end
    end
end



