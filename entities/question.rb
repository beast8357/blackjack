class Question
  def self.ask
    puts "Wanna play once more?"
    puts "1. Yes"
    puts "2. No"
    print "Your input: "
    option = gets.chomp.to_i
  end
end
