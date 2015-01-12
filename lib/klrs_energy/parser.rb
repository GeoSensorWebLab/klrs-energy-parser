module KLRSEnergy
  class Parser
    attr_reader :summary

    def initialize(file, timezone)
      @summary = Summary.new
    end
  end
end
