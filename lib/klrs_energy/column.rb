module KLRSEnergy
  # Column is a set of data for a specific observed property.
  class Column
    attr_accessor :data, :name, :units

    def initialize(name, units = "")
      @name = name
      @units = units
      @data = []
    end

    def << time_value
      @data.push(time_value)
    end
  end
end
