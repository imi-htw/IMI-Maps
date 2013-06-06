class InternshipReport < ActiveRecord::Base
  # attr_accessible :title, :body
  #def self.save(upload)
  #	name =  upload['datafile'].original_filename
  #	directory = "public/data"
  	# create the file path
  #	path = File.join(directory, name)
  	# write the file
  #	File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  #end
  validate :validate_attachments
  
  Max_Attachments = 1
  Max_Attachment_Size = 1.megabyte

  def validate_attachments
    errors.add_to_base("Too many attachments - maximum is #{Max_Attachments}") if internship_report.length > Max_Attachments
    internship_report.each {|a| errors.add_to_base("#{a.name} is over #{Max_Attachment_Size/1.megabyte}MB") if a.file_size > Max_Attachment_Size}
  end

  has_attached_file :data,

  belongs_to :attachable, :polymorphic => false

  has_attached_file :data,
                    :url  => "/internship_report/:id",
                    :path => ":rails_root/internship_report/docs/:id/:style/:basename.:extension"

  def url(*args)
    data.url(*args)
  end
  
  def name
    data_file_name
  end
  
  def content_type
    data_content_type
  end
  
  def file_size
    data_file_size
  end
end
