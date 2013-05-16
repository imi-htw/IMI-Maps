class Profil 
  include ActiveAttr::Model

  attribute :nachname
  attribute :vorname
  attribute :email
  attribute :content
  attribute :priority
  
  attr_accessible :content, :email, :nachname, :vorname

  validate_presence_of :nachname, :vorname
  validate_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validate_length_of :content, :maximum => 500

end
                                                                                  