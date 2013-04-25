module ApplicationHelper
  def rating_field(id)
    content_tag :li, nil, :class => "rating_star", :data => { :rating_id => "#{id}" }
  end
end

