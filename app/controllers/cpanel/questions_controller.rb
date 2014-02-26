# coding: utf-8
class Cpanel::QuestionsController < Cpanel::ApplicationController
  
  def index
    @questions = Question.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to cpanel_questions_url, notice: "创建问题成功"
    else
      render :new
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to cpanel_questions_url
  end
  
end
