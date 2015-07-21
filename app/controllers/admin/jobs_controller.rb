class Admin::JobsController < Admin::BaseController

  def index
    client = Vidispine::API::Client.new
    response = client.jobs_get
    @jobs = response['job']
  end

  def show
    client = Vidispine::API::Client.new
    @job  = client.job_get({'job_id': params[:id]})
  end

  def abort_job
    binding.pry
    client = Vidispine::API::Client.new
    client.job_abort({"job_id": params[:id]})
    redirect_to admin_jobs_path
  end

end
