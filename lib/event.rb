class Event < ActiveRecord::Base
  validates :name, :presence => true
  validates :start, :presence => true

<<<<<<< HEAD
  has_many :notes, :as => :notable, :dependent => :destroy

=======
>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe
  belongs_to :category

  before_save :downcase_name

<<<<<<< HEAD
  scope :ends_after, lambda {|date| where('stop >= ?', date)}
  scope :starts_before, lambda {|date| where('start <= ?', date)}

  default_scope order(:start)

=======
>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe
  private

  def downcase_name
    self.name = self.name.downcase
  end
<<<<<<< HEAD

=======
>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe
end
