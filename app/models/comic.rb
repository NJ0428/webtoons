class Comic < ApplicationRecord
  has_many :episodes
  
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
end
