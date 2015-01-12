require 'spreadsheet'

module KLRSEnergy
  # Parser will take an input file and retrieve the Excel data from specific
  # Excel sheets for separate parsing.
  class Parser
    attr_reader :summary

    def initialize(file, timezone)
      Spreadsheet.client_encoding = 'UTF-8'
      book = Spreadsheet.open(file)
      @summary = Summary.new(book.worksheet 'Summary')
    end
  end
end
