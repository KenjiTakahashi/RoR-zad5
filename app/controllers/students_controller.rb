class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def show
    @student = Student.find(params[:id])
  end
  def new
    @years = Year.all
    @student = Student.new
    respond_to do |r|
      r.html
    end
  end
  def create
    @years = Year.all
    @student = Student.new(params[:student])
    respond_to do |r|
      if @student.save
        flash[:success] = "Successfully added student"
        r.html { redirect_to :action => "index" }
      else
        r.html { render :action => "new" }
      end
    end
  end
  def edit
    @years = Year.all
    @student = Student.find(params[:id])
  end
  def update
    @years = Year.all
    @student = Student.find(params[:id])
    @student.update_attributes(params[:student])
    respond_to do |r|
      if @student.errors.empty?
        flash[:success] = "Successfully updated student"
        r.html { redirect_to :action => "index" }
      else
        r.html { render :action => "edit" }
      end
    end
  end
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    respond_to do |r|
      r.html { redirect_to students_url }
    end
  end
end
