class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson
  

	def show
		@lesson = Lesson.new
	end

	private

	def require_authorized_for_current_lesson
    	if current_user.enrolled_in?(course)
    		return redirect_to lesson_path(current_lesson.section.course)
        else 
        	return redirect_to courses_path, alert: 'Please enroll in this course to view lessons'
    	end
  	end

	helper_method :current_section
	def current_section
    	@current_section ||= Section.find(params[:section_id])
  	end

	def lesson_params
    	params.require(:lesson).permit(:title, :subtitle, :video)
  	end
end
