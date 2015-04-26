class Category < ActiveRecord::Base
  has_and_belongs_to_many :contractors


  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #%% Class methods
  ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  def self.categories_options
    return Category.all.map do |category|
      [category.name, category.name]
    end
  end
end
