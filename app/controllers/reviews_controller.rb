class ReviewsController < ApplicationController
  def create
    @contractor = Contractor.find params[:review][:contractor_id].to_i
    @contractor.reviews.build review_params

    respond_to do |format|
      if @contractor.save
        format.html   { redirect_to @contractor }
        format.js     {}
      else
        format.html   { redirect_to :back }
        format.js     {}
      end
    end
  end

  private
    def review_params
      params.require(:review).permit(:commenter_email, :body, :quality_rating, :efficiency_rating, :friendliness_rating)
    end
end
