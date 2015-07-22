class Admin::BaseController < InheritedResources::Base
  layout 'admin'
  before_action :authenticate_user!

end
