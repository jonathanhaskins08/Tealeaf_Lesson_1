puts "Welcome to your personal calculator!"

def get_number
  puts "Please enter an integer:"
  num = gets.chomp
  return num
end

def operation_check(operation)
  until %w(1 2 3 4).include?(operation)
    puts "Please enter valid entry:"
    operation = gets.chomp
  end
  operation
end


num1 = get_number
num2 = get_number
puts "The integers you have chosen are #{num1} and #{num2}.\n"
puts "Please choose the operation: \n(1) Add \n(2) Subtract \n(3) Multiply \n(4) Divide"
operation = gets.chomp
operation_check(operation)

case operation
  when "1"
    result = num1.to_i + num2.to_i
  when "2"
    result = num1.to_i - num2.to_i
  when "3"
    result = num1.to_i * num2.to_i
  when "4"
    result = num1.to_f / num2.to_f
end

puts "Your result is: #{result}"