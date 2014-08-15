Before do
  $browser_active ||= false
  unless $browser_active
    $parking_lot = ParkingLot.new
    $browser_active = true
  end
end

at_exit do
  $parking_lot.close
end