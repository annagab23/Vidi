class Admin::BaseController < InheritedResources::Base
  require 'vidispine/api/client'
  layout 'admin'
  before_action :authenticate_user!

end
