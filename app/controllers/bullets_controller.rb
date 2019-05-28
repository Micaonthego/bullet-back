class BulletsController < ApplicationController
    before_action :find_bullet, except: [:index, :create]
    before_action :authorized, except: [:index]

    def index 
        @bullets = Bullet.all 
        render json: @bullets
    end

    def show
        render json: @bullet
    end

    def create
        @bullet = Bullet.create(bullet_params.merge({date: Time.now, user_id: curr_user.id}))
        render json: @bullet
    end

    def update
        if request.headers["Favorite"] 
            @bullet.update(favorite: params[:favorite])
            render json: @bullet
        else
        @bullet.update(bullet_params)
        render json: @bullet
        end
    end

    def destroy
        @bullet.destroy
        render json: @bullet
    end

    private

    def bullet_params
        params.require(:bullet).permit(:priority, :gratitude, :accomplishment, :reflection, :date, :photo, :favorite, :user_id)
    end

    def find_bullet
        @bullet = Bullet.find(params[:id])
    end

end
