module CommentsHelper
  def statuscomment(comment)
    if comment.status 
      link_to  hidden_comment_path(comment), :class => "btn btn-primary", :method=>"put" do
        t("comment.index.active")
      end
    else
      link_to  hidden_comment_path(comment), :class => "btn btn-secondary", :method=>"put" do
        t("comment.index.hidden")
      end
    end
  end
end