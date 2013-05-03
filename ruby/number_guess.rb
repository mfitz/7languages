limit = 100
number = rand(limit)
guess = -1
puts "Guess a number between 1 and #{limit}:"

while guess != number
    guess = Integer(gets)
    if guess < number
        puts "\tNo, higher!"
    elsif guess > number
        puts "\tNo, lower!"
    end
end

puts "Yes, the number was #{guess}"
