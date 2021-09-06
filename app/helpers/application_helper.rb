module ApplicationHelper
  
  # Return the full title on a per-page basis
  def full_title(page_title = '')
    base_title = t("global.name")
    if base_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def message notification
    case notification.action
    when "replied"
      title = t("notice.comment")
      action = t("notice.replied")
    when "commented"
      action = t("notice.commented")
      title = t("notice.review")
    when "liked"
      action = t("notice.liked")
      title = t("notice.review")
    when "reported_cmt"
      action = t("notice.reported")
      title = t("notice.acomment")
    when "reported_rw"
      action = t("notice.reported")
      title = t("notice.areview")
    end
    
    "#{notification.user.name} #{action} #{title}"
  end

  def read_class notification
    if notification.watched?
      "text-muted"
    else
      ""
    end
  end
end
