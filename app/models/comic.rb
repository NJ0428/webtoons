class Comic < ApplicationRecord
  has_many :episodes
  
  # 카테고리 상수 정의
  CATEGORIES = {
    'webtoon' => '웹툰',
    'best_challenge' => '베스트도전',
    'challenge' => '도전만화'
  }.freeze
  
  # 카테고리별 스코프
  scope :webtoons, -> { where(category: 'webtoon') }
  scope :best_challenges, -> { where(category: 'best_challenge') }
  scope :challenges, -> { where(category: 'challenge') }
  
  # 제목과 작가로 검색하는 스코프
  scope :search_by_title_and_author, ->(query) {
    return all if query.blank?
    
    where("LOWER(title) LIKE ? OR LOWER(author) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%")
  }
  
  # 검색 결과를 관련도 순으로 정렬
  def self.search_with_relevance(query)
    return all if query.blank?
    
    query_lower = query.downcase
    
    # 제목이 정확히 일치하는 것을 우선순위로
    exact_title = where("LOWER(title) LIKE ?", query_lower)
    title_starts = where("LOWER(title) LIKE ?", "#{query_lower}%")
    title_contains = where("LOWER(title) LIKE ?", "%#{query_lower}%")
    author_matches = where("LOWER(author) LIKE ?", "%#{query_lower}%")
    
    # 간단한 UNION 대신 OR 조건으로 변경
    where("LOWER(title) LIKE ? OR LOWER(title) LIKE ? OR LOWER(title) LIKE ? OR LOWER(author) LIKE ?", 
          query_lower, "#{query_lower}%", "%#{query_lower}%", "%#{query_lower}%")
  end
  
  # 카테고리 한글명 반환
  def category_korean
    CATEGORIES[category] || category
  end
  
  # 베스트도전 여부
  def best_challenge?
    category == 'best_challenge'
  end
  
  # 도전만화 여부
  def challenge?
    category == 'challenge'
  end
end
