class Admin::JobsController < Admin::BaseController

  def index
    @jobs = CLIENT.jobs_get['job']
  end

  def show
    @job = CLIENT.job_get({'job_id': params[:id]})
  end

  def abort_job
    CLIENT.job_abort({"job_id": params[:id]})
    redirect_to admin_jobs_path
  end

end
