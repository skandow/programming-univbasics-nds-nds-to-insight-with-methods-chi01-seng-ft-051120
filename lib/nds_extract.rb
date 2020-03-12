$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
    director_total = 0
    inner_len = director_data[row_index][:movies].length
    inner_index = 0
    while inner_index < inner_len do 
      director_total += director_data[row_index][:movies][inner_index][:worldwide_gross]
      inner_index += 1
    end
    director_total
end

def gross_director(director_data, row_index)
    director_total = 0
    inner_len = director_data[row_index][:movies].length
    inner_index = 0
    while inner_index < inner_len do 
      director_total += director_data[row_index][:movies][inner_index][:worldwide_gross]
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
  director_info = nds
  while row_index < director_info.length do 
    director_name = director_info[row_index][:name]
    result[director_name] = gross_director(director_info, row_index)
    row_index += 1
  end 
  result
end
