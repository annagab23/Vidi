class Admin::CollectionsController < Admin::BaseController

  def index
    response = CLIENT.collections_get
    if response['hits'] != 0 then
      @collections = response['collection']
    end
  end

  def add_item
    CLIENT.collection_object_add({"collection_id": params[:id], "object_id": params[:collection][:object_id], "type": params[:collection][:type]})
    redirect_to admin_collection_path(params[:id])
  end

  def delete_item
    CLIENT.collection_object_remove({"collection_id": params[:id], "object_id": params[:item_id], "type": 'item'})
    redirect_to admin_collection_path(params[:id])
  end

  def new
  end

  def edit
    @collection_id = params[:id]
  end

  def show
    @collection = CLIENT.collection_get({"collection_id": params[:id]})
    @items = CLIENT.collection_items_get({"collection_id": params[:id]})['item']
    @metadata = CLIENT.collection_metadata_get({"collection_id": params[:id]})
  end

  def update
    response = CLIENT.collection_rename({"collection_id": params[:id], "name": params[:collection][:name]})
    redirect_to admin_collection_path(params[:id])
  end

  def create
    response = CLIENT.collection_create({"collection_name": params[:collection][:name]})
    redirect_to admin_collections_path
  end

  def destroy
    response = CLIENT.collection_delete({"collection_id": params[:id]})
    redirect_to admin_collections_path
  end

end
