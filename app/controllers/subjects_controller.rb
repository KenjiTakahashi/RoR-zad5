class SubjectsController < ApplicationController
  def new
    @subject = Student.find(params[:student_id]).subjects.new
  end
  def create
    student = Student.find(params[:student_id])
    @subject = student.subjects.new(params[:subject])
    respond_to do |r|
      if @subject.save
        flash[:success] = "Successfully added subject"
        r.html { redirect_to student }
      else
        r.html { render :action => "new" }
      end
    end
  end
  def edit
    student = Student.find(params[:student_id])
    @subject = student.subjects.find(params[:id])
  end
  def update
    student = Student.find(params[:student_id])
    @subject = student.subjects.find(params[:id])
    @subject.update_attributes(params[:subject])
    respond_to do |r|
      if @subject.errors.empty?
        flash[:success] = "Successfully updated subject"
        r.html { redirect_to student }
      else
        r.html { render :action => "edit" }
      end
    end
  end
  def destroy
    student = Student.find(params[:student_id])
    @subject = student.subjects.find(params[:id])
    @subject.destroy
    respond_to do |r|
      r.html { redirect_to student }
    end
  end
end
