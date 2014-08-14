Before do
  $parking_lot = ParkingLot.new
end

After do
  $parking_lot.close
end