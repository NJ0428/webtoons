# 기존 데이터 삭제 (순서 중요: Episode 먼저, Comic 나중에)
Episode.destroy_all
Comic.destroy_all

# 요일별 웹툰 데이터
webtoons_data = [
  # 월요일 웹툰
  {
    title: "식탁의 신", author: "IUS", day_of_week: "월", genre: "판타지",
    description: "식탁을 오르는 소년 신의 모험과 성장 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=1",
    is_new: true, rating: 9.5, view_count: 1500000, status: "ongoing"
  },
  {
    title: "평민 오브 고등학교", author: "김용식", day_of_week: "월", genre: "액션",
    description: "고등학생들의 격투 토너먼트와 평민들의 힘",
    thumbnail_url: "https://picsum.photos/300/400?random=2",
    is_new: false, rating: 9.2, view_count: 1200000, status: "ongoing"
  },
  {
    title: "로블록스", author: "방제번", day_of_week: "월", genre: "액션",
    description: "현대에 깨어난 귀족 라이제르의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=3",
    is_new: false, rating: 9.0, view_count: 980000, status: "completed"
  },
  {
    title: "육성의 마음", author: "석식", day_of_week: "월", genre: "개그",
    description: "조석 작가의 일상을 그린 개그 웹툰",
    thumbnail_url: "https://picsum.photos/300/400?random=4",
    is_new: true, rating: 8.8, view_count: 2100000, status: "ongoing"
  },
  {
    title: "쿼카 여자친구", author: "임앙순", day_of_week: "월", genre: "SF",
    description: "우주 택배기사 덴마의 SF 액션 어드벤처",
    thumbnail_url: "https://picsum.photos/300/400?random=5",
    is_new: false, rating: 9.3, view_count: 850000, status: "ongoing"
  },
  {
    title: "실력지상주의", author: "최수정", day_of_week: "월", genre: "드라마",
    description: "외모로 달라지는 인생을 그린 현실 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=6",
    is_new: true, rating: 9.1, view_count: 1800000, status: "ongoing"
  },
  {
    title: "이것브레이커", author: "조용함", day_of_week: "월", genre: "스포츠",
    description: "자전거와 우정을 그린 청춘 스포츠 웹툰",
    thumbnail_url: "https://picsum.photos/300/400?random=7",
    is_new: false, rating: 8.9, view_count: 720000, status: "ongoing"
  },
  {
    title: "유로드로우", author: "김선욱", day_of_week: "월", genre: "스포츠",
    description: "농구를 통해 성장하는 청춘들의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=8",
    is_new: false, rating: 8.7, view_count: 650000, status: "ongoing"
  },

  # 화요일 웹툰
  {
    title: "혼자만 강해지기", author: "BUDU", day_of_week: "화", genre: "판타지",
    description: "최약체에서 최강자로 성장하는 진우의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=11",
    is_new: true, rating: 9.7, view_count: 2500000, status: "ongoing"
  },
  {
    title: "학교용병", author: "유대한", day_of_week: "화", genre: "액션",
    description: "용병 출신이 고등학교에 입학하며 벌어지는 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=12",
    is_new: false, rating: 9.0, view_count: 1100000, status: "ongoing"
  },
  {
    title: "벌집", author: "김규삼", day_of_week: "화", genre: "스릴러",
    description: "기생충과 인간의 생존 스릴러",
    thumbnail_url: "https://picsum.photos/300/400?random=13",
    is_new: true, rating: 8.9, view_count: 890000, status: "ongoing"
  },
  {
    title: "뜨거운강호", author: "전극진", day_of_week: "화", genre: "무협",
    description: "강호를 배경으로 한 무협 액션 웹툰",
    thumbnail_url: "https://picsum.photos/300/400?random=14",
    is_new: false, rating: 8.8, view_count: 1300000, status: "ongoing"
  },
  {
    title: "마스터", author: "류기운", day_of_week: "화", genre: "무협",
    description: "현대 무협의 새로운 장을 연 작품",
    thumbnail_url: "https://picsum.photos/300/400?random=15",
    is_new: false, rating: 9.2, view_count: 950000, status: "ongoing"
  },
  {
    title: "권투왕", author: "정지훈", day_of_week: "화", genre: "스포츠",
    description: "천재 복서의 성장과 갈등을 그린 스포츠 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=16",
    is_new: true, rating: 9.4, view_count: 1200000, status: "ongoing"
  },
  {
    title: "건드리지마", author: "massstar", day_of_week: "화", genre: "액션",
    description: "조직과 배신을 그린 느와르 액션",
    thumbnail_url: "https://picsum.photos/300/400?random=17",
    is_new: false, rating: 8.6, view_count: 780000, status: "ongoing"
  },
  {
    title: "킬러분식점", author: "이현민", day_of_week: "화", genre: "액션",
    description: "분식집을 운영하는 전직 킬러의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=18",
    is_new: true, rating: 8.8, view_count: 920000, status: "ongoing"
  },

  # 수요일 웹툰
  {
    title: "미녀강림", author: "야옹이", day_of_week: "수", genre: "로맨스",
    description: "메이크업으로 변신한 소녀의 로맨스 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=21",
    is_new: true, rating: 9.3, view_count: 2200000, status: "ongoing"
  },
  {
    title: "치킨인더트랩", author: "soonkki", day_of_week: "수", genre: "로맨스",
    description: "대학생들의 복잡한 인간관계와 로맨스",
    thumbnail_url: "https://picsum.photos/300/400?random=22",
    is_new: false, rating: 9.1, view_count: 1800000, status: "completed"
  },
  {
    title: "사랑혁명", author: "232", day_of_week: "수", genre: "로맨스",
    description: "고등학생들의 풋풋한 연애 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=23",
    is_new: false, rating: 8.9, view_count: 1500000, status: "ongoing"
  },
  {
    title: "지민이의 세포들", author: "이동건", day_of_week: "수", genre: "로맨스",
    description: "지민이와 세포들이 함께하는 일상과 연애",
    thumbnail_url: "https://picsum.photos/300/400?random=24",
    is_new: true, rating: 9.5, view_count: 2800000, status: "ongoing"
  },
  {
    title: "직장생활", author: "윤태호", day_of_week: "수", genre: "드라마",
    description: "직장인의 현실적인 이야기를 그린 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=25",
    is_new: false, rating: 9.6, view_count: 1600000, status: "completed"
  },
  {
    title: "요리의 영역", author: "조혜련", day_of_week: "수", genre: "드라마",
    description: "요리와 인생을 그린 휴먼 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=26",
    is_new: false, rating: 8.7, view_count: 680000, status: "ongoing"
  },
  {
    title: "달콤한집", author: "김칸비", day_of_week: "수", genre: "스릴러",
    description: "아파트에 갇힌 사람들의 생존 스릴러",
    thumbnail_url: "https://picsum.photos/300/400?random=27",
    is_new: true, rating: 9.2, view_count: 1900000, status: "completed"
  },
  {
    title: "도우미", author: "SSAK3", day_of_week: "수", genre: "스릴러",
    description: "초능력자들의 어두운 세계를 그린 스릴러",
    thumbnail_url: "https://picsum.photos/300/400?random=28",
    is_new: false, rating: 8.5, view_count: 750000, status: "ongoing"
  },

  # 목요일 웹툰
  {
    title: "마법학교", author: "김마법", day_of_week: "목", genre: "판타지",
    description: "마법학교에서 벌어지는 판타지 어드벤처",
    thumbnail_url: "https://picsum.photos/300/400?random=31",
    is_new: true, rating: 9.1, view_count: 1400000, status: "ongoing"
  },
  {
    title: "드래곤헌터", author: "이용사", day_of_week: "목", genre: "액션",
    description: "드래곤을 사냥하는 헌터들의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=32",
    is_new: false, rating: 8.9, view_count: 1200000, status: "ongoing"
  },
  {
    title: "시간여행자", author: "박시간", day_of_week: "목", genre: "SF",
    description: "시간을 넘나드는 여행자의 모험",
    thumbnail_url: "https://picsum.photos/300/400?random=33",
    is_new: true, rating: 9.3, view_count: 1600000, status: "ongoing"
  },
  {
    title: "좀비스쿨", author: "최좀비", day_of_week: "목", genre: "스릴러",
    description: "좀비가 된 학교에서의 생존기",
    thumbnail_url: "https://picsum.photos/300/400?random=34",
    is_new: false, rating: 8.7, view_count: 980000, status: "ongoing"
  },
  {
    title: "요괴탐정", author: "정요괴", day_of_week: "목", genre: "미스터리",
    description: "요괴 사건을 해결하는 탐정의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=35",
    is_new: true, rating: 8.8, view_count: 1100000, status: "ongoing"
  },
  {
    title: "로봇전쟁", author: "김로봇", day_of_week: "목", genre: "SF",
    description: "로봇과 인간의 전쟁을 그린 SF 액션",
    thumbnail_url: "https://picsum.photos/300/400?random=36",
    is_new: false, rating: 9.0, view_count: 1300000, status: "ongoing"
  },
  {
    title: "해적왕", author: "이해적", day_of_week: "목", genre: "모험",
    description: "바다를 누비는 해적들의 모험담",
    thumbnail_url: "https://picsum.photos/300/400?random=37",
    is_new: true, rating: 9.2, view_count: 1500000, status: "ongoing"
  },
  {
    title: "닌자마을", author: "박닌자", day_of_week: "목", genre: "액션",
    description: "닌자 마을에서 벌어지는 액션 어드벤처",
    thumbnail_url: "https://picsum.photos/300/400?random=38",
    is_new: false, rating: 8.6, view_count: 890000, status: "ongoing"
  },

  # 금요일 웹툰
  {
    title: "카페사장", author: "조카페", day_of_week: "금", genre: "로맨스",
    description: "카페를 운영하며 펼쳐지는 로맨스 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=41",
    is_new: true, rating: 9.0, view_count: 1300000, status: "ongoing"
  },
  {
    title: "비서님이 왜 그래요", author: "김비서", day_of_week: "금", genre: "로맨스",
    description: "사장과 비서의 로맨틱 코미디",
    thumbnail_url: "https://picsum.photos/300/400?random=42",
    is_new: false, rating: 8.9, view_count: 1200000, status: "ongoing"
  },
  {
    title: "회사맞선", author: "해화", day_of_week: "금", genre: "로맨스",
    description: "회사에서 시작된 맞선 로맨스",
    thumbnail_url: "https://picsum.photos/300/400?random=43",
    is_new: false, rating: 8.7, view_count: 1100000, status: "ongoing"
  },
  {
    title: "대기업 막내", author: "산경", day_of_week: "금", genre: "드라마",
    description: "대기업 막내 직원의 성장 스토리",
    thumbnail_url: "https://picsum.photos/300/400?random=44",
    is_new: true, rating: 9.1, view_count: 1400000, status: "ongoing"
  },
  {
    title: "오피스텔", author: "김오피", day_of_week: "금", genre: "드라마",
    description: "오피스텔에서 벌어지는 인간 군상극",
    thumbnail_url: "https://picsum.photos/300/400?random=45",
    is_new: false, rating: 8.8, view_count: 950000, status: "ongoing"
  },
  {
    title: "하늘성", author: "유하늘", day_of_week: "금", genre: "드라마",
    description: "상류층 아파트에서 벌어지는 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=46",
    is_new: false, rating: 9.2, view_count: 1600000, status: "ongoing"
  },
  {
    title: "호텔 달빛", author: "홍달빛", day_of_week: "금", genre: "판타지",
    description: "신비한 호텔에서 벌어지는 판타지 로맨스",
    thumbnail_url: "https://picsum.photos/300/400?random=47",
    is_new: true, rating: 9.3, view_count: 1700000, status: "ongoing"
  },
  {
    title: "사랑의 추락", author: "박추락", day_of_week: "금", genre: "로맨스",
    description: "운명적인 만남으로 시작된 로맨스",
    thumbnail_url: "https://picsum.photos/300/400?random=48",
    is_new: false, rating: 8.9, view_count: 1250000, status: "ongoing"
  },

  # 토요일 웹툰 (오늘)
  {
    title: "진짜교육", author: "채용택", day_of_week: "토", genre: "액션",
    description: "교권을 되찾기 위한 교사들의 진짜교육 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=51",
    is_new: true, rating: 9.4, view_count: 2100000, status: "ongoing"
  },
  {
    title: "백수전생", author: "리후진나 마고노테", day_of_week: "토", genre: "판타지",
    description: "이세계에서 다시 시작하는 인생 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=52",
    is_new: false, rating: 9.1, view_count: 1400000, status: "ongoing"
  },
  {
    title: "모든걸 아는 독자", author: "싱숑", day_of_week: "토", genre: "판타지",
    description: "소설 속 세계가 현실이 된 독자의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=53",
    is_new: true, rating: 9.6, view_count: 2300000, status: "ongoing"
  },
  {
    title: "산으로 돌아가다", author: "비가", day_of_week: "토", genre: "무협",
    description: "화산파 제자가 과거로 돌아가 펼치는 무협 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=54",
    is_new: false, rating: 9.3, view_count: 1700000, status: "ongoing"
  },
  {
    title: "나노머신", author: "한중월야", day_of_week: "토", genre: "SF",
    description: "나노머신과 함께하는 SF 액션",
    thumbnail_url: "https://picsum.photos/300/400?random=55",
    is_new: false, rating: 8.8, view_count: 890000, status: "ongoing"
  },
  {
    title: "아이템빨", author: "A.T Kenny", day_of_week: "토", genre: "판타지",
    description: "아이템의 힘으로 성장하는 판타지 어드벤처",
    thumbnail_url: "https://picsum.photos/300/400?random=56",
    is_new: true, rating: 9.0, view_count: 1300000, status: "ongoing"
  },
  {
    title: "게임이 너무 어렵다", author: "간지남", day_of_week: "토", genre: "판타지",
    description: "지옥 난이도 게임에서 살아남기",
    thumbnail_url: "https://picsum.photos/300/400?random=57",
    is_new: false, rating: 8.9, view_count: 1100000, status: "ongoing"
  },
  {
    title: "최고의 건축가", author: "김수한무", day_of_week: "토", genre: "판타지",
    description: "건축 지식으로 이세계를 정복하는 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=58",
    is_new: true, rating: 8.7, view_count: 950000, status: "ongoing"
  },

  # 일요일 웹툰
  {
    title: "마루의 한", author: "김정현", day_of_week: "일", genre: "드라마",
    description: "마루의 한을 그린 감동적인 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=61",
    is_new: false, rating: 8.9, view_count: 1200000, status: "ongoing"
  },
  {
    title: "목욕탕의 신", author: "하일권", day_of_week: "일", genre: "개그",
    description: "목욕탕에서 벌어지는 유쾌한 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=62",
    is_new: true, rating: 8.7, view_count: 980000, status: "ongoing"
  },
  {
    title: "쿠키런 어드벤처", author: "데브시스터즈", day_of_week: "일", genre: "모험",
    description: "쿠키들의 신나는 모험 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=63",
    is_new: false, rating: 8.5, view_count: 1500000, status: "ongoing"
  },
  {
    title: "좀비소녀", author: "우노", day_of_week: "일", genre: "스릴러",
    description: "좀비가 된 소녀의 특별한 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=64",
    is_new: false, rating: 8.6, view_count: 890000, status: "ongoing"
  },
  {
    title: "가족 이야기", author: "김양수", day_of_week: "일", genre: "드라마",
    description: "따뜻한 가족의 일상을 그린 휴먼 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=65",
    is_new: true, rating: 9.0, view_count: 1100000, status: "ongoing"
  },
  {
    title: "신과 함께하는 여행", author: "주호민", day_of_week: "일", genre: "판타지",
    description: "신과 함께하는 특별한 여행 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=66",
    is_new: false, rating: 9.2, view_count: 1600000, status: "completed"
  },
  {
    title: "이말년의 일상", author: "이말년", day_of_week: "일", genre: "개그",
    description: "이말년 작가의 유쾌한 일상 개그",
    thumbnail_url: "https://picsum.photos/300/400?random=67",
    is_new: false, rating: 8.8, view_count: 1300000, status: "ongoing"
  },
  {
    title: "심슨네 가족", author: "맷 그로닝", day_of_week: "일", genre: "개그",
    description: "심슨 가족의 유쾌한 일상 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=68",
    is_new: true, rating: 8.9, view_count: 1400000, status: "ongoing"
  }
  {
    title: "유로드로우", author: "김선욱", day_of_week: "월", genre: "스포츠",
    description: "농구를 통해 성장하는 청춘들의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=8",
    is_new: false, rating: 8.7, view_count: 650000, status: "ongoing"
  },

  # 화요일 웹툰
  {
    title: "나 혼자만 레벨업", author: "DUBU", day_of_week: "화", genre: "판타지",
    description: "최약체 헌터에서 최강자로 성장하는 성진우의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=11",
    is_new: true, rating: 9.7, view_count: 2500000, status: "completed"
  },
  {
    title: "입학용병", author: "유대영", day_of_week: "화", genre: "액션",
    description: "용병 출신이 고등학교에 입학하며 벌어지는 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=12",
    is_new: false, rating: 9.0, view_count: 1100000, status: "ongoing"
  },
  {
    title: "하이브", author: "김규삼", day_of_week: "화", genre: "스릴러",
    description: "기생충과 인간의 생존 스릴러",
    thumbnail_url: "https://picsum.photos/300/400?random=13",
    is_new: true, rating: 8.9, view_count: 890000, status: "ongoing"
  },
  {
    title: "열혈강호", author: "전극진", day_of_week: "화", genre: "무협",
    description: "강호를 배경으로 한 무협 액션 웹툰",
    thumbnail_url: "https://picsum.photos/300/400?random=14",
    is_new: false, rating: 8.8, view_count: 1300000, status: "ongoing"
  },
  {
    title: "고수", author: "류기운", day_of_week: "화", genre: "무협",
    description: "현대 무협의 새로운 장을 연 작품",
    thumbnail_url: "https://picsum.photos/300/400?random=15",
    is_new: false, rating: 9.2, view_count: 950000, status: "ongoing"
  },
  {
    title: "더 복서", author: "정지훈", day_of_week: "화", genre: "스포츠",
    description: "천재 복서의 성장과 갈등을 그린 스포츠 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=16",
    is_new: true, rating: 9.4, view_count: 1200000, status: "completed"
  },
  {
    title: "언터처블", author: "massstar", day_of_week: "화", genre: "액션",
    description: "조직과 배신을 그린 느와르 액션",
    thumbnail_url: "https://picsum.photos/300/400?random=17",
    is_new: false, rating: 8.6, view_count: 780000, status: "ongoing"
  },
  {
    title: "킬러분식", author: "이현민", day_of_week: "화", genre: "액션",
    description: "분식집을 운영하는 전직 킬러의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=18",
    is_new: true, rating: 8.8, view_count: 920000, status: "ongoing"
  },

  # 수요일 웹툰
  {
    title: "여신강림", author: "야옹이", day_of_week: "수", genre: "로맨스",
    description: "메이크업으로 변신한 소녀의 로맨스 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=21",
    is_new: true, rating: 9.3, view_count: 2200000, status: "completed"
  },
  {
    title: "치즈인더트랩", author: "soonkki", day_of_week: "수", genre: "로맨스",
    description: "대학생들의 복잡한 인간관계와 로맨스",
    thumbnail_url: "https://picsum.photos/300/400?random=22",
    is_new: false, rating: 9.1, view_count: 1800000, status: "completed"
  },
  {
    title: "연애혁명", author: "232", day_of_week: "수", genre: "로맨스",
    description: "고등학생들의 풋풋한 연애 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=23",
    is_new: false, rating: 8.9, view_count: 1500000, status: "ongoing"
  },
  {
    title: "유미의 세포들", author: "이동건", day_of_week: "수", genre: "로맨스",
    description: "유미와 세포들이 함께하는 일상과 연애",
    thumbnail_url: "https://picsum.photos/300/400?random=24",
    is_new: true, rating: 9.5, view_count: 2800000, status: "completed"
  },
  {
    title: "미생", author: "윤태호", day_of_week: "수", genre: "드라마",
    description: "직장인의 현실적인 이야기를 그린 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=25",
    is_new: false, rating: 9.6, view_count: 1600000, status: "completed"
  },
  {
    title: "조의 영역", author: "조혜련", day_of_week: "수", genre: "드라마",
    description: "요리와 인생을 그린 휴먼 드라마",
    thumbnail_url: "https://picsum.photos/300/400?random=26",
    is_new: false, rating: 8.7, view_count: 680000, status: "ongoing"
  },
  {
    title: "스위트홈", author: "김칸비", day_of_week: "수", genre: "스릴러",
    description: "아파트에 갇힌 사람들의 생존 스릴러",
    thumbnail_url: "https://picsum.photos/300/400?random=27",
    is_new: true, rating: 9.2, view_count: 1900000, status: "completed"
  },
  {
    title: "헬퍼", author: "SSAK3", day_of_week: "수", genre: "스릴러",
    description: "초능력자들의 어두운 세계를 그린 스릴러",
    thumbnail_url: "https://picsum.photos/300/400?random=28",
    is_new: false, rating: 8.5, view_count: 750000, status: "ongoing"
  },

  # 토요일 웹툰 (오늘)
  {
    title: "참교육", author: "채용택", day_of_week: "토", genre: "액션",
    description: "교권을 되찾기 위한 교사들의 참교육 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=51",
    is_new: true, rating: 9.4, view_count: 2100000, status: "ongoing"
  },
  {
    title: "무직전생", author: "리후진나 마고노테", day_of_week: "토", genre: "판타지",
    description: "이세계에서 다시 시작하는 인생 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=52",
    is_new: false, rating: 9.1, view_count: 1400000, status: "ongoing"
  },
  {
    title: "전지적 독자 시점", author: "싱숑", day_of_week: "토", genre: "판타지",
    description: "소설 속 세계가 현실이 된 독자의 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=53",
    is_new: true, rating: 9.6, view_count: 2300000, status: "ongoing"
  },
  {
    title: "화산귀환", author: "비가", day_of_week: "토", genre: "무협",
    description: "화산파 제자가 과거로 돌아가 펼치는 무협 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=54",
    is_new: false, rating: 9.3, view_count: 1700000, status: "ongoing"
  },
  {
    title: "나노리스트", author: "한중월야", day_of_week: "토", genre: "SF",
    description: "나노머신과 함께하는 SF 액션",
    thumbnail_url: "https://picsum.photos/300/400?random=55",
    is_new: false, rating: 8.8, view_count: 890000, status: "ongoing"
  },
  {
    title: "템빨", author: "A.T Kenny", day_of_week: "토", genre: "판타지",
    description: "아이템의 힘으로 성장하는 판타지 어드벤처",
    thumbnail_url: "https://picsum.photos/300/400?random=56",
    is_new: true, rating: 9.0, view_count: 1300000, status: "ongoing"
  },
  {
    title: "튜토리얼이 너무 어렵다", author: "간지남", day_of_week: "토", genre: "판타지",
    description: "지옥 난이도 튜토리얼에서 살아남기",
    thumbnail_url: "https://picsum.photos/300/400?random=57",
    is_new: false, rating: 8.9, view_count: 1100000, status: "ongoing"
  },
  {
    title: "역대급 영지 설계사", author: "김수한무", day_of_week: "토", genre: "판타지",
    description: "건축 지식으로 이세계를 정복하는 이야기",
    thumbnail_url: "https://picsum.photos/300/400?random=58",
    is_new: true, rating: 8.7, view_count: 950000, status: "ongoing"
  }
]

# 웹툰 데이터 생성
puts "웹툰 데이터를 생성하는 중..."

webtoons_data.each do |webtoon_data|
  comic = Comic.create!(webtoon_data)
  
  # 각 웹툰마다 15-50개의 에피소드 생성
  episode_count = rand(15..50)
  episode_count.times do |i|
    Episode.create!(
      title: "#{i + 1}화 - #{webtoon_data[:title]}",
      episode_number: i + 1,
      comic: comic
    )
  end
  
  print "."
end

puts "\n✅ #{Comic.count}개의 웹툰과 #{Episode.count}개의 에피소드가 생성되었습니다!"

# 요일별 통계 출력
%w[월 화 수 목 금 토 일].each do |day|
  count = Comic.where(day_of_week: day).count
  puts "#{day}요일: #{count}개 웹툰"
end