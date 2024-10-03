class MonstersController < ApplicationController
  def index
    @monsters = Monsters::ListService.call
  end

  def show
    monster_index = params[:id]

    @monster = Monsters::ShowService.call(monster_index)
  end
end
