class Admin::ShapeTagsController < Admin::BaseController

  def index
    response = CLIENT.get_shape_tags
    @tags = response['uri']
  end

  def new
  end

  def create
    CLIENT.shape_tag_create(params[:tag][:name], params[:tag][:body])
    redirect_to admin_shape_tags_path
  end

end
