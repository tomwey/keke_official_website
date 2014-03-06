# coding: utf-8
class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at desc')
    @page_title = "常见问题"
  end
end
