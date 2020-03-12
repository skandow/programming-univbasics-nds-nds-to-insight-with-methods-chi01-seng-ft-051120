$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
    director_total = 0
    inner_len = director_data[:movies].length
    inner_index = 0
    while inner_index < inner_len do 
      director_total += director_data[:movies][inner_index][:worldwide_gross]
      inner_index += 1
    end
    director_total
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  result = {}
  row_index = 0
  while row_index < nds.length do 
    director_name = nds[row_index][:name]
    director_info = nds[row_index]
    result[director_name] = gross_for_director(director_info)
    row_index += 1
  end 
  result
end
