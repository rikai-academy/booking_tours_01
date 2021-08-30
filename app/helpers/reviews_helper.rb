module ReviewsHelper
  def addbackclass review
    !review ? 'd-none' : '' 
  end
  def status(review)
    if review.status 
      link_to  hidden_review_path(review), :class => "btn btn-primary", :method=>"put" do
        t("review.index.active")
      end
    else
      link_to  hidden_review_path(review), :class => "btn btn-secondary", :method=>"put" do
        t("review.index.hidden")
      end
    end
  end
end