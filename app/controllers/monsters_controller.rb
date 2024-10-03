class MonstersController < ApplicationController
  def index
    page = params[:page] || 1
    response = Monsters::ListService.call(page)
    @monsters = response[:monsters]
    @pagination = response[:pagination]
  end

  def show
    monster_index = params[:id]

    @monster = Monsters::ShowService.call(monster_index)
  end
end
