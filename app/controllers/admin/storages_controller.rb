class Admin::StoragesController < Admin::BaseController

  def index
    response = CLIENT.storages_get
    @storages = response['storage']
  end

  def show
    @storage  = CLIENT.storage_get({'id': params[:id]})
  end

end
