module CheckAvailable
  def is_full
    self.cur_amount >= self.tour_amount
  end
end