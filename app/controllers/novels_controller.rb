class NovelsController < ApplicationController
  def index
    @novels = Novel.all.order(view_count: :desc)
    @popular_novels = Novel.popular.limit(15)
    @new_novels = Novel.new_novels.limit(10)
    @romance_novels = Novel.by_genre('romance').popular.limit(8)
    @fantasy_novels = Novel.by_genre('fantasy').popular.limit(8)
    @total_count = @novels.count
  end

  def show
    @novel = Novel.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to novels_path, alert: "소설을 찾을 수 없습니다."
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :author, :description, :genre, :thumbnail_url, :rating, :view_count, :status, :is_new, :category, :chapter_count, :update_day)
  end
end
