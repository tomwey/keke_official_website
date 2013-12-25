# coding: utf-8
class Cpanel::FeedbacksController < Cpanel::ApplicationController
  
  def index
    @feedbacks = Feedback.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def show
    @feedback = Feedback.find(params[:id])
  end
  
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to cpanel_feedbacks_url
  end
  
end
