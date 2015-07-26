class Admin::MetadataFieldsController < ApplicationController

  def index
    @fields = CLIENT.metadata_fields_get['field']
    @groups = CLIENT.metadata_field_groups_get['group']
  end

  def new
  end

  def show
    @metadata_field = CLIENT.metadata_field_get({field_name: params[:id]})
    @groups = []
    CLIENT.metadata_field_groups_get['group'].each {|g| @groups << g.values}
    @groups.flatten!
  end

  def create
    if params[:field] then
      CLIENT.metadata_field_create(params[:field][:name], params[:field][:type])
      binding.pry
    end
    if params[:group] then
      binding.pry
      CLIENT.metadata_field_group_create(params[:group][:name])
    end
    redirect_to admin_metadata_fields_path
  end

  def add_field_to_group
    CLIENT.metadata_field_add_to_group(params[:field][:group], params[:id])
    redirect_to admin_metadata_fields_path
  end

end
