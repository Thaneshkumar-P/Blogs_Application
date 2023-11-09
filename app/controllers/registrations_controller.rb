# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :authenticate_scope!, only: [ :update ]

  # POST /resource
  def create
    super
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      render partial: 'devise/registrations/edit', resource: resource
    end
  end

end
