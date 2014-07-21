class FlashCard

  def initialize
    # TODO: load from file
    @korean_dict = {
      "사과" => "apple",
      "맥주" => "beer",
      "책" => "book",
      "의자" => "chair",
      "피아노" => "piano"
    }
    @english_dict = @korean_dict.invert
    @correct = 0
  end


  def play
    puts '----------------'
    puts 'KOREAN FLASHCARD'
    puts '----------------'

    dict = pick_dict
    ask_questions(dict)
    print_results(dict)
  end


  # select korean-to-english or english-to-korean dictionary
  def pick_dict
    user_input = -1
    until (user_input == 1 || user_input == 2)
        print "Korean to English [press 1] or English to Korean [press 2]: " 
        user_input = gets.chomp.to_i
    end
    user_input == 1 ? @korean_dict : @english_dict
  end


  # loop through dictionary and prompt user for answers
  def ask_questions(dict)
    dict.each_with_index do |(key, val), i|   
      print "Question #{i+1}: #{key} is "
      input = gets.chomp
      check_answer(input, val, i)    
    end
  end


  # check if user input matches correct translation
  def check_answer(input, val, index)
    if (input == val)
      @correct += 1
      puts "Correct! #{@correct} of #{index+1} correct.\n\n" 
    else
      print "Sorry, the correct answer is #{val}." 
      print " #{@correct} of #{index+1} correct.\n\n"
    end
  end


  def print_results(dict)
    puts "-------------------------------------"
    puts "Your final score: #{@correct} of #{dict.length}."
    puts "Below is a list of words in the quiz: "
    dict.each { |key, val| puts "#{key} --- #{val}" }
    puts "-------------------------------------\n\n"
  end

end


##################
# Runs Program
##################

fc = FlashCard.new
fc.play













