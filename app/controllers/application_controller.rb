class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "If you see this in the browser you are awesome!"
  end
end
