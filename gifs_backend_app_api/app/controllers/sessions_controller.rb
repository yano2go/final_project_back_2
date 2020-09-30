class SessionsController < ApplicationController
     def create
          @session = session.new(gif_params)
      
          if @session.save
            render json: @session, status: :created, location: @session
          else
            render json: @session.errors, status: :unprocessable_entity
          end
        end
end
