class UsersController < ApplicationController
  before_filter :is_user_signed_in

  def is_user_signed_in
    if !user_signed_in?
	redirect_to '/users/sign_in'
    end
  end

  def upload_data  
    
  end

  def submit_data
    file_data = params[:uploaded_file]
    post = UploadFile.save(params[:uploaded_file])
    render :text => "File has been uploaded successfully"   
  end

  def sign_out_user
    sign_out(current_user)
  end
end
