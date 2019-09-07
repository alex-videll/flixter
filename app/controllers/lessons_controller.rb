class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson
  

	def show
		@lesson = current_lesson.section.course(lesson_params)
    redirect_to lesson_path(lesson)
	end

	private

	def require_authorized_for_current_lesson
    current_user.enrolled_in?(course_url.to_s)
    redirect_to course_path
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

	def lesson_params
    	params.require(:lesson).permit(:title, :subtitle, :video)
  	end
end
