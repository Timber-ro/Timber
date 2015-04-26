class Contractor < ActiveRecord::Base
    COUNTIES_OPTIONS = [
      ['Alba', 'Alba'],
      ['Arad', 'Arad'],
      ['Arges', 'Arges'],
      ['Bacau', 'Bacau'],
      ['Bihor', 'Bihor'],
      ['Bistrita Nasaud', 'Bistrita Nasaud'],
      ['Botosani', 'Botosani'],
      ['Brasov', 'Brasov'],
      ['Braila', 'Braila'],
      ['Bucuresti', 'Bucuresti'],
      ['Buzau', 'Buzau'],
      ['Caras Severin', 'Caras Severin'],
      ['Calarasi', 'Calarasi'],
      ['Cluj', 'Cluj'],
      ['Constanta', 'Constanta'],
      ['Covasna', 'Covasna'],
      ['Dambovita', 'Dambovita'],
      ['Dolj', 'Dolj'],
      ['Galati', 'Galati'],
      ['Giurgiu', 'Giurgiu'],
      ['Gorj', 'Gorj'],
      ['Harghita', 'Harghita'],
      ['Hunedoara', 'Hunedoara'],
      ['Ialomita', 'Ialomita'],
      ['Iasi', 'Iasi'],
      ['Ilfov', 'Ilfov'],
      ['Maramures', 'Maramures'],
      ['Mehedinti', 'Mehedinti'],
      ['Mures', 'Mures'],
      ['Neamt', 'Neamt'],
      ['Olt', 'Olt'],
      ['Prahova', 'Prahova'],
      ['Satu Mare', 'Satu Mare'],
      ['Salaj', 'Salaj'],
      ['Sibiu', 'Sibiu'],
      ['Suceava', 'Suceava'],
      ['Teleorman', 'Teleorman'],
      ['Timis', 'Timis'],
      ['Tulcea', 'Tulcea'],
      ['Vaslui', 'Vaslui'],
      ['Valcea', 'Valcea'],
      ['Vrancea', 'Vrancea']
    ]
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #%% Devise
  ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #%% Database Relations
  ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  has_many                  :projects
  has_many                  :reviews
  has_and_belongs_to_many   :categories


  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #%% Profile picture
  ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  has_attached_file :profile_picture, 
    :styles => { :medium => "200x200>", 
                 :thumb => "52x52>" }, 
                 :default_url => ":style/default_profile_pic.png"

  validates_attachment_content_type :profile_picture, 
    :content_type => ["image/jpg", 
                      "image/jpeg", 
                      "image/png",  
                      "image/gif"]

  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #%% Class Methods
  ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  def self.search(search)
    if search
      Contractor.includes(:categories)
        .where(categories: {  name:     search[:category] })
        .where(contractors: { county:   search[:county] })
    else
      Contractor.all
    end
  end
end
