class Todo < ActiveRecord::Base
  has_many :notes, :as => :notable

  # scope :not_done, where(:done => false)
end