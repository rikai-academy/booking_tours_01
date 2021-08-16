class StaticPagesController < ApplicationController
  def home
    @newtours = Tour.last(3)
    @populartours = Tour.first(6)
  end

  def thanks
  end
end
