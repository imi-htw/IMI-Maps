class Attachment < ActiveRecord::Base
   attr_accessible :description, :file

  validates :description, :presence => true
  validates :file, :presence => true


   belongs_to :attachable, :polymorphic => true

   mount_uploader :file, FileUploader
end