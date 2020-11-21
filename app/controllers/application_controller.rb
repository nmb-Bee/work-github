class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource == Customer
      items_path
    else
       admin_top_path
    end
  end
end
