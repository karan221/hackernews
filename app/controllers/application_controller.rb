# frozen string literal: true

class ApplicationController < ActionController::Base
  def after_sign_out_path_for(_resource_or_scope)
    request.referer
  end
end
