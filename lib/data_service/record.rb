module DataService
  class Record
    require 'securerandom'

    attr_reader :uid, :id, :reading, :datetime, :extra, :date
    def initialize(date, value, extra = {})
      @uid = SecureRandom.hex(16)
      @date = parse_date(date.strip)

      @id = @date.to_time.utc.strftime('%Y-%m-%dT%H:%M:%S')
      @reading = value
      @datetime = @date.strftime('%a %b %e %H:%M:%S %:z %Y')
      @extra = extra
    end

    def parse_date(date)
      if date =~ /\d+\/\d+\/\d+ \d+:\d+:\d+ (AM|PM)?+/
        DateTime.strptime(date, '%m/%d/%Y %l:%M:%S %p %z')
      else
        raise "Unknown date format: #{date}"
      end
    end

    def to_hash
      @extra.merge({
        uid: @uid,
        id: @id,
        reading: @reading,
        datetime: @datetime
      })
    end
  end
end
