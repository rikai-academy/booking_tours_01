module ReviewsHelper
  def addbackclass review
    !review ? 'd-none' : '' 
  end
end
