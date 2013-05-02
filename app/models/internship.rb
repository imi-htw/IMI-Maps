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

  private

  def self.search(params)
    conditions = []
    conditions.push(["orientation LIKE '#{params[:orientation]}'"].join(' ')) unless params[:orientation].blank?
    conditions.push(["salary >= #{params[:salary]}"].join(' ')) unless params[:salary].blank?
    conditions.push(["working_hours <= #{params[:working_hours]}"].join(' ')) unless params[:working_hours].blank?
    conditions.push(["living_costs <= #{params[:living_costs]}"].join(' ')) unless params[:living_costs].blank?
    blub = conditions.join(' AND ')
    Internship.find(:all, :conditions => blub)    
  end

end
