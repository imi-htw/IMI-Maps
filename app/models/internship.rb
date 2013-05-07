class Internship < ActiveRecord::Base
  attr_accessible :living_costs, :orientation, :salary_id, :working_hours, :programming_language_ids, :attachments_attributes, :rating

  # validations
  validates :orientation, :presence => true
  validates :programming_language_ids, :presence => true
  validates :living_costs, :presence => true
  validates :salary_id, :presence => true, :numericality => true
  validates :rating, :presence => true, :numericality => true


  # associations
  belongs_to :user
  belongs_to :company
  belongs_to :salary

  has_and_belongs_to_many :programming_languages

  #attachments
  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :attachments

  has_many :comments, :dependent => :destroy

  private

  def self.search(params)
    if params
      conditions = []
      conditions.push(["orientation LIKE '#{params[:orientation]}'"]) unless params[:orientation].blank?
      conditions.push(["salary >= #{params[:salary]}"]) unless params[:salary].blank?
      conditions.push(["working_hours <= #{params[:working_hours]}"]) unless params[:working_hours].blank?
      conditions.push(["living_costs <= #{params[:living_costs]}"]) unless params[:living_costs].blank?
      conditions.push(["rating >= #{params[:rating]}"]) unless params[:rating].blank?  
      if params[:programming_language_ids].present?    
        programming_languages_string = []
        params[:programming_language_ids].each do |x|
          programming_languages_string.push(ProgrammingLanguage.find(x).name)
        end
        conditions.push(["programming_languages IN #{programming_languages_string}"])
      end
      blub = conditions.join(' AND ')
      Internship.find(:all, :conditions => blub)    
    else
      Internship.find(:all)
    end
  end

end
