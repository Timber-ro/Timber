class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update]

  def show
  end

  def edit
    
  end

  def update
    @contractor.assign_attributes contractor_params

    respond_to do |format|
      if @contractor.save
        format.html { redirect_to contractor_path(@contractor), notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_contractor
      @contractor = Contractor.find params[:id]
    end

    def contractor_params
      params.require(:contractor).permit(:profile_picture, :name,
                                         :description, :phone, :website)
    end
end
