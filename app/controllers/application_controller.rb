class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in, except: [:denied]

  private

  def logged_in
    '''
      Filter that denies users if they are not in the database. Redirects them to a 403 page if they are not logged in.
    '''
    
    user = shibboleth_login

    if user.nil?
      redirect_to denied_path
    end
  end

  def shibboleth_login
    '''
      Logs in users via the Shibboleth environment variable.
      @returns {User} an instance of the user found via their unique netid
    '''
    
    if Rails.env.production?
      # if the environment is production find the netid by Shibboleth ENV
      return User.find_by_netid(request.env["REMOTE_USER"])
    else
      # if the environment is not in production, find a netid by hardcoded val
      return User.first
    end
  end

  def denied
    '''
      Renders the denied route (403)
    '''

    render 'shared/403'
  end

  def current_user
    '''
      current_user is used to check roles for permissions
      @returns {User} found via the shibboleth_login() method
    '''

    shibboleth_login
  end

end
