class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson
  

	def show
		@lesson = current_section.lessons(lesson_params)
    redirect_to lesson_path(lesson)
	end

	private

	def require_authorized_for_current_lesson
    if current_lesson.section.course.user != current_user
      redirect_to root_url, alert: 'Please enroll in this course to view lessons'
    end
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_authorized_for_current_section
    if current_section.course.user != current_user
      redirect_to root_url, alert: 'Please enroll in this course to view sections'
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
