class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    # if resource == customer
    case resource
    when Customer
      items_path
    else
       admin_top_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Customer
      items_path
    else
       admin_session_path
    end
  end
end