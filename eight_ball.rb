require "colorize"

@answers =
[
"It is certain",
"It is decidedly so",
"As I see it, yes",
"Most likely",
"Outlook good",
"Yes",
"Signs point to yes",
"Reply hazy try again",
"Ask again later",
"Better not tell you now",
"Cannot predict now",
"Concentrate and ask again",
"My sources say no",
"Outlook not so good",
"Very doubtful"
]

@new_answers = @answers.clone

  def puts_git(cmd)
    puts `git #{cmd} -h`      
    menu     
  end   

  def menu
    puts "What would you like to ask the Magic 8 Ball: ".colorize(:cyan)
    puts "1) What would you like to ask?".colorize(:yellow)
    puts "2) Add your own answer ".colorize(:yellow)
    puts "3) See all available answers".colorize(:yellow)
    puts "4) Reset answers to default".colorize(:yellow)
    puts "5) Exit".colorize(:yellow)
    choice = gets.to_i
  
    case choice #add other puts from menu and define methiods 
    when 1
      print "Question:".colorize(:green)
      input = gets.chomp
      puts "Let me think about it.....".colorize(:green)
      sleep (2)
      random_answers
      sleep 2
      menu
    when 2 
      add_answer
    when 3
      show_answers
    when 4  
      default_answers 
    
    when 5
      puts "Thanks for playing!".colorize(:red)
      sleep (3)
      print `clear`
      exit
    end
  end

  def random_answers
    puts @answers.sample
    
  end

  def add_answer
    puts "Enter your answer".colorize(:blue)
    input = gets.strip
    if @answers.include?(input)
      puts "Invalid entry".colorize(:red)
    else 
    @new_answers << input
    puts "Your answer has been added!".colorize(:blue)
    menu
  end  
end

  def show_answers
    @new_answers.each_with_index do |answer, index|
      puts "#{index + 1}) #{answer}"
    end
    sleep 3
      menu  
  end  
  

  def default_answers
    @new_answers = @answers
    puts "Answers have been reset".colorize(:blue)
    menu
  end  

  menu