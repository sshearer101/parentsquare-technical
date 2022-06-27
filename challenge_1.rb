require 'csv'



# 1: Print the 3 most commonly used languages and the count of parents for each language.

parents_csv = CSV.parse(File.read("parents.csv"), headers: true)


# Groups the languages based on language attribute in a hash.
grouped_languages = parents_csv["language"].group_by{|language| language}

# Counts each of the grouped languages with the language as the key and count as the value.
count_languages = grouped_languages.transform_values{|values| values.count}

# Sorts the languages based on count with the highest values coming first.
sorted_languages = count_languages.sort_by{|k, value| -value}

# Puts the first three languages and their count to the consule. 
puts sorted_languages.first(3)


