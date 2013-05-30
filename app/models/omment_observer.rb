class OmmentObserver < ActiveRecord::Observer
    def after_save(comment)
      Notifications.comment(,"New Comment was posted",comment).deliver 
end
