class SectionsController < ApplicationController

  before_action :find_event

  
  def index
    if @event
      @sections = @event.sections.sorted_by_starting_time
	else
	  @sections = Section.newest_first
	end
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
	if @section.save
	  @event.sections << @section
	  @section.speakers << Speaker.find(params[:speaker][:id].delete_if{|x| x.empty?})
		# Apparently '.delete_if{ |x| x.empty? }' is required here, cause otherwise it crashes from empty object in array 
	  redirect_to(:action => 'index', :event_id => params[:event_id])
	else
	  render('new')
	end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
	if @section.update_attributes(section_params)
	  @section.speakers = []
	  @section.speakers << Speaker.find(params[:speaker][:id].delete_if{|x| x.empty?})
	  flash[:notice] = "Section updated successfully."
	  redirect_to(action: "show", :id => @section.id, :event_id => params[:event_id])
    else
	  render("edit")
	end
  end

  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    section = Section.find(params[:id]).destroy
	flash[:notice] = "Section '#{section.title}' destroyed successfully."
	redirect_to(action: "index", :event_id => params[:event_id])
  end
  
  private
  
	def section_params
	  params.require(:section).permit(:title, :description, :date, :start_time, :finish_time, :visible, :speaker_id)
	end
	
	def section_speakers_params
	  params.require(:section).permit(:id)
	end
	
	def find_event
	  if params[:event_id]
	    @event = Event.find(params[:event_id])
	  end
	end
  
end
