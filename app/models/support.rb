class Support < ActiveRecord::Base

  validates :name, presence: true
  validates :message, presence: true
  validates :email, presence: {message: "Must be Provided ! "}

  after_initialize :set_defaults

  before_save :capitalize_name

  

  private

  def set_defaults
    self.status ||= false
  end

  def capitalize_name
    self.name.capitalize! 
  end
end
