99.times do |n|
  tour_name = "Tour-#{n+1}"
  description = "Very happy"
  status = true
  tour_amount = 3
  date_begin = "2021-07-30"
  date_end = "2021-07-31"
  price = 500
  Tour.create!(tour_name: tour_name,
  description: description,
  status: status,
  tour_amount: tour_amount,
  date_begin: date_begin,
  date_end: date_end,
  price: price)
  
end
