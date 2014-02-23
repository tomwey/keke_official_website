# coding: utf-8
class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to new_contact_path, :notice => "提交反馈成功"
    else
      render :new
    end
  end
end
