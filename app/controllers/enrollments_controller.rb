class EnrollmentsController < ApplicationController
    def new
        @enrollment = Enrollment.new
    end

    def create
        @enrollment = Enrollment.new(params.require(:enrollment).permit(:event_id, :user_id))
        if @enrollment.save
            redirect_to user_path(@enrollment.user)
        else
            flash[:errors] = @enrollment.errors.full_messages
            redirect_to new_enrollment_path
        end 
    end
    
    def destroy
        @enrollment= Enrollment.find(params[:id])
        @enrollment.destroy
    end

end