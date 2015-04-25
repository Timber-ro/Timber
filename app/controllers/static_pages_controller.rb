class StaticPagesController < ApplicationController
  def landing_page
    if contractor_signed_in?
      redirect_to contractor_path current_contractor
    else
      redirect_to new_contractor_session_path
    end
  end
end
