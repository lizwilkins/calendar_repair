class Event < ActiveRecord::Base

  validates :name, :presence => true
  validates :start, :presence => true

  has_many :notes, :as => :notable, :dependent => :destroy

  belongs_to :category

  before_save :downcase_name

  scope :ends_after, lambda {|date| where('stop >= ?', date)}  # stops after start date
  scope :starts_before, lambda {|date| where('start <= ?', date)}   # starts before end date

  default_scope order(:start)

  private

  def downcase_name
    self.name = self.name.downcase
  end
end
