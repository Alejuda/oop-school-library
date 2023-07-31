require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
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
        puts "#{index})- [#{person.class}] Age: #{person.age}, Name: #{person.name}, ID: #{person.id}"
      end
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'No rental mode'
    else
      print 'ID of person: '
      person_id = gets.chomp.to_i
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
    print 'Age: '
    person_age = gets.chomp.to_i
    print 'Name: '
    person_name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    person_permission = gets.chomp.to_s.capitalize
    @people << if person_permission == 'N'
                 Student.new(person_age, classroom: nil, name: person_name, parent_permission: false)
               else
                 Student.new(person_age, classroom: nil, name: person_name, parent_permission: true)
               end
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    person_age = gets.chomp.to_i
    print 'Name: '
    person_name = gets.chomp.to_s.capitalize
    print 'Specialization: '
    person_specialization = gets.chomp.to_s.capitalize
    @people << Teacher.new(person_age, person_specialization, name: person_name)
    puts 'Teacher created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Error: Enter a valid number'
      create_person
    end
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
    book = @books[selected_book]
    puts 'Select a person from the following list by number'
    list_people
    selected_person = gets.chomp.to_i
    person = @people[selected_person]
    print 'Date (DD/MM/YYYY): '
    date = gets.chomp
    @rentals << Rental.new(date, @people[selected_person], @books[selected_book])
  end
end
