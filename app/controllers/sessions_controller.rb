   class SessionsController < ApplicationController

      include CurrentUserConcern
      
     def create
       user = User
         .find_by(email: params["user"]["email"])
         .try(:authenticate, params["user"]["password"])

         if user
          session[:user_id] = user.id
          render json: {

            status: :creatd,
            logged_in: true,
            user: user

          }
          else
            # 401 code is used to notify the user is not authenticated successfully
            render json: {
              status: 401 
            }
     end 

      #  logged_in method is specially used to work like 'current_user' method that we have use in devise 
      # logged_in method is user to check whether the user is available or not 
      # current method is defined in concern also we have also imported the concern
      def logged_in
        if @current_user
          render json: {
            logged_in: true,
            user: @current_user
          }
        else
          render json: {logged_in: false  }

        end 

      end 


      def logout
        reset_session
        render json: {status: 200, logged_out: true}
      end 

   end 
