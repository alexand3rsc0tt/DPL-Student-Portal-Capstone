class Dashboard::BaseController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :set_cohort
  before_action :set_user

  def index
    @assignments = @cohort.assignments.all
    @todos = @user.todos.all
    @todo = @user.todos.new
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  private

  def set_user
    @user ||= current_user
  end
end

