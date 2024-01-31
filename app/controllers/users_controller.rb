class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create, :index]
  before_action :list_selected , except: [:index, :update, :destroy]

  def index
    @users = User.all.order(created_at: :desc)
    @json = User.all.order(created_at: :desc).as_json
  end

  def show
    @sex = sex_text(@user)
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
    params = user_params
    allowed_age_for_register(params)
    @user = User.create(params)
    
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
      @list = select_sex
    end

    def sex_text(user)
      @sex = Sex.find(user.sex_id).description 
    end

    def allowed_age_for_register(params)
      value_year = params['birthdate'].split("-")
      born_year = value_year[0].to_i
      actual_year = DateTime.now.strftime('%Y').to_i
      if user_age(born_year , actual_year)
        params
      else
        params['birthdate'] = nil
      end
    end

    def user_age(born_year, actual_year)
      total = actual_year - born_year
      if total >= 18
        return true
      else
        return false
      end
    end
end
