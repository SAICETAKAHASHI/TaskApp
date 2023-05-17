class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :get_user
  before_action :set_q, only: [:index, :search]

  # GET /tasks
  #ユーザーIDに対応したタスク一覧が表示される。
  def index
    #ログイン中のユーザーでなかった場合エラーにしたい
    @tasks = Task.where(user_id: @user.id)
    @q = @tasks.ransack(params[:q])
  end

  # GET /task/1
  def show
    
  end

  # GET /task/new
  def new
    @task = Task.new
    @task.user_id = @user.id
  end

  # GET /task/1/editexit
  def edit
    @tasks = Task.where(user_id: @user.id).where(id: params[:taskid])
  end

  # POST /task
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1/1
  def update
    binding.pry
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task/1
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result
  end

  private

    def set_q
      @q = Task.ransack(params[:q])
    end

    def get_user
      @user = current_user()
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
