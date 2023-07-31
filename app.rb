require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative "user_data"

class App

  include UserData

  def initialize
    puts 'Welcome to School Library App!'
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts
      puts 'No books found'
    else
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts
      puts 'No people found'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Age: #{person.age}, Name: #{person.name}, ID: #{person.id}"
      end
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'No rental mode'
    else
      person_id = get_rental_id
      person_rentals = @rentals.select { |rental| rental.person.id == person_id }
      if person_rentals.empty?
        puts 'Person ID not found'
      else
        person_rentals.each do |list|
          puts "Date: #{list.date}, Books: #{list.book.title} written by Author: #{list.book.author}"
        end
      end
    end
  end

  def create_student
    data = get_students_info
    @people << if data[2] == 'N'
                 Student.new(data[0], classroom: nil, name: data[1], parent_permission: false)
               else
                 Student.new(data[0], classroom: nil, name: data[1], parent_permission: true)
               end
    puts 'Student created successfully'
  end

  def create_teacher
    data = get_teacher_info
    @people << Teacher.new(data[0], data[2], name: data[1])
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp.to_s.capitalize
    print 'Author: '
    book_author = gets.chomp.to_s.capitalize
    @books << Book.new(book_title, book_author)
    puts 'Book created succesfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    selected_book = gets.chomp.to_i
    @books[selected_book]
    puts 'Select a person from the following list by number'
    list_people
    selected_person = gets.chomp.to_i
    @people[selected_person]
    print 'Date (DD/MM/YYYY): '
    date = gets.chomp
    @rentals << Rental.new(date, @people[selected_person], @books[selected_book])
  end
end
