require 'byebug'
# your code goes here
def begins_with_r(collection)
  collection.all? {|element| element.start_with?("r")}
end

def contain_a(collection)
  collection.select {|element| element.include?("a")}
end

def first_wa(collection)
  collection.find {|element| element.is_a?(String) && element.start_with?("wa")}
end

def remove_non_strings(collection)
  collection.delete_if {|element| !element.is_a?(String)}
end

def count_elements(collection)
  count_hash = Hash.new(0)
  answer_array = []
  collection.each { |element| count_hash[element] += 1}
  collection.each do |element|
    #debugger
    element.each do |key,value|
      answer_array << {key => value, :count => count_hash[element]} unless answer_array.include?({key => value, :count => count_hash[element]})
    end
  end
  answer_array
end

#p count_elements([{:name => "blake"}, {:name => "blake"}, {:name => "ashley"}])

def merge_data(data1, data2)
  answer_array = []

  #debugger
  data1.each do |elements1|
    index1 = data1.index(elements1)
    hash = Hash.new
    elements1.each do |label, name|
      data2.each do |elements2|
        hash[label] = name
        #debugger if index1 == 1
        elements2.each do |name2, stats|
          if name == name2
            stats.each do |key,value|
              hash[key] = value
            end
          end
          answer_array << hash
        end
      end
    end
  end
  #debugger
  answer_array.uniq
end

def find_cool(input)
  answer_array = []
  #debugger
  input.each do |element|
    element.each do |key,value|
      answer_array << element if value == "cool"
    end
  end
  answer_array
end

def organize_schools(schools)
  #debugger
  answer_hash = Hash.new([])        #default with empty array as value

  schools.each do |school_name, data|
    #debugger
    data.each do |location, city|
      if answer_hash.include?(city)
        answer_hash[city] << school_name
      else
        answer_hash[city] = [school_name]
      end
    end
  end
  answer_hash
end
