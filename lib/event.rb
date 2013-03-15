class Event < ActiveRecord::Base
  validates :name, :presence => true
  validates :start, :presence => true

  belongs_to :category

  before_save :downcase_name

  private

  def downcase_name
    self.name = self.name.downcase
  end
end
