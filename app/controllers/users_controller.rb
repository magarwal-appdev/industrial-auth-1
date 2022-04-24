class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  before_action :respect_users_privacy, only: %i[ feed discover ]

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def respect_users_privacy
      if params[:username] != nil
        if params[:username] != current_user.username
          redirect_to root_path, alert: "Woah! Let's respect other's privacy!"
        end
      end
    end
end