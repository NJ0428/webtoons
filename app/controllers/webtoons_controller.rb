class WebtoonsController < ApplicationController
  def index
    # 오늘 요일의 웹툰을 기본으로 표시
    today = get_korean_day_of_week
    @comics = Comic.where(day_of_week: today).order(:title)
    @current_day = today
    
    # 인기 급상승 웹툰 (조회수 기준 상위 10개)
    @trending_comics = Comic.order(view_count: :desc).limit(10)
    
    # 완결 웹툰 (상태가 완결인 웹툰들 중 평점 높은 순)
    @completed_comics = Comic.where(status: 'completed').order(rating: :desc).limit(5)
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

  def genre
    @genre = params[:genre]
    @genre_korean = get_korean_genre(@genre)
    @comics = Comic.where(genre: @genre_korean).order(view_count: :desc)
    
    # 장르별 통계
    @total_count = @comics.count
    @avg_rating = @comics.average(:rating)&.round(1) || 0
    @popular_comics = @comics.limit(6)
    @recent_comics = @comics.order(created_at: :desc).limit(6)
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

  # AJAX API for trending webtoons
  def trending
    trending_comics = Comic.order(view_count: :desc).limit(10)
    
    render json: trending_comics.map.with_index { |comic, index|
      {
        id: comic.id,
        title: comic.title,
        author: comic.author,
        rating: comic.rating,
        viewCount: comic.view_count,
        dayOfWeek: comic.day_of_week,
        rank: index + 1,
        isTopThree: index < 3
      }
    }
  end

  # AJAX API for genre-specific webtoons
  def by_genre
    genre = params[:genre]
    genre_korean = get_korean_genre(genre)
    sort = params[:sort] || 'popular'
    
    comics = Comic.where(genre: genre_korean)
    
    case sort
    when 'popular'
      comics = comics.order(view_count: :desc)
    when 'rating'
      comics = comics.order(rating: :desc)
    when 'recent'
      comics = comics.order(created_at: :desc)
    else
      comics = comics.order(:title)
    end
    
    render json: comics.map { |comic|
      {
        id: comic.id,
        title: comic.title,
        author: comic.author,
        thumbnail: comic.thumbnail_url,
        isNew: comic.is_new,
        rating: comic.rating,
        viewCount: comic.view_count,
        genre: comic.genre,
        dayOfWeek: comic.day_of_week
      }
    }
  end

  private

  def get_korean_day_of_week
    days = ['일', '월', '화', '수', '목', '금', '토']
    days[Date.current.wday]
  end

  def get_korean_genre(genre)
    genre_map = {
      'romance' => '로맨스',
      'action' => '액션',
      'fantasy' => '판타지',
      'daily' => '일상',
      'comedy' => '개그',
      'thriller' => '스릴러',
      'drama' => '드라마',
      'horror' => '공포',
      'sports' => '스포츠',
      'historical' => '사극'
    }
    genre_map[genre] || genre
  end
end
