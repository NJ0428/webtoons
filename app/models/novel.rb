class Novel < ApplicationRecord
  # 장르 상수 정의
  GENRES = {
    'romance' => '로맨스',
    'fantasy' => '판타지',
    'modern_fantasy' => '현대판타지',
    'martial_arts' => '무협',
    'mystery' => '미스터리',
    'thriller' => '스릴러',
    'drama' => '드라마',
    'comedy' => '코미디',
    'historical' => '사극',
    'sf' => 'SF'
  }.freeze

  # 카테고리 상수 정의
  CATEGORIES = {
    'novel' => '웹소설',
    'best_novel' => '베스트리그',
    'challenge_novel' => '도전소설'
  }.freeze

  # 장르별 스코프
  scope :by_genre, ->(genre) { where(genre: genre) }
  scope :popular, -> { order(view_count: :desc) }
  scope :highly_rated, -> { order(rating: :desc) }
  scope :recent, -> { order(created_at: :desc) }
  scope :new_novels, -> { where(is_new: true) }

  # 검색 스코프
  scope :search_by_title_and_author, ->(query) {
    return all if query.blank?
    where("LOWER(title) LIKE ? OR LOWER(author) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%")
  }

  # 장르 한글명 반환
  def genre_korean
    GENRES[genre] || genre
  end

  # 카테고리 한글명 반환
  def category_korean
    CATEGORIES[category] || category
  end

  # 완결 여부
  def completed?
    status == 'completed'
  end

  # 연재중 여부
  def ongoing?
    status == 'ongoing'
  end

  # 신작 여부
  def new?
    is_new
  end
end
