# frozen_string_literal: true

class ApplicationController < ActionController::Base
  after_action :store_action

  def store_action
    return unless request.get?

    if !request.path.in?(%w[/users/sign_in /users/sign_up /users/password/new /users/password/edit /users/confirmation /users/sign_out]) &&
       !request.xhr? # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    request.referer
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end
