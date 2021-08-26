module ToursHelper
  def addcheckclass stars
    @rating && @rating.stars >= stars ? 'text-warning' : ''
  end
  
  def time_helper time
    arr = time.split('/')
    arr[0] + t("bookings.shared.days") + arr[1] + t("bookings.shared.nights")
  end

  def time_short time
    arr = time.split('/')
    arr[0] + t("bookings.shared.day") + arr[1] + t("bookings.shared.night")
  end
end
