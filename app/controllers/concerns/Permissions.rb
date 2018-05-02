module Permissions
  extend ActiveSupport::Concern

  def is_super_administrator?
    if ! current_user.super_administrator?
      denied_response
    end
  end

  def is_administrator?
    if ! current_user.administrator? && ! current_user.super_administrator?
      denied_response
    end
  end

  def is_employee?
    if ! current_user.employee? && ! current_user.administrator? && ! current_user.super_administrator?
      denied_response
    end
  end

  def denied_response
    respond_to do |format|
      format.html { 
        flash[:notice] = 'Permission denied.'
        redirect_back(fallback_location: root_path, status: 403)
      }
      format.js { 
        flash[:notice] = 'Permission denied.'
        redirect_back(fallback_location: root_path, status: 403)
      }    
    end
  end

end