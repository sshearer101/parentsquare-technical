require 'csv'


# 5. Print a list of sections (section_id, course_name) who do not have any students enrolled.

sections_csv = CSV.parse(File.read("sections.csv"), headers: true)
rosters_csv = CSV.parse(File.read("rosters.csv"), headers: true)

# Capture the section ids of the rosters and sections
rosters_section_ids = rosters_csv["section_id"]
sections_section_ids = sections_csv["section_id"]

# Compare the arrays and eliminate instances of sections that have students rostered
no_students_enrolled_sections =  sections_section_ids - rosters_section_ids

# Filter through all the sections and match them with the sections that have no students, and return the values of those sections
# Currently there are no sections without students, but if that changes, this should return the correct results.
sections_csv.filter do |section|
    no_students_enrolled_sections.filter do |x|
        if(section["section_id"] == x)
            puts "#{section["school_id"]} #{section["section_id"]} #{section["staff_id"]} #{section["course_name"]}"
        end
    end
end


