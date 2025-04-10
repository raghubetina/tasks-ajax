class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_random_id

  def set_random_id
    cookies[:random_id] ||= rand(100000)
  end
end
