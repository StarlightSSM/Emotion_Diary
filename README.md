# Emotion_Diary
2학년 2학기 SW 프로젝트

컴퓨터학과 2학년 2학기 SW 프로젝트 => 감정일기 프로젝트

개발 환경
웹 / 프론트엔드 : HTML, CSS, Javascript
서버 : JSP
데이터베이스(DB) : MySQL
<img src="프로젝트툴.png"/>
<img src="프로젝트툴2.png"/>

프로젝트 소개
바쁘디바쁜 현대 사회에서 핸드폰으로 간단하게 적을 수 있게 하고,
일기를 적으면 적을수록 화면의 꽃이나 별, 달, 식물이 성장하듯 하루를 적어내므로 뿌듯함을 주고,
자신의 감정을 솔직하게 표현을 할 수 있는 공간을 만들어 보고자 감정 일기장 앱을 만들기로 생각하였습니다.

=> 프로젝트 결과물

8-1 home 페이지(login 전)
![home](https://user-images.githubusercontent.com/87637645/224488604-6a6f9b28-60ae-4844-98ab-60446c5f1ff0.PNG)

- 현재 페이지에는 불러온 회원정보가 없기 때문에, 이 페이지의 모든 항목들은 기본값으로 설정됨
 가장 좋았던 날, 가장 싫었던 날 부분에는 조회된 일기 데이터가 없으므로, 빈 공간으로 설정됨
 식물 이미지의 경우, 기본값의 이미지로 설정됨.
 - 이 페이지의 왼쪽 프로필 영역도 기본값으로 설정된 이미지, 이름, 자기소개 내용들로 보여짐
 사용자가 로그인 하지 않았으므로 헤더 부분에는 로그인과 회원가입만 보여주도록 함.



8-2  로그인 페이지 
![로그인](https://user-images.githubusercontent.com/87637645/224488623-47e8bb04-0ccc-4c84-bb6e-866ff0d0baef.PNG)

 - 로그인 페이지에는 아이디, 비밀번호 입력란이 구현되어 있음.
   모든 필드에 입력 후, 로그인하기 버튼을 누르면, 홈페이지로 이동함.



8-3 회원가입 페이지
![회원가입](https://user-images.githubusercontent.com/87637645/224488637-6242d51b-d72c-49cf-a203-b142e16aa95d.PNG)

- 회원가입 페이지에는 아이디, 비밀번호, 비밀번호 재확인, 이름, 전화번호 입력란이 구현되어 있다.
-  모든 필드에 입력 후, 가입하기 버튼을 누르면, 회원가입에 성공했다는 확인창과 함께, 홈페이지로 
   이동한다.
 - 구글 API 및 네이버 API는 시간상으로 부족하여 구현하지 못했다.



8-4 Home 페이지 (login 후)
![home4](https://user-images.githubusercontent.com/87637645/224488659-cd18a2bb-06e0-4570-98a6-6187fd137c0e.PNG)
![home2](https://user-images.githubusercontent.com/87637645/224488667-08730d0f-a4ac-41d3-91c5-694d500fc027.PNG)
![home3](https://user-images.githubusercontent.com/87637645/224488670-1c46dd0e-5a5d-437d-a87b-ea9832a257fb.PNG)

- 현재 페이지에는 로그인 페이지를 통해 불러온 회원정보를 바탕으로, 이 페이지의 모든 항목들에  
  로그인한 회원의 이메일을 기준으로 관련 데이터들을 가져온다.
 - 가장 좋았던 날, 가장 싫었던 날 부분의 경우, 변경 버튼을 통해 일기 목록 페이지로 이동하여, 
   회원이 작성한 일기 중 하나를 선택할 수 있도록 하였다. (사실상 시간이 부족하여 구현을 못함)
- 식물 이미지의 경우, 프로필 페이지에서 따로 이미지를 등록하지 않았다면 기본값으로 설정됨. 
   만약 이미지를 등록하였다면, 등록된 이미지를 불러옴
 - 이 페이지의 왼쪽 프로필 영역에는 회원의 프로필 이미지, 이름, 자기소개 내용들로 보여준다.
 - 현재 페이지는 사용자가 로그인 한 후의 화면으로, 헤더 부분에는 로그아웃과 개인정보수정만 보여주도록     하였다



8-5 프로필 페이지
![프로필페이지](https://user-images.githubusercontent.com/87637645/224488700-03ddce4a-a9ae-4029-a1b1-56e5bdafb696.png)
![프로필1](https://user-images.githubusercontent.com/87637645/224488939-cd31b405-20cb-48f2-9937-0d9912b4b032.PNG)

 - 프로필 페이지에는 이메일은 primary key로 저장되어있어 바꿀 수 없게 함.
   파일 선택과 소개글을 변경하면 왼쪽 사진처럼 프로필이 뜨고 소개글도 볼 수있게 하였음.
  - 이미지,이름, 전화번호, 소개글을 수정하고 정보를 저장할 수 있으며
    정보를 저장할 수 있게 구현함.
    
    
    
8-6 개인정보수정 페이지
![개인정보수정페이지](https://user-images.githubusercontent.com/87637645/224488712-661dae68-ee97-43cb-aef5-9df6fb2f0aa4.PNG)

- 개인수정 페이지는 현재 비밀번호를 새 비밀번호로 변경할 수 있으며, 생년월일, 이름도 언제든지 수정이     가능하게 구현하였다.
- 탈퇴하기를 누르면 바로 탈퇴할 수 있게 구현하였음.


8-7 일기작성 페이지
![일기작성1](https://user-images.githubusercontent.com/87637645/224488727-2bb54c6a-aab5-4dac-8128-938a2c2cc675.png)

- 일기 작성페이지에서는 DB부분에 날짜와 감정선택, 제목, 이미지와 일기내용을 저장하게 됀다. 만약 일기  를 쓰는 도중 처음 부터 작성을 하기를 원한다면 초기화 부분을 눌러 모든 칸의 값을 NULL로 만들어 빈칸의 일기로 돌아오게 해 일기를 다시 쓸 수 있게 해준다.



8-8 식물기록 페이지
![식물기록페이지](https://user-images.githubusercontent.com/87637645/224488759-bb406773-2a8c-4260-a841-c2eae970ac03.png)

- 식물기록 페이지는 HTML로 형식을 작성했지만, DB를 연결하는 부분에 어려움을 느껴 폐지를 
  하게 되었다.


8-9 일기목록 페이지
![contents1](https://user-images.githubusercontent.com/87637645/224488807-84601d2d-24d2-4637-87ce-dabfb9abdd59.PNG)
![contents4](https://user-images.githubusercontent.com/87637645/224488814-5f7ff91b-b3cc-4977-9a3c-55420adcf3ac.PNG)
![contents2](https://user-images.githubusercontent.com/87637645/224488818-65511a92-ad4b-4e7b-9641-25e45a0f0b21.PNG)
![contents3](https://user-images.githubusercontent.com/87637645/224488823-b65b9300-c94c-48ec-92d9-92efbf9746e9.PNG)

 - 일기 목록 페이지는 일기 작성 페이지에서 저장한 일기가 목록에 띄워지게 되고 일기를 작성한 후 
   목록페이지에 가면 작성한 이와 작성한 이의 글 제목만 뜨게 된다.
 - 만약 자신의 아이디가 아닌 다른 사람의 일기를 클릭하면 ‘해당 권한이 없습니다’라는 알림창을 띄우며  
   읽을 수 없게 하고, 자신의 일기를 클릭하면 위에 사진과 같이 일기 내용을 불러올 수 있게 설정하였다.



*부록 - 사용자 설명서
1. 일기 홈 페이지(로그인 전)
- 처음 접속할 때의 첫 페이지입니다.
- 회원가입이나 로그인을 통해 일기 서비스를 이용할 수 있습니다.
- 로그인을 하기 전 다른페이지로 이동이 불가능합니다.

2. 회원가입 페이지
- 일기 홈 페이지에서 오른쪽 상단의 헤더 부분에서 클릭해서 이동합니다.
- 감정 일기 서비스를 사용하는데, 회원이 아니라면 회원가입을 반드시 거쳐야 합니다.

3. 로그인 페이지
- 회원가입을 하셨거나, 기존 회원이시라면, 본격적인 감정 일기 서비스 사용을 위해
로그인을 하셔야 합니다.
- 이메일, 비밀번호를 입력합니다.

4. 일기 홈 페이지(로그인 후)
- 왼쪽 프로필 영역에는 프로필 사진, 닉네임, 자기소개 내용을 보여줍니다.
- 왼쪽 프로필 영역 밑에 개인정보 수정페이지와 프로필 페이지로 이동할 수 있는 옵션이 있습니다.
- 프로필 페이지에 이동하셔서 내용을 넣으시고, 사진 업로드를 하셨다면 수정된 내용으로 보여집니다.
- 오른쪽 일기 영역에는 자신이 선택한 가장 좋았던 날, 가장 싫었던 날의 일기를 간략하게 보여주는 부분을 보여줍니다.
- 바로 오른쪽에는 자신이 작성한 일기의 개수에 따라 식물 이미지를 보여줍니다.
0개면 식물 1단계(씨앗), 1~3개면 식물 2단계(새싹 및 중간), 4개 이상이면 식물 3단계(식물 완성형, 예: 해바라기)로, 식물 성장 단계를 총 3단계로 기준을 설정했습니다.

5. 프로필 페이지
- 프로필 사진, 닉네임, 이메일, 전화번호, 자기소개를 보여줍니다.

6. 개인정보 수정 페이지
- 비밀번호, 생년월일, 이름을 수정할 수 있습니다.
- 필요시 저장 버튼 아래에 있는 탈퇴하기 버튼을 통해 회원 탈퇴도 가능합니다.

7. 일기 작성 페이지
- 자신이 오늘 있었던 일에 대하여 일기를 작성할 수 있습니다.
- 날짜, 오늘의 감정을 선택할 수 있고, 이미지도 첨부할 수 있으며, 일기 제목, 내용도 입력이 가능합니다.
- 입력하신 내용이 마음에 안든다면, 초기화 버튼을 통해 내용을 모두 초기화할 수 있습니다.

8. 일기 목록 페이지
- 자신 뿐만 아니라 다른 사용자들이 작성한 일기들을 보여줍니다.
- 다만, 사용자들 간의 사생활 보호를 위해 작성자와 제목만 보여줍니다.
또, 자신이 아닌 다른 사용자의 일기로 이동할 수 없게 하였습니다.
       


*부록 - 만약 시간이 더 있었다면 더 했으면 좋았을 점들

- Home페이지 (로그인후) 이 달의 가장 좋았던/ 가장 싫었던 일기를 골라 불러 가져올 수 있게     하는 기능 작성

- 식물기록페이지를 작성하여 자신의 식물 성장을 확인할 수 있게 하기

- 일기목록을 자신의 일기만 불러오게 하기

- 로그인 및 회원가입에서 구글 API, 네이버 API 구현하기

- 캘린더 구현하기
