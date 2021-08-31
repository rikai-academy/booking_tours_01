module ReviewsHelper
  def addbackclass review
    !review ? 'd-none' : '' 
  end

  def state review
    if review.appear?
      link_to t("reviews.show.hide"), check_review_path(review), method: :put, data: { confirm: t("users.index.confirm") }
    else
      link_to t("reviews.show.appear"), check_review_path(review), method: :put, data: { confirm: t("users.index.confirm") }
    end
  end

  def state_cmt comment
    if comment.appear?
      link_to t("reviews.show.hide"), check_comment_path(comment), method: :put, data: { confirm: t("users.index.confirm") }
    else
      link_to t("reviews.show.appear"), check_comment_path(comment), method: :put, data: { confirm: t("users.index.confirm") }
    end
  end
end
