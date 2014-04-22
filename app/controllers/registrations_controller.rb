class RegistrationsController < Devise::RegistrationsController
  
  def new 
    build_resource({})
    resource.build_account
    respond_with self.resource
  end

end