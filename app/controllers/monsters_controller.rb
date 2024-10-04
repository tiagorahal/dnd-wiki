class MonstersController < ApplicationController
  def index
    page = params[:page] || 1
    sort_order = params[:sort] || 'asc'
    response = Monsters::ListService.call(page, sort_order)
    @monsters = response[:monsters]
    @pagination = response[:pagination]
  end

  def show
    monster_index = params[:id]
  
    @monster = Monsters::ShowService.call(monster_index)
    if @monster.nil?
      flash[:alert] = "Unable to fetch monster details at this time. Please try again later."
      redirect_to monsters_path
    end
  end
end
