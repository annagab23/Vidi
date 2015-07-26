class Admin::MetadataFieldsController < ApplicationController

  def index
  end

  def new
  end

  def create
    CLIENT.metadata_field_create(params[:field][:name], params[:field][:type])
    redirect_to admin_metadata_fields_path
  end

end
