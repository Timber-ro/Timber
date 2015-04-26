class Review < ActiveRecord::Base
  belongs_to :contractor
  validates_presence_of :commenter_email
end
