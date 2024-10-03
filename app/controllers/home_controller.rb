class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @ability_scores = DndApiService.get_resource('/ability-scores')
  end
end
