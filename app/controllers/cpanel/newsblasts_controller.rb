# coding: utf-8
class Cpanel::NewsblastsController < Cpanel::ApplicationController
  
  def index
    @newsblasts = Newsblast.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def show
    @newsblast = Newsblast.find(params[:id])
  end
  
  def new
    @newsblast = Newsblast.new
    # 3.times do
      # @newsblast.button_links.build
    # end
  end
  
  def create
    @newsblast = Newsblast.new(params[:newsblast])
    if @newsblast.save
      redirect_to cpanel_newsblasts_path, notice: "Newsblast created."
    else
      render :new
    end
  end
  
  def edit
    @newsblast = Newsblast.find(params[:id])
    # @newsblast.button_links.build if @newsblast.button_links.empty?
  end
  
  def update
    @newsblast = Newsblast.find(params[:id])
    params[:newsblast][:app_ids] ||= []
    if @newsblast.update_attributes(params[:newsblast])
      redirect_to cpanel_newsblasts_path, notice: "Newsblast updated."
    else
      render :edit
    end
  end
  
  def destroy
    @newsblast = Newsblast.find(params[:id])
    @newsblast.destroy
    redirect_to cpanel_newsblasts_url
  end
  
end
