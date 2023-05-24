class TasksController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /tasks
  #ユーザーIDに対応したタスク一覧が表示される。
  def index
    #ログイン中のユーザーでなかった場合エラーにしたい
    @q = Task.my_tasks(current_user).ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  # GET /task/1
  def show
    @task = Task.my_tasks(current_user).find_by(id: params[:taskid])
  end

  # GET /task/new
  def new
    @task = Task.new
    @task.user_id = current_user.id
  end

  # GET /task/1/editexit
  def edit
    @task = Task.my_tasks(current_user).find_by(id: params[:taskid])
  end

  # POST /task
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1/1
  def update
    binding.pry
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task/1
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
    end
  end

  def search
    @results = @q.result
  end

  private

    def set_q
      @q = Task.ransack(params[:q])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:taskid])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:user_id, :display_text, :discription, :start_date_time, :end_date_time, :status_id, :level, :label)
    end
end
