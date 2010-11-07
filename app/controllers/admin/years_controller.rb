class Admin::YearsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @year = Year.new
    @years = Year.all
  end
  def create
    @year = Year.new(params[:year])
    respond_to do |r|
      if @year.save
        flash[:success] = "Successfully added new year"
        r.html { redirect_to :action => "index" }
      else
        flash[:failure] = "There was a problem"
        r.html { redirect_to :action => "index" }
      end
    end
  end
end
