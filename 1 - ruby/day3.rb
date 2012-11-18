#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---


# Modified for Homework 3
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
        read 
    end

    def each
        @csv_contents.each { |raw_data|
            row = CsvRow.new(@headers, raw_data)
            yield row
        }
    end
  end
end

class CsvRow

    def initialize(headers, data)
        @data = {}
        headers.zip(data) { |h,d| @data[h.downcase] = d }
    end

    def method_missing (column_name)
        @data[column_name.to_s.downcase]
    end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new

m.each { |row| puts row.Name }
