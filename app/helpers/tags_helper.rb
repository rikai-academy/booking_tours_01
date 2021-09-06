module TagsHelper
  def most_week
    popular = TagHelper.this_week.group(:tag_id).order(count_tag_id: :desc).count(:tag_id)
    helper(popular)
  end

  def most_month
    popular = TagHelper.statistic_at(Date.today).group(:tag_id).order(count_tag_id: :desc).count(:tag_id)
    helper(popular)
  end

  def helper popular
    res = []
    popular.each do |k, v|
      res << Tag.find(k)
      break if res.size == 10
    end
    res
  end
end