class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

    def index
        @users = User.all
        render json: @users
    end

    def create
      user = User.new(user_params)
      if user
        user.save
        token = encode_token(user.id)
        render json: {user: UserSerializer.new(user), token: token}
      else
        render json: {errors: user.errors.full_messages}
      end
     end   

      private
  
      def user_params
       params.require(:user).permit(:username, :photo, :password, :aspiration)
      end

end