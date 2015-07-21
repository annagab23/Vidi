class Admin::StoragesController < Admin::BaseController

  def index
    client = Vidispine::API::Client.new
    response = client.storages_get
    @storages = response['storage']
  end

  def show
    client = Vidispine::API::Client.new
    @storage  = client.storage_get({'id': params[:id]})
  end

end
