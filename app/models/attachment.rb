class Attachment < ActiveRecord::Base
  attr_accessible :description, :file

  validates :file, :presence => true

  belongs_to :attachable, :polymorphic => true

  mount_uploader :file, FileUploader
end