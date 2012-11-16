# Hello World
puts "Hello, World!"

#Index of "Ruby"
puts "Hello, Ruby".index("Ruby")

#Print your name 10 times
10.times { puts "Geoff!" }

#Print "This is the sentance 1" where 1 goes from 1 to 10
10.times { |x| puts "This is sentence number #{x + 1}" }

#Have the user guess a number:
puts "Guess the random number!"

randomNumber = rand(10)
while (input = gets.to_i) != randomNumber
    puts "Too High!" if input > randomNumber
    puts "Too Low!" if input < randomNumber
end

puts "Nicely Done!"
    
