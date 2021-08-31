class PopularController < ApplicationController
  before_action :load_tag, only: :create
  def create
    TagHelper.create(tag_id: @tag.id)
    redirect_to tours_path(term: @tag.tag_name)
  end

  private

    def popular_params
      params.permit(:id)
    end
end