class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create, :index]
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @sex = sex_text(@user)
  end

  def edit
    @list = list_selected
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "actualizacion de datos"
    else
      render :edit, status: :unprocessable_entity, alert: "no se pudo actualizar los datos"
    end
  end

  def new
    @user = User.new
    @list = list_selected
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to users_path, notice: "se guardo bien"
    else
      render :new, status: :unprocessable_entity, alert: "tenemos un error, llena de nuevo el formulario"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "se elimino el usuario"
  end

  private

    def user_params
      params
      .require(:user)
      .permit(:name,
              :last_name,
              :email,
              :address,
              :living_place,
              :observations,
              :birthdate,
              :sex_id
             )
    end

    def find_user
      @user = User.find(params[:id])
    end

    def list_selected
      list = Sex.all.as_json
      list.map{|x| x.delete('updated_at') && x.delete('created_at')}
      new_hash = list.map{ |x| new = {x.values.first => x.values.last} } 
      invert_hast = new_hash.map{|x| x.invert}
      select_sex = {}
      invert_hast.each{|x| select_sex.merge!(x)}
      select_sex
    end

    def sex_text(user)
      @sex = Sex.find(user.sex_id).description 
    end
end
