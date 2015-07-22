class Admin::JobsController < Admin::BaseController

  def index
    response = CLIENT.jobs_get
    @jobs = response['job']
  end

  def show
    @job  = CLIENT.job_get({'job_id': params[:id]})
  end

  def abort_job
    CLIENT.job_abort({"job_id": params[:id]})
    redirect_to admin_jobs_path
  end

end
