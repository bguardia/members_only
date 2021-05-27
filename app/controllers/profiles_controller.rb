class ProfilesController < ApplicationController

    def show
        @member = Member.find(params[:id])
        @profile = @member.profile
    end
end
