class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :faq

  def about
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"application_stats\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def faq
  end
end
