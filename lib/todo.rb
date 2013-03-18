class Todo < ActiveRecord::Base

  has_many :notes, :as => :notable, :dependent => :destroy

  scope :not_done, where(:done => false)
  
end