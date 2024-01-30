class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
  end

  def edit
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
              :birthdate
             )
    end
end
