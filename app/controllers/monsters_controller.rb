class MonstersController < ApplicationController
  def index
    page = params[:page] || 1
    sort_order = params[:sort] || 'asc'
    sort_by = params[:sort_by] || 'name'
    
    Rails.logger.info "Controller params - Sort by: #{sort_by}, Sort order: #{sort_order}"
    
    response = Monsters::ListService.call(page, sort_order, sort_by)
    @monsters = response[:monsters]
    @pagination = response[:pagination]
    @current_sort_order = sort_order
    @current_sort_by = sort_by
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
