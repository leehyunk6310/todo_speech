# 목표 기능
1. 주기적으로 해야 할 일 기록
  - 요일 설정 
  - 시간 설정 (선택)
  - 해당 요일이 되면 notification을 보낸다.
  - 따로 화면을 둔다.
  - 달성, 미달성을 체크할 수 있게함.
  - 달성률 기록
  
2. 한 번만 처리하면 될 일 기록
  - 언제까지 해야 할 지 정한다.
  - 너무 길지않게 처리한다.
  - 달성 날짜와 달력을 연동한다.
  - 음성 인식 기능을 탑재한다.(핵심)
  - 해당 날짜가 다가오면 noti (선택)
 
3. 홈 화면에서는 할 일들을 나열해준다.
  - 추가적인 요소가 필요함
  - 상단의 searchView를 통해 검색 가능.
  - 리스트뷰나 리사이클러뷰로 나열한다.
  - 해당 아이템 클릭시 4로 이동.

4. 해당 todo에 대한 상세 화면으로 이동.
  - 수정, 삭제 가능.
  - 일을 한 것으로 체크하면 완료한 날짜를 기록한다. 해당 날짜는 달력에 표기됨
  - 완료했다면 할일 리스트에서 아래로 이동하고, 가로줄이 그어지거나 오른쪽에 체크 표시로 일이 완료됨을 표시.
  - 팝업으로 설정할지, 따로 화면을 추가할지 결정해야함
 
===========================================
바텀네비게이션을 두고 3개의 탭을 만든다.
홈 / 달력 / 주기적 일
