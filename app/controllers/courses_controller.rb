# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  def index
    if params[:course_name]
      @courses = Course.find_by_name(params[:course_name])
      respond_to do |format|
        format.js { render partial: 'search-results' }
      end
    else
      @courses = Course.all
    end
  end

  def new
    @course = Course.new
    @schools = School.all
  end

  def show; end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      flash[:error] = @course.errors
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to course_path
    else
      flash[:error] = @course.errors
      render :edit
    end
  end

  def edit
    @schools = School.all
  end

  def destroy
    @course.destroy
    flash[:notice] = 'Curso Apagado com Sucesso'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :content, :school_id)
  end
end
