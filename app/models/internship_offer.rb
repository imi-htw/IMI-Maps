class InternshipOffer < ActiveRecord::Base
  attr_accessible :title, :body, :pdf

  mount_uploader :pdf, InternshipReportUploader

end
