require 'csv'


# 6. Print a list of sections and the students in each section (section_id, course_name, student_ids).

sections_csv = CSV.parse(File.read("sections.csv"), headers: true)
rosters_csv = CSV.parse(File.read("rosters.csv"), headers: true)


rosters_section_ids = rosters_csv["section_id"]
sections_section_ids = sections_csv["section_id"]



# language = parents_csv["language"].group_by{|x| x}.transform_values{|values| values.count}.sort_by{|k, v| -v}

sortedRoster = rosters_csv["section_id"].sort


# sections_csv.filter do |x|
#    sortedRoster.filter do |i|
#         puts x["section_id"]
#         puts x["course_name"]
#         puts i
#     end
# end



# .transform_values{|values| values.count}
