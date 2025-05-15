# 🛍️ 상품 판매 플랫폼

**Spring Boot 기반의 온라인 상품 판매 플랫폼입니다.**

## 🚀 주요 기능

본 플랫폼은 사용자들에게 편리하고 즐거운 쇼핑 경험을 제공하며, 판매자들에게는 효율적인 상품 관리 및 판매 환경을 지원합니다. 주요 기능은 다음과 같습니다.

### 사용자 기능

  * **🔍 상품 검색:** 키워드를 통해 원하는 상품을 쉽고 빠르게 검색할 수 있습니다.
  * **👤 로그인 및 회원 정보:** 안전한 사용자 인증 및 개인 정보 관리 기능을 제공합니다.
  * **🛒 장바구니:** 관심 있는 상품을 담아두고 한 번에 결제할 수 있습니다.
  * **💳 결제:** 카카오페이를 통한 간편하고 안전한 결제 시스템을 지원합니다.
  * **⭐ 리뷰:** 상품에 대한 사용자들의 솔직한 후기를 확인하고, 직접 작성할 수 있습니다.
  * **🏷️ 카테고리:** 다양한 카테고리별 상품 목록을 탐색하고 검색, 정렬 기능을 활용할 수 있습니다.
  * **📄 페이징:** 많은 상품 목록을 효율적으로 관리하고 탐색할 수 있도록 페이지네이션을 제공합니다.

### 판매자 기능

  * **🏪 점포 등록 및 수정:** 판매자 자신의 온라인 상점을 개설하고 정보를 관리할 수 있습니다.
  * **📝 상품 리스트 관리:** 등록된 상품 목록을 확인하고 수정, 삭제할 수 있습니다.
  * **📜 메뉴 리스트 관리:** 상점의 메뉴를 구성하고 관리할 수 있습니다.

### 소셜 기능

  * **🧑‍🤝‍🧑 친구 추가 및 삭제:** 사용자 간의 친구 관계를 맺고 관리할 수 있습니다.
  * **💬 친구 채팅:** 친구들과 실시간으로 소통할 수 있는 채팅 기능을 제공합니다.
  * **🎁 친구 추천 상품:** 친구가 구매한 상품을 기반으로 맞춤형 상품을 추천받을 수 있습니다.

### 이벤트 기능

  * 다양한 형태의 상품 할인 및 프로모션 이벤트를 제공합니다.

## 🛠️ 기술 스택

본 프로젝트는 다음과 같은 기술 스택을 사용하여 개발되었습니다.

  * **Backend:** Spring Boot
  * **Database:** MySQL
  * **ORM:** MyBatis
  * **Version Control:** Git, Sourcetree
  * **Build Tool:** Maven (명시되지 않았지만 Spring Boot 기반이므로 예상)
  * **Web Server:** Tomcat
  * **Communication:** Slack, Jira

## ⚙️ 개발 환경 설정

1.  **Java Development Kit (JDK) 설치:** Java 8 이상 설치를 권장합니다.
2.  **MySQL 설치 및 설정:** 데이터베이스 서버를 설치하고 필요한 스키마를 생성합니다.
3.  **Maven 설치:** 의존성 관리 및 빌드 도구인 Maven을 설치합니다.
4.  **Git 및 Sourcetree 설치:** 소스 코드 버전 관리를 위해 Git과 Sourcetree를 설치합니다.
5.  **IDE (Integrated Development Environment) 설정:** IntelliJ IDEA 또는 Eclipse 등의 개발 도구를 설정합니다.
6.  **프로젝트 Clone:** GitHub 저장소에서 프로젝트를 Clone합니다.
    ```bash
    git clone [GitHub Repository URL]
    ```
7.  **Application 설정:** `src/main/resources/application.properties` 또는 `application.yml` 파일을 수정하여 데이터베이스 연결 정보, 카카오페이 API 키 등 필요한 설정을 입력합니다.
8.  **의존성 설치:** Maven을 통해 프로젝트의 의존성을 다운로드합니다.
    ```bash
    mvn clean install
    ```
9.  **실행:** Spring Boot 애플리케이션을 실행합니다.
    ```bash
    mvn spring-boot:run
    ```
    또는 IDE에서 직접 실행할 수 있습니다.

## 🔗 관련 링크

 * **GitHub Repository:** [-GitHub Repository URL](https://github.com/yuriuser126/ShoFriend_project3.git) 
  * **API 문서:** [카카오페이 API URL](https://developers.kakaopay.com/)
  * **Jira 프로젝트:** [[Jira 프로젝트 URL](https://khproject3.atlassian.net/)]
  * **Slack 채널:** [[Slack 채널 URL](https://khproject3hq.slack.com/)] 

  * **Slack 채널:** [ <a href="https://khproject3hq.slack.com/archives/C08R5NN55JR"> Slack 채널 URL </a>] (6/4일까지 열람가능)

## 🤝 기여 방법

프로젝트에 기여하고 싶으신 분들은 다음 절차를 따라주세요.

1.  **Fork:** 프로젝트를 자신의 GitHub 계정으로 Fork합니다.
2.  **Branch 생성:** 새로운 기능 추가 또는 버그 수정을 위한 브랜치를 생성합니다.
    ```bash
    git checkout -b feature/your-feature-name
    ```
3.  **Commit:** 변경 사항을 Commit합니다.
    ```bash
    git commit -m "feat: Add new feature"
    ```
4.  **Push:** 변경 사항을 자신의 Forked Repository로 Push합니다.
    ```bash
    git push origin feature/your-feature-name
    ```
5.  **Pull Request:** GitHub에서 원본 Repository로 Pull Request를 생성합니다.

## 📜 라이선스

[라이선스 정보] (추후 업데이트 예정)


# ShoFriend_project3

전 프론트단 완성

------------------------------
메인페이지


마이페이지


장바구니
