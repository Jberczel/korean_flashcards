class FlashCard

  def initialize
    # prompts user to select type of dictionary
    @dict = select_dict
    @correct = 0
  end

  # starts the game
  def play
    puts '----------------'
    puts 'KOREAN FLASHCARD'
    puts '----------------'
    print 'How many words would you like to review [1-100]: '
    input = gets.chomp.to_i

    sample = Hash[@dict.to_a.sample(input)]
    ask_questions(sample)
    print_results(sample)
  end

  # select korean-to-english or english-to-korean dictionary
  def select_dict
    user_input = -1
    until (user_input == 1 || user_input == 2)
        print "Korean to English [press 1] or English to Korean [press 2]: " 
        user_input = gets.chomp.to_i
    end
    user_input == 1 ? import_dict('korean') : import_dict('english')
  end

  # import words from text file (scraped from korean website: top 100 words)
  def import_dict(lang)
    f = File.open("ko_dict.txt", 'r')
    dict = {}
    while !f.eof?
       line = f.readline
       words = line.split(',')
       words[1] = words[1].strip
       lang == 'korean' ? dict[words[0]] = words[1] : dict[words[1]] = words[0]
    end
    dict
  end

  # loop through dictionary and prompt user for answers
  def ask_questions(dict)
    dict.each_with_index do |(key, val), i|   
      print "Question #{i+1}: #{key} is "
      input = gets.chomp
      
      if check_answer(input, val) 
         puts "Correct! #{@correct} of #{i+1} correct.\n\n"
      else
        print "Sorry, the correct answer is #{val}." 
        print " #{@correct} of #{i+1} correct.\n\n"
      end
    end
  end

  def check_answer(input, val)
     @correct += 1 if (input == val)   
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













