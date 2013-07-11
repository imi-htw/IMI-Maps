class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

private

    def authorize
      redirect_to root_url if current_user.nil?
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
      { locale: I18n.locale }
    end

    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
      #@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
      rescue ActiveRecord::RecordNotFound
        session.destroy
        nil
    end

    helper_method :current_user

    def get_programming_languages
      @programming_languages ||= ProgrammingLanguage.order(:name).map do |p|
        [p.name, p.id]
      end
    end

    helper_method :get_programming_languages

    def get_orientations
      @orientations ||= Orientation.order(:name).map do |o|
        [o.name, o.id]
      end
    end

    helper_method :get_orientations

    def get_semesters
      @semesters ||= Semester.order(:id).map do |s|
        [s.name, s.id]
      end
    end

    helper_method :get_semesters

    def get_notifications
      Notification.where(:user_id => current_user.try(:id)).order("created_at DESC")
    end

    helper_method :get_notifications

    def get_notification_size
      Notification.where(:user_id => current_user.try(:id)).size
    end

    helper_method :get_notification_size

end
