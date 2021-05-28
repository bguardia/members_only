class ProfilesController < ApplicationController
    before_action :authenticate_member!, except: [:show]

    def show
        @member = Member.find(params[:id])
        @profile = @member.profile
    end

    def edit
        @member = Member.find(params[:id])
        @profile = @member.profile
    end

    def update
        @member = Member.find(params[:id])
        @profile = @member.profile
        
        if @member.profile.update(profile_params)
            flash[:notice] = "Succesfully update profile!"
            redirect_to profile_path(@member)
        else
            flash.now[:alert] = "Unable to update profile"
            render 'edit'
        end
    end

    private
    def profile_params
        params.require(:profile).permit(:bio, :picture)
    end

end
