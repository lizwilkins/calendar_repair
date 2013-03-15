class Category < ActiveRecord::Base
  validates :name, :presence => true

  has_many :events

  before_save :upcase_name

  private

  def upcase_name
    self.name = self.name.upcase
  end
end