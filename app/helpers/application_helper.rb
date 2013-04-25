module ApplicationHelper

  def render_stars(rating, template)
    RatingRenderer.new(rating, template).render_star_fields
  end

end

