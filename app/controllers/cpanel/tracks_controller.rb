# coding: utf-8
class Cpanel::TracksController < Cpanel::ApplicationController
  
  def index
    @tracks = Track.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  # def show
  #   @track = Track.find(params[:id])
  # end
  
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to cpanel_tracks_url
  end
  
end
