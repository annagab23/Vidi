class Admin::ItemsController < Admin::BaseController

  def index
    client = Vidispine::API::Client.new
    response = client.items_get
    @items = response['item']
  end

  def show
    client = Vidispine::API::Client.new
    @item = client.item_get({"item_id": params[:id]})
    @metadata = client.item_metadata_get({'item_id': params[:id]})
  end

  def new
  end

  def import_uri
    client = Vidispine::API::Client.new
    response = client.import_using_uri({"uri": params[:item][:url]})
    redirect_to admin_items_path, notice: "import placed to the query"
  end

  def destroy
    client = Vidispine::API::Client.new
    client.item_delete({"item_id": params[:id]})
    redirect_to admin_items_path
  end

  def edit
    @item_id = params[:id]
  end

  def update
    client = Vidispine::API::Client.new
    response = client.item_metadata_set({"item_id": params[:id], "metadata_document": params[:metadata_document]})
  end



end
