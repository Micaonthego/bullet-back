class BulletsController < ApplicationController
    before_action :find_bullet, except: [:index, :create]

    def index 
        @bullets = Bullet.all 
        render json: @bullets
    end

    def show
        render json: @bullet
    end

    def create
        @bullet = Bullet.create(bullet_params.merge({date: Time.now}))
        render json: @bullet
    end

    def update
        @bullet.update(bullet_params)
        render json: @bullet
    end

    def destroy
        @bullet.destroy
        render json: @bullet
    end

    private

    def bullet_params
        params.permit(:priority, :gratitude, :accomplishment, :reflection, :date, :photo, :user_id)
    end

    def find_bullet
        @bullet = Entry.find(params[:id])
    end

end
