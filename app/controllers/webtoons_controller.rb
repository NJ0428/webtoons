class WebtoonsController < ApplicationController
  def index
    # 오늘 요일의 웹툰을 기본으로 표시
    today = get_korean_day_of_week
    @comics = Comic.where(day_of_week: today).order(:title)
    @current_day = today
  end

  def webtoon
    @comics = Comic.all.order(:title)
  end

  def webtoon_list
    @comic = Comic.find(params[:titleId])
    @episodes = @comic.episodes.order(episode_number: :desc)
  end

  def webtoon_detail
    @comic = Comic.find(params[:titleId])
    @episode = @comic.episodes.find_by(episode_number: params[:no])
  end

  # AJAX API for day-specific webtoons
  def by_day
    day = params[:day]
    comics = Comic.where(day_of_week: day).order(:title)
    
    render json: comics.map { |comic|
      {
        id: comic.id,
        title: comic.title,
        author: comic.author,
        thumbnail: comic.thumbnail_url,
        isNew: comic.is_new,
        rating: comic.rating,
        viewCount: comic.view_count,
        genre: comic.genre
      }
    }
  end

  private

  def get_korean_day_of_week
    days = ['일', '월', '화', '수', '목', '금', '토']
    days[Date.current.wday]
  end
end
