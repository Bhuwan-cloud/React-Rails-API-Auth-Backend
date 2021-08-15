class StaticController < ApplicationController

    def home
        render json: {status: "My app is working  "}
    end 
end 