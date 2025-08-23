# 기존 데이터 삭제 (순서 중요: Episode 먼저, Comic 나중에)
Episode.destroy_all
Comic.destroy_all
Novel.destroy_all
User.destroy_all

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
  },
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

# 베스트도전 샘플 데이터
best_challenge_data = {
  title: "신인 작가의 꿈", 
  author: "김신인", 
  day_of_week: "", 
  genre: "드라마",
  description: "웹툰 작가를 꿈꾸는 신인의 성장 이야기",
  thumbnail_url: "https://picsum.photos/300/400?random=101",
  is_new: true, 
  rating: 8.5, 
  view_count: 45000, 
  status: "ongoing",
  category: "best_challenge"
}

# 도전만화 샘플 데이터
challenge_data = {
  title: "일상의 소소한 행복", 
  author: "박일상", 
  day_of_week: "", 
  genre: "일상",
  description: "평범한 일상 속에서 찾는 작은 행복들",
  thumbnail_url: "https://picsum.photos/300/400?random=102",
  is_new: true, 
  rating: 7.8, 
  view_count: 12000, 
  status: "ongoing",
  category: "challenge"
}

puts "\n베스트도전과 도전만화 데이터를 생성하는 중..."

# 베스트도전 생성
best_challenge_comic = Comic.create!(best_challenge_data)
10.times do |i|
  Episode.create!(
    title: "#{i + 1}화 - #{best_challenge_data[:title]}",
    episode_number: i + 1,
    comic: best_challenge_comic
  )
end

# 도전만화 생성
challenge_comic = Comic.create!(challenge_data)
5.times do |i|
  Episode.create!(
    title: "#{i + 1}화 - #{challenge_data[:title]}",
    episode_number: i + 1,
    comic: challenge_comic
  )
end

puts "✅ 베스트도전 1개, 도전만화 1개가 추가로 생성되었습니다!"

# 테스트 사용자 생성
puts "\n테스트 사용자를 생성하는 중..."

test_user = User.create!(
  name: "김웹툰",
  nickname: "webtoon_creator",
  email: "test@example.com",
  password: "123456",
  password_confirmation: "123456",
  phone: "010-1234-5678",
  birth_date: Date.new(1990, 5, 15),
  gender: "male",
  bio: "웹툰을 사랑하는 크리에이터입니다."
)

puts "✅ 테스트 사용자가 생성되었습니다: #{test_user.email}"

