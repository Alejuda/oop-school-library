require_relative 'app'

class Run 
  def inicialize ()
    @app = App.new()
  end

  def show_options ()
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def entry_point
    puts 'Welcome to School Library App!'

    loop do
      show_options
      app_choice = gets.chomp.to_i
      options(app_choice)
    end
  end

end
