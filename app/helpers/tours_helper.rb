module ToursHelper
  def addcheckclass stars
    @rating && @rating.stars >= stars ? 'text-warning' : ''
  end
end
