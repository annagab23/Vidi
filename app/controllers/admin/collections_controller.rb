class Admin::CollectionsController < Admin::BaseController

  def index
    client = Vidispine::API::Client.new
    response = client.collections_get
    if response['hits'] != 0 then
      @collections = response['collection']
    end
  end

  def add_item
    client = Vidispine::API::Client.new
    client.collection_object_add({"collection_id": params[:id], "object_id": params[:collection][:object_id], "type": params[:collection][:type]})
    redirect_to admin_collection_path(params[:id])
  end

  def new
  end

  def edit
    @collection_id = params[:id]
  end

  def show
    client = Vidispine::API::Client.new
    @collection = client.collection_get({"collection_id": params[:id]})
    @items = client.collection_items_get({"collection_id": params[:id]})['item']
    @metadata = client.collection_metadata_get({"collection_id": params[:id]})
  end

  def update
    client = Vidispine::API::Client.new
    response = client.collection_rename({"collection_id": params[:id], "name": params[:collection][:name]})
    redirect_to admin_collection_path(params[:id])
  end

  def create
    client = Vidispine::API::Client.new
    response = client.collection_create({"collection_name": params[:collection][:name]})
    redirect_to admin_collections_path
  end

  def destroy
    client = Vidispine::API::Client.new
    response = client.collection_delete({"collection_id": params[:id]})
    redirect_to admin_collections_path
  end

end
