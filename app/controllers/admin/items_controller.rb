class Admin::ItemsController < Admin::BaseController

  def index
    response = CLIENT.items_get
    @items = response['item']
  end

  def show
    @item = CLIENT.item_get({'item_id': params[:id]})
    @metadata = CLIENT.item_metadata_get({'item_id': params[:id]})
    @shapes = []
    CLIENT.item_shapes_get({'item_id': params[:id]})['uri'].each do |shape|
      @shapes << CLIENT.item_shape_get({'item_id': params[:id], 'shape_id': shape})
    end
    @tags = CLIENT.get_shape_tags['uri']
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
    @metadata_groups = CLIENT.metadata_field_groups_get['group']
  end

  def update
    body = "<MetadataDocument xmlns='http://xml.vidispine.com/schema/vidispine'><timespan start='-INF' end='+INF'>"
    params[:item].keys.each do |group|
      if params[:item][group].map { | key, value | value }.sum != ""
        body << "<group mode='add'><name>#{group}</name>"
        params[:item][group].each do |field|
          if field.last != ""
            body << "<field><name>#{field.first}</name><value>#{field.last}</value></field>"
          end
        end
        body << "</group>"
      end
    end
    body << "</timespan></MetadataDocument>"
    response = CLIENT.item_metadata_set({'item_id': params[:id], 'metadata_document': body})
    redirect_to admin_item_path(params[:id])
  end




  def transcode
    CLIENT.item_transcode({'item_id': params[:id], 'tag': params[:job][:tag]})
    redirect_to admin_item_path(params[:id])
  end

end
