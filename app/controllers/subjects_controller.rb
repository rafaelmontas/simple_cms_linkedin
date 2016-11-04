class SubjectsController < ApplicationController

  layout "admin"

  def index
    @subjects = Subject.sorted
    # @subjects2 = Subject.where(:visible => true)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    #instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #Save the object
    if @subject.save
      #if save succeeds, redirect to index action
      flash[:notice] = "Subject created successfully."
      redirect_to (subjects_path)
    else
    #if save fails, redisplay the form so users can fix problems
      render ("new")
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #Find a new object using form parameters
    @subject = Subject.find(params[:id])
    #Update the object
    if @subject.update_attributes(subject_params)
      #if save succeeds, redirect to show action
      flash[:notice] = "Subject updated successfully."
      redirect_to (subject_path(@subject))
    else
    #if save fails, redisplay the form so users can fix problems
      render ("edit")
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to(subjects_path)
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
