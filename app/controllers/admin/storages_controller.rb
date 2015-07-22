class Admin::StoragesController < Admin::BaseController

  def index
    response = CLIENT.storages_get
    @storages = response['storage']
  end

  def new
  end

  def create
    CLIENT.create_storage(uri: params[:storage][:uri], capacity: params[:storage][:capacity])
    redirect_to admin_storages_path
  end

  def show
    @storage  = CLIENT.storage_get({'storage_id': params[:id]})
  end

  def destroy
    CLIENT.storage_delete({"storage_id": params[:id]})
    redirect_to admin_storages_path
  end

end
