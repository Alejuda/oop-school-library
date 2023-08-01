require 'json'
require 'fileutils'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

module SaveData
    def check_file(filename)
      FileUtils.mkdir_p('./data_files')
      FileUtils.touch('./data_files/people.json') if !File.exist?('./data_files/people.json') && filename == 'people'
      FileUtils.touch('./data_files/rentals.json') if !File.exist?('./data_files/rentals.json') && filename == 'rentals'
      FileUtils.touch('./data_files/books.json') if !File.exist?('./data_files/books.json') && filename == 'books'
    end

    def save_books
        books_data = []
        books.each do |book|
          books_data << { title: book.title, author: book.author }
        end
        return if books_data.empty?
    
        check_file('books')
        File.write('./data_files/books.json', JSON.pretty_generate(books_data))
      end
      
end