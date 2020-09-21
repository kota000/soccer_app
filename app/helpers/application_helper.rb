# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = {})
    if page_title.blank?
      APP_TITLE
    else
      "#{page_title} - #{APP_TITLE}"
    end
  end
end
