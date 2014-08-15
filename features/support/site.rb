class ParkingLot

  def initialize
    @site = Watir::Browser.new BROWSER.to_sym
    @site.goto WEBSITE
  end

  def close
    @site.close
  end

  def select(location)
    @site.select_list(:id => 'ParkingLot').select location
  end

  def set_date(type, date)
    @site.text_field(:id => "#{type}Date").set(date)
  end

  def set_time(type, time)
    @site.text_field(:id => "#{type}Time").set(time)
  end

  def set_meridian(type, meridian)
    @site.radio(:name => "#{type}TimeAMPM", :value => meridian).set
  end

  def calculate
    @site.button(:name => 'Submit').click
  end

  def get_cost
    @site.span(:class => 'SubHead').text
  end

  def enter_time_for(duration)
    exit_hash = { :year => 2000, :month => 1, :day => 1, :hour => 0, :minute => 0 }
    duration.scan(/(\d+) (\w+)/).each do |time_array|
      units = time_array[0].to_i
      type = time_array[1].downcase
      type.chop! if type.end_with? 's'
      if type == 'week'
        type = 'day'
        units = units * 7
      end
      exit_hash[type.to_sym] = exit_hash[type.to_sym] + units
    end
    exit_date_time = Time.new(exit_hash[:year], exit_hash[:month], exit_hash[:day], exit_hash[:hour], exit_hash[:minute])
    set_date('Starting', '01/01/2000')
    set_time('Starting', '12:00')
    set_meridian('Starting', 'AM')
    set_date('Leaving', exit_date_time.strftime('%m/%d/%Y'))
    set_time('Leaving', exit_date_time.strftime('%l:%M'))
    set_meridian('Leaving', exit_date_time.strftime('%p'))
  end

end