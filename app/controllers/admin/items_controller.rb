class Admin::ItemsController < Admin::BaseController

  def index
    response = CLIENT.items_get
    @items = response['item']
  end

  def show
    @item = CLIENT.item_get({'item_id': params[:id]})
    @metadata = CLIENT.item_metadata_get({'item_id': params[:id]})
    @shapes = CLIENT.item_shapes_get({'item_id': params[:id]})
  end

  def new
  end

  def import_uri
    response = CLIENT.import_using_uri({'uri': params[:item][:url]})
    redirect_to admin_items_path, notice: 'import placed to the query'
  end

  def destroy
    CLIENT.item_delete({'item_id': params[:id]})
    redirect_to admin_items_path
  end

  def edit
    @item_id = params[:id]
  end

  def update
    response = CLIENT.item_metadata_set({'item_id': params[:id], 'metadata_document': params[:metadata_document]})
  end

  def transcode
    CLIENT.item_transcode({'item_id': params[:id], 'tag': params[:job][:tag]})
    redirect_to admin_item_path(params[:id])
  end





end
