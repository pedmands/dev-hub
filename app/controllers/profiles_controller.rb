class ProfilesController < ApplicationController
    # just by defining "new," below, a view is automatically expected. Create a folder in the app/views folder and name it after this controller, then create a .html.erb file to match "new."
    def new
        # check which user is logged in:
        @user = User.find(params[:user_id])
        # build a profile for the user (thanks to the nested resource in the routes file):
        @profile = @user.build_profile
        # 
    end
end