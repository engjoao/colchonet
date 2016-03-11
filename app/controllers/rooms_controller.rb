class RoomsController < ApplicationController

  before_action :require_authentication, 
    :only => [:new, :edit, :create, :update, :destroy]

  def index
    # Exercício pra você! Crie um escopo para ordenar
    # os quartos dos mais recentes aos mais antigos.
    @rooms = Room.most_recent
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = current_user.rooms.build
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room, :notice => t('flash.notice.room_created')
    else
      render action: "new"
    end
  end

  def update
    @room = current_user.rooms.find(params[:id])

    if @room.update_attributes(room_params)
      redirect_to @room, :notice => t('flash.notice.room_update')
    else
      render :action => "edit"
    end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])
    @room.destroy
    
    redirect_to rooms_url
  end

  private
  ##Strong Parameters
  def room_params
    params.require(:room).permit(:description, :location, :title)
  end
end