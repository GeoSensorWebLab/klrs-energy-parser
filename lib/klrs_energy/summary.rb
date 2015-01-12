module KLRSEnergy
  # Summary parses the cell data from the "Summary" sheet in the input data.
  class Summary
    attr_reader :columns

    def initialize(data)
      @columns = data.row(0)
      @units = data.row(1)
    end
  end
end
