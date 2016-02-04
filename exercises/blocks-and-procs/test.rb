def my_function

  3.times do
    puts yield
  end
end

my_function() do
puts "Hello"
7
end