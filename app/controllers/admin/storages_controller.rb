class Admin::StoragesController < Admin::BaseController

  def index
    response = CLIENT.storages_get
    @storages = response['storage']
  end

  def show
    @storage  = CLIENT.storage_get({'storage_id': params[:id]})
  end

  def destroy
    CLIENT.storage_delete({"storage_id": params[:id]})
  end

end
