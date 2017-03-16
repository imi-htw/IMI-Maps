module UrlHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
end
module ApplicationHelper
  include UrlHelper

  def render_stars(rating, template)
    RatingRenderer.new(rating, template).render_star_fields
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-info"
    end
	end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(" #{name}", '#', class: "add_fields btn btn-success icon-white icon-plus", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def get_notifications
    Notification.where(:user_id => current_user.try(:id)).order("created_at DESC")
  end

end
