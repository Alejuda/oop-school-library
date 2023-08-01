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

    
end