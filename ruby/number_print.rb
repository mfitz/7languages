# Print the contents of an array of sixteen numbers, four numbers at a time, using just each

nums = (1..16).to_a

# first attempt with each method
index = 1
nums.each do |num|
    if index % 4 == 0
        print " #{nums[index - 4]}, " 
        print " #{nums[index - 3]}, " 
        print " #{nums[index - 2]}, " 
        print " #{nums[index - 1]} "
        puts ""
    end
    index += 1
end

# more concise second attempt with each method
index = 0
nums.each do |num|
    p nums[index, 4] if index % 4 == 0
    index += 1
end

# Now, do the same with each_slice in Enumerable 
nums.each_slice(4){|slice| p slice}

