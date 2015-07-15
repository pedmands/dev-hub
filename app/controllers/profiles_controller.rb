class ProfilesController < ApplicationController
    # just by defining "new," below, a view is automatically expected. Create a folder in the app/views folder and name it after this controller, then create a .html.erb file to match "new."
    def new
        # check which user is logged in:
        @user = User.find( params[:user_id] )
        # build a blank profile page for every user (thanks to the nested resource in the routes file):
        @profile = Profile.new
    end
    
    def create
        @user = User.find( params[:user_id] )
        # this build_profile will *create* a profile using whatever the user filled out in the blank form, above.
          @profile = @user.build_profile(profile_params)
        # save into database
          if @profile.save
            flash[:success] = "Profile Updated!"
            redirect_to user_path( params[:user_id] )
          else
            render action: :new
          end
    end
    

    private
    # white listed params
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end