# 웹소설 샘플 데이터
novels_data = [
  # 로맨스 장르
  {
    title: "이제 사랑받을 수 있을까요?",
    author: "마굴",
    genre: "romance",
    description: "30년 만에 그녀가 돌아왔다. 까만 양산을 들고서. 황제의 사랑을 받지 못한 황후가 과거로 돌아가 새로운 사랑을 찾는 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=201",
    rating: 9.2,
    view_count: 2500000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 85,
    update_day: "매주 화, 목"
  },
  {
    title: "이제 사랑받을 수 있을까요? 2부",
    author: "마굴",
    genre: "romance",
    description: "황후의 두 번째 인생이 시작된다. 이번에는 진정한 사랑을 찾을 수 있을까? 더욱 깊어진 감정과 새로운 인물들이 등장하는 후속작.",
    thumbnail_url: "https://picsum.photos/200/280?random=209",
    rating: 9.4,
    view_count: 1800000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 42,
    update_day: "매주 월, 금"
  },
  {
    title: "이제 사랑받을 수 있을까요? 외전",
    author: "마굴",
    genre: "romance",
    description: "본편에서 다루지 못한 황제와 황후의 과거 이야기. 그들이 처음 만났던 순간부터 사랑이 식어가기까지의 숨겨진 진실을 담은 외전.",
    thumbnail_url: "https://picsum.photos/200/280?random=210",
    rating: 9.0,
    view_count: 1200000,
    status: "completed",
    is_new: false,
    category: "novel",
    chapter_count: 28,
    update_day: "완결"
  },
  {
    title: "내 쓰레기통이 후회하고 있다",
    author: "리더스",
    genre: "fantasy",
    description: "버려진 것들이 후회하며 돌아오는 판타지 로맨스. 차가운 남주가 따뜻한 사랑을 깨달아가는 과정을 그린 작품.",
    thumbnail_url: "https://picsum.photos/200/280?random=202",
    rating: 8.9,
    view_count: 1800000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 67,
    update_day: "매주 월, 수, 금"
  },
  {
    title: "음울한 남자",
    author: "김음울",
    genre: "romance",
    description: "차가운 외면 뒤에 숨겨진 따뜻한 마음. 음울한 남자와 밝은 여자의 달콤한 로맨스가 펼쳐진다.",
    thumbnail_url: "https://picsum.photos/200/280?random=203",
    rating: 8.7,
    view_count: 1950000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 42,
    update_day: "매주 화, 금"
  },
  {
    title: "아내를 숨겨라",
    author: "백미경",
    genre: "romance",
    description: "계약결혼으로 시작된 관계가 진짜 사랑으로 발전하는 달콤한 로맨스 소설. 숨겨진 아내의 정체가 밝혀지면서 벌어지는 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=204",
    rating: 9.0,
    view_count: 2100000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 78,
    update_day: "매주 월, 목"
  },
  {
    title: "완벽한 위장결혼",
    author: "이완벽",
    genre: "romance",
    description: "위장결혼으로 시작했지만 점점 진짜 사랑에 빠져가는 두 사람의 이야기. 완벽한 연기가 진심이 되어가는 과정을 그린다.",
    thumbnail_url: "https://picsum.photos/200/280?random=205",
    rating: 8.8,
    view_count: 1650000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 55,
    update_day: "매주 수, 토"
  },
  {
    title: "달콤한 집착",
    author: "설탕",
    genre: "romance",
    description: "달콤하지만 위험한 집착. 사랑과 소유욕 사이에서 흔들리는 두 사람의 복잡한 감정을 섬세하게 그린 작품.",
    thumbnail_url: "https://picsum.photos/200/280?random=206",
    rating: 8.6,
    view_count: 1400000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 63,
    update_day: "매주 화, 목, 일"
  },
  {
    title: "내가 키운 너의 여름",
    author: "정여름",
    genre: "romance",
    description: "어린 시절부터 함께 자란 두 사람의 성장 로맨스. 오빠 같았던 남자가 어느새 사랑하는 사람이 되어가는 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=207",
    rating: 9.1,
    view_count: 1750000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 48,
    update_day: "매주 월, 수"
  },
  {
    title: "감사합니다 계약남편",
    author: "신혼",
    genre: "romance",
    description: "계약남편으로 시작했지만 진짜 남편이 되어가는 과정. 서로에게 감사하며 사랑을 키워가는 따뜻한 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=208",
    rating: 8.9,
    view_count: 1320000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 71,
    update_day: "매주 목, 일"
  },
  
  # 판타지 장르 추가
  {
    title: "던전 마스터의 귀환",
    author: "김판타지",
    genre: "fantasy",
    description: "최강의 던전 마스터가 과거로 돌아가 다시 세계를 구원하는 이야기. 숨겨진 던전과 몬스터들과의 치열한 전투가 펼쳐진다.",
    thumbnail_url: "https://picsum.photos/200/280?random=211",
    rating: 9.5,
    view_count: 3200000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 124,
    update_day: "매주 월, 수, 금"
  },
  {
    title: "마법사 학원의 낙제생",
    author: "이마법",
    genre: "fantasy",
    description: "마법 재능이 없다고 여겨진 소년이 숨겨진 힘을 깨우며 최강의 마법사로 성장하는 학원 판타지.",
    thumbnail_url: "https://picsum.photos/200/280?random=212",
    rating: 8.9,
    view_count: 2100000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 89,
    update_day: "매주 화, 목"
  },
  
  # 현대판타지 장르
  {
    title: "도시의 숨겨진 던전",
    author: "박현대",
    genre: "modern_fantasy",
    description: "평범한 도시 속에 숨겨진 던전이 나타나고, 평범한 직장인이 어웨이커로 각성하게 되는 현대 판타지.",
    thumbnail_url: "https://picsum.photos/200/280?random=213",
    rating: 9.1,
    view_count: 2800000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 76,
    update_day: "매주 월, 금"
  },
  {
    title: "회귀한 S급 헌터",
    author: "최헌터",
    genre: "modern_fantasy",
    description: "죽음 직전에 과거로 돌아간 최강의 헌터가 다시 몬스터들과 싸우며 세계를 구하는 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=214",
    rating: 9.3,
    view_count: 3500000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 98,
    update_day: "매주 화, 금"
  },
  
  # 무협 장르
  {
    title: "절세무신의 환생",
    author: "강무협",
    genre: "martial_arts",
    description: "무림 최고수가 다시 태어나 새로운 무공으로 무림을 평정하는 정통 무협 소설.",
    thumbnail_url: "https://picsum.photos/200/280?random=215",
    rating: 8.8,
    view_count: 1900000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 156,
    update_day: "매주 월, 목"
  },
  {
    title: "마검의 계승자",
    author: "검무림",
    genre: "martial_arts",
    description: "전설의 마검을 얻은 소년이 무림을 뒤흔드는 절세무공을 익혀가는 무협 액션.",
    thumbnail_url: "https://picsum.photos/200/280?random=216",
    rating: 9.0,
    view_count: 2200000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 112,
    update_day: "매주 수, 토"
  },
  
  # 미스터리 장르
  {
    title: "심야의 탐정",
    author: "정미스터리",
    genre: "mystery",
    description: "밤에만 나타나는 연쇄살인마를 쫓는 천재 탐정의 추리 스릴러. 매 화마다 숨막히는 반전이 기다린다.",
    thumbnail_url: "https://picsum.photos/200/280?random=217",
    rating: 8.7,
    view_count: 1650000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 67,
    update_day: "매주 화, 일"
  },
  {
    title: "사라진 기억의 진실",
    author: "한추리",
    genre: "mystery",
    description: "기억을 잃은 주인공이 자신의 과거를 추적하며 거대한 음모에 휘말리게 되는 심리 스릴러.",
    thumbnail_url: "https://picsum.photos/200/280?random=218",
    rating: 9.2,
    view_count: 1820000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 45,
    update_day: "매주 목, 토"
  },
  
  # 스릴러 장르
  {
    title: "지하철 13번 출구",
    author: "김스릴러",
    genre: "thriller",
    description: "존재하지 않는 지하철 출구로 들어간 사람들이 마주하는 공포와 생존을 그린 서바이벌 스릴러.",
    thumbnail_url: "https://picsum.photos/200/280?random=219",
    rating: 8.9,
    view_count: 2100000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 78,
    update_day: "매주 월, 수"
  },
  {
    title: "24시간 생존게임",
    author: "박서바이벌",
    genre: "thriller",
    description: "갑작스럽게 시작된 데스게임에서 24시간 내에 살아남아야 하는 사람들의 절망적인 생존기.",
    thumbnail_url: "https://picsum.photos/200/280?random=220",
    rating: 8.6,
    view_count: 1750000,
    status: "completed",
    is_new: false,
    category: "novel",
    chapter_count: 120,
    update_day: "완결"
  },
  
  # 드라마 장르
  {
    title: "아버지의 유산",
    author: "이드라마",
    genre: "drama",
    description: "갑작스럽게 아버지로부터 거대한 유산을 물려받은 평범한 회사원이 겪는 가족과 사랑의 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=221",
    rating: 9.1,
    view_count: 1980000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 94,
    update_day: "매주 화, 금"
  },
  {
    title: "의사의 마음",
    author: "백의사",
    genre: "drama",
    description: "환자를 구하는 것이 사명인 의사가 의료진으로서의 갈등과 성장을 그린 메디컬 드라마.",
    thumbnail_url: "https://picsum.photos/200/280?random=222",
    rating: 8.8,
    view_count: 1450000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 63,
    update_day: "매주 일"
  },
  
  # 코미디 장르
  {
    title: "웃기는 직장생활",
    author: "조코미디",
    genre: "comedy",
    description: "매일 터지는 직장 내 웃지못할 에피소드들을 유쾌하게 그린 직장인 코미디 소설.",
    thumbnail_url: "https://picsum.photos/200/280?random=223",
    rating: 8.5,
    view_count: 1320000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 82,
    update_day: "매주 수, 토"
  },
  
  # 사극 장르
  {
    title: "조선의 암행어사",
    author: "윤사극",
    genre: "historical",
    description: "조선시대 백성을 위해 암행어사가 되어 부패한 관리들을 척결하는 정의로운 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=224",
    rating: 8.9,
    view_count: 1680000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 108,
    update_day: "매주 월, 목"
  },
  {
    title: "궁중의 음모",
    author: "궁중인",
    genre: "historical",
    description: "조선왕조 궁궐 속에서 벌어지는 권력투쟁과 사랑, 배신을 그린 본격 궁중 사극.",
    thumbnail_url: "https://picsum.photos/200/280?random=225",
    rating: 9.0,
    view_count: 2150000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 145,
    update_day: "매주 화, 목, 일"
  },
  
  # SF 장르
  {
    title: "타임머신의 딜레마",
    author: "시에스에프",
    genre: "sf",
    description: "시간여행의 패러독스에 빠진 과학자가 미래를 구하기 위해 과거와 현재를 넘나드는 SF 소설.",
    thumbnail_url: "https://picsum.photos/200/280?random=226",
    rating: 9.2,
    view_count: 1850000,
    status: "ongoing",
    is_new: true,
    category: "novel",
    chapter_count: 71,
    update_day: "매주 금"
  },
  {
    title: "우주의 마지막 희망",
    author: "김우주",
    genre: "sf",
    description: "지구가 멸망한 후 우주를 떠도는 인류의 마지막 함선에서 벌어지는 생존과 희망의 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=227",
    rating: 8.7,
    view_count: 1590000,
    status: "ongoing",
    is_new: false,
    category: "novel",
    chapter_count: 87,
    update_day: "매주 수, 토"
  },
  
  # 베스트리그 카테고리
  {
    title: "전설이 된 소설가",
    author: "문학가",
    genre: "drama",
    description: "무명 작가에서 베스트셀러 작가가 되기까지의 험난한 여정을 그린 성장 드라마.",
    thumbnail_url: "https://picsum.photos/200/280?random=228",
    rating: 9.4,
    view_count: 4200000,
    status: "completed",
    is_new: false,
    category: "best_novel",
    chapter_count: 180,
    update_day: "완결"
  },
  {
    title: "최강의 게임 마스터",
    author: "게임신",
    genre: "fantasy",
    description: "가상현실 게임 속에서 최강의 플레이어가 된 주인공이 현실과 가상을 넘나드는 모험.",
    thumbnail_url: "https://picsum.photos/200/280?random=229",
    rating: 9.6,
    view_count: 5100000,
    status: "ongoing",
    is_new: true,
    category: "best_novel",
    chapter_count: 167,
    update_day: "매주 화, 목, 토"
  },
  
  # 도전소설 카테고리
  {
    title: "신인 작가의 꿈",
    author: "새내기작가",
    genre: "drama",
    description: "웹소설 작가를 꿈꾸는 신인이 첫 작품을 써내려가며 겪는 좌절과 희망의 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=230",
    rating: 7.8,
    view_count: 45000,
    status: "ongoing",
    is_new: true,
    category: "challenge_novel",
    chapter_count: 23,
    update_day: "매주 일"
  },
  {
    title: "평범한 일상의 기적",
    author: "일상작가",
    genre: "drama",
    description: "평범한 사람들의 일상 속에서 찾는 소소한 행복과 감동을 그린 따뜻한 이야기.",
    thumbnail_url: "https://picsum.photos/200/280?random=231",
    rating: 8.1,
    view_count: 28000,
    status: "ongoing",
    is_new: false,
    category: "challenge_novel",
    chapter_count: 31,
    update_day: "매주 토"
  }
]

puts "\n웹소설 데이터를 생성하는 중..."

novels_data.each do |novel_data|
  Novel.create!(novel_data)
  print "."
end

puts "\n✅ #{Novel.count}개의 웹소설이 생성되었습니다!"

# 전체 통계 출력
puts "\n=== 전체 통계 ==="
puts "웹툰: #{Comic.webtoons.count}개"
puts "베스트도전: #{Comic.best_challenges.count}개"
puts "도전만화: #{Comic.challenges.count}개"
puts "웹소설: #{Novel.count}개"
puts "총 에피소드: #{Episode.count}개"

# 요일별 웹툰 통계 출력
puts "\n=== 요일별 웹툰 통계 ==="
%w[월 화 수 목 금 토 일].each do |day|
  count = Comic.where(day_of_week: day).count
  puts "#{day}요일: #{count}개 웹툰"
end

# 웹소설 장르별 통계
puts "\n=== 웹소설 장르별 통계 ==="
Novel.group(:genre).count.each do |genre, count|
  genre_korean = Novel::GENRES[genre] || genre
  puts "#{genre_korean}: #{count}개"
end