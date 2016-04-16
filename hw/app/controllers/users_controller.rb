class UsersController < ApplicationController
  before_action  :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
      if(session[:username] && session[:username]=='admin1')
          @users = User.all.paginate(page: params[:page], per_page: 5)
        else
           respond_to do |format|
           format.html { redirect_to controller: 'welcome', action: 'index', notice: 'Only Admin is allowed access' }
          end
      end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if !session[:username] || session[:username]=='admin1'
       log_out
      respond_to do |format|
        format.html { redirect_to controller: 'admin_controller', action: 'error', notice: 'In valid user access' }
      end
    end 
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if !session[:username]
      respond_to do |format|
       format.html { redirect_to controller: 'admin_controller', action: 'error', notice: 'In valid user access' }
      end
    end 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to controller: 'welcome', action: 'index', notice: 'User was successfully created.'}
        format.json { render :show, status: :created, location: @user }
      else
        
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username,:email,:latitude,:longitude,:password,:type,:commodity)
    end
    
    def isloggedin
      if logged_in?
          respond_to do |format|
          format.html { redirect_to controller: 'welcome', action: 'index', notice: 'Please login' }
        end
      end 
    end 
end
