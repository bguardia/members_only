class LikesController < ApplicationController
    before_action :authenticate_member!

    def create
        @like = Like.new(like_params)
        @like.save
    end

    def destroy
        @like = Like.find_by(like_params)
        @like&.destroy
    end
end
