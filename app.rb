require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    puts "Welcome to School Library App!"
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: '#{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, AGE: #{person.age}"
    end
  end

  def list_rentals
    p "ID of person: "
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" unless rental.person.id != person_id
    end
  end

  def create_person
    p 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      p "Age: "
      person_age = gets.chomp.to_i
      p "Name: "
      person_name = gets.chomp.to_s
      p "Has parent permission? [Y/N]: "
      person_permission = gets.chomp.to_s.capitalize
      if person_permission == 'N'
        @people << Student.new(person_age, classroom: nil, name: person_name, parent_permission: false)
      else
        @people << Student.new(person_age, classroom: nil, name: person_name, parent_permission: true)
      end
      puts 'Student created successfully'
    when 2
      p 'Age: '
      person_age = gets.chomp.to_i
      p "Name: "
      person_name = gets.chomp.to_s
      p "Specialization: "
      person_specialization = gets.chomp.to_s
      @people << Teacher.new(age = person_age, name = person_name, specialization = specialization)
      puts 'Teacher created successfully'
    else
      p 'Error: Enter a valid number'
      create_person
    end
  end
end
