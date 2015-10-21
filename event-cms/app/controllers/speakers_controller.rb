class SpeakersController < ApplicationController

  before_action :confirm_logged_in

  def index
    @speakers = Speaker.sorted
  end

  def show
    @speaker = Speaker.find(params[:id])
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new(speaker_params)
	if @speaker.save
	  redirect_to(:action => 'index')
	else
	  render('new')
	end
  end

  def edit
    @speaker = Speaker.find(params[:id])
  end

  def update
    @speaker = Speaker.find(params[:id])
	if @speaker.update_attributes(speaker_params)
	  flash[:notice] = "Speaker updated successfully."
	  redirect_to(action: "show", :id => @speaker.id)
    else
	  render("edit")
	end
  end

  def delete
    @speaker = Speaker.find(params[:id])
  end
  
  def destroy
    speaker = Speaker.find(params[:id]).destroy
	flash[:notice] = "Speaker '#{speaker.name}' destroyed successfully."
	redirect_to(action: "index")
  end
  
  private
  
	def speaker_params
		params.require(:speaker).permit(:name, :description)
	end
  
end
