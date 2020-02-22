# frozen_string_literal: true

class SchoolsController < ApplicationController
  before_action :set_school, only: %i[show edit update destroy]

  def index
    has_name = params[:name].present?
    @schools = has_name ? School.find_by_name(title: params[:name]) : School.all
  end

  def show; end

  def new
    @school = School.new
  end

  def edit; end

  def create
    @school = School.new(school_params)
    if @school.save!
      redirect_to schools_path
    else
      flash[:error] = @school.errors
      render :new
    end
  end

  def update
    if @school.update(school_params)
      redirect_to school_path
    else
      flash[:error] = @school.errors
      render :edit
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:title, :owner_email, :s_domain, :pitch)
  end
end
