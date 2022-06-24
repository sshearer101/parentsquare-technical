require 'csv'
require 'set'



1: Print the 3 most commonly used languages and the count of parents for each language.

parents = CSV.parse(File.read("parents.csv"), headers: true)

p parents
language = parents["language"].group_by{|x| x}.transform_values{|values| values.count}.sort_by{|k, v| -v}


puts language.first(3)


avoid doing everything on one line (for each method, do separate variable)
sort them oppositely, call keys on that --> pull first three keys 
