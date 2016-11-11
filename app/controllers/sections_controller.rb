class SectionsController < ApplicationController

  layout "admin"


  before_action :confirm_logged_in
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    @section.page = @page
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to (sections_path(:page_id => @page.id))
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render "new"
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to (section_path(@section))
    else
      @section_count = Section.count
      @pages = Page.sorted
      render "edit"
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully."
    redirect_to (sections_path)
  end

  private
  def section_params
    params.require(:section).permit(:name, :content_type, :content, :position, :visible)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
