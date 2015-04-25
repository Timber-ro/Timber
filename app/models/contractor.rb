class Contractor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :categories

  has_attached_file :profile_picture, 
    :styles => { :medium => "200x200>", 
                 :thumb => "52x52>" }, 
                 :default_url => ":style/default_profile_pic.png"

  validates_attachment_content_type :profile_picture, 
    :content_type => ["image/jpg", 
                      "image/jpeg", 
                      "image/png",  
                      "image/gif"]
end
