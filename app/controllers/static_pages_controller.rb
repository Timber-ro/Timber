class StaticPagesController < ApplicationController
  def landing_page
    @contractors = Contractor.all
  end
end
