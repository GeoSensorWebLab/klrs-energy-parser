module KLRSEnergy
  # Summary parses the cell data from the "Summary" sheet in the input data.
  class Summary
    attr_reader :columns

    def initialize(data, options = {})
      @timezone = options[:timezone] || "+00:00"
      @data = data
      parse_columns
      parse_units
      parse_data
    end

    private

    def parse_columns
      names = @data.row(0)
      @columns = names.map do |name|
        Column.new(name)
      end
    end

    def parse_units
      units = @data.row(1)
      units.each_with_index do |unit, i|
        column = @columns.at(i)
        column.units = unit if column
      end
    end

    def parse_data
      @data.each(2) do |row|
        date = row.shift
        time = row.shift
        timestamp = "#{date} #{time} #{@timezone}"
        row.each_with_index do |reading, i|
          column = @columns.at(i+1)
          column << TimeValue.new(timestamp, reading) if column
        end
      end
    end
  end
end
