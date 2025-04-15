# 📌 그룹웨어 기반의 전자결재 및 예약관리 시스템
### Spring Boot 마이그레이션
  [https://github.com/gigachanyeol/gigacha](https://github.com/chan0yeol/gigachaBoot)
### 프로젝트 산출물
  <https://drive.google.com/drive/folders/1k6ZlpR3hWTHIt6pSTNVf7SvRY1wnuoG_>
  
## 📝 프로젝트 개요

사내에서 사용할 수 있는 웹 시스템을 개발하여 구성원들의 결재 업무를 전자화하고, 예약 관리 및 보고서 작성 기능을 통합함으로써 업무 효율성을 향상시킬 수 있는 **확장 가능한 그룹웨어 플랫폼**을 구현하였습니다.

- **주요 목적**: 개인정보를 보호하면서도 간편하게 전자결재를 사용할 수 있는 시스템 제공
- **기술 목표**:
  - Spring Framework 기반 서버로 REST API 구축
  - 클라이언트에서 비동기 처리로 빠른 응답 제공
  - Jenkins + Docker + GitHub 기반의 CI/CD 자동화 파이프라인 구축

---

## 👥 개발 기간 및 인원

| 항목 | 내용 |
| --- | --- |
| 개발 기간 | 2025.02.12 ~ 2025.04.04 (8주) |
| 팀원 수 | 4명 |

### 개발 일정

| 기간 | 작업 내용 |
| ---- | ---------- |
| 2.12 ~ 2.26 | 개발 준비 (요구사항 분석 / 설계) |
| 2.26 ~ 3.02 | 모듈화 및 헤더/사이드바 UI 작업 |
| 3.03 ~ 3.24 | 기능 및 서비스 구현, UI/UX 개발 |
| 3.24 ~ 3.29 | 단위 테스트 |
| 3.30 ~ 4.03 | 통합 테스트 및 최종 배포 |

---

## ⚙ 개발 환경

| 항목 | 내용 |
| ---- | ---- |
| Language | Java, HTML, JavaScript, CSS |
| Framework | Spring Framework 5.x |
| ORM | MyBatis 3.x |
| Build | Maven |
| Test | JUnit4 |
| Database | Oracle 19c/21c ATP |
| WAS | Tomcat 9.x |
| 형상관리 | GitHub |
| CI/CD | Git Webhook + Jenkins + Docker |
| OS | Windows 11, Ubuntu 22.04 |
| Tools | Eclipse, VSCode, DBeaver, ERDCloud, Postman |

---

## 🧱 시스템 아키텍처

![Image](https://github.com/user-attachments/assets/9f94cba4-89b0-40d0-ac77-4d71c33138f5)

- Spring MVC 구조 기반: `Interceptor`, `DispatcherServlet`, `@Service`, `@Repository` 활용
- JSP + REST API 기반 클라이언트 구성
- WebSocket으로 실시간 알림 처리
- Oracle Cloud ATP DB + MyBatis 연동
- GitHub → Jenkins → Docker 자동 배포 파이프라인

---

## 📚 주요 라이브러리 및 API

- Spring WebSocket, AJAX, Handlebars.js, CKEditor, FullCalendar
- jsPDF, html2canvas, DataTables, Chart.js, SheetJS
- SignaturePad, DatePicker, SweetAlert2, jQuery, Bootstrap 5
- Gson, Lombok, Commons IO, JSTL

---

## 🗂 논리 ERD (전자결재 시스템)

Oracle ATP 기반의 테이블 구성 ()

![Image](https://github.com/user-attachments/assets/eea0fff1-ce9c-49d1-b79f-e772f4b5018e)

---
## 🗂 물리 ERD (전자결재 시스템)

물리 ERD는 담당 ERD만 첨부하였습니다.

![Image](https://github.com/user-attachments/assets/8669fb63-a9bb-4398-9351-adcb9e391fdc)

---

## 🧑‍💻 프로젝트 담당 역할

### 📌 데이터베이스 설계 및 작성

- Oracle Cloud ATP에서 DB 스키마 설계 및 쿼리 최적화
- ERD 기반 공용 테이블 작성 및 관계 설정

### 📌 CI/CD 구축 및 배포

- 스마트폰 리눅스 환경에 Jenkins 설치
- GitHub Webhook + Maven 빌드 + Docker 이미지 생성
- Oracle Cloud 인스턴스에 자동 배포

### 📌 CI/CD 아키텍처

![Image](https://github.com/user-attachments/assets/3370f976-6ff1-4825-a6ac-594624449628)

1. GitHub Commit & Push
2. Jenkins Webhook 트리거
3. Maven 빌드 → Docker 이미지 생성
4. DockerHub Push → 서버 Pull & 컨테이너 재기동

---

## ✅ 담당 구현 기능 상세

### ✅ 공통 모듈화
- CKEditor, jsTree, DataTables 등의 라이브러리 공통 관리
- Header, Sidebar 레이아웃 설계

### ✅ 전자결재 시스템
- 에디터 기반 문서 작성 / 수정
- 결재선 자동완성 (autoComplete + jsTree)
- Fetch API + REST 기반 승인/반려 처리
- WebSocket으로 승인/반려 알림 실시간 전송
- myBatis 동적 SQL 활용
- 로그인 필터 및 권한 인터셉터 구현
- Spring Security 적용
  
---

## 📝 에디터 기반 문서양식 작성 및 사용

### 개요
  전자결재 양식을 관리자가 등록하고, 사용자는 양식을 선택하여 빠르게 기안할 수 있도록 구조를 설계하였습니다.
  결재선은 조직도 Tree UI와 자동완성 기능을 통해 직관적으로 구성하여,
  최종 결재 문서는 PDF로 변환/다운로드 가능하여 출력 기반 업무까지 연계될 수 있도록 구현하였습니다.


![Image](https://github.com/user-attachments/assets/713d34ca-699d-462d-b38d-cbbb8bd1255c) ![Image](https://github.com/user-attachments/assets/117b4171-2416-4ae9-bb5c-5e7018080a66)

### 
전자결재 문서를 상신할 때 결재자를 직접 지정할 수 있도록 다음과 같은 기능을 구현하였습니다.  조직도 데이터는 JSON 형태로 비동기 로딩됩니다.

![Image](https://github.com/user-attachments/assets/e01a48e0-0891-4035-8592-13807853bbc2)

###
문서상세에서 프린트 버튼 클릭시 PDF로 해당 결재문서를 다운로드할 수 있도록 구현하였습니다.
![Image](https://github.com/user-attachments/assets/b56882ce-9d74-42c9-aace-59fc198b9335)

---

## 🔄 결재 승인/반려 비동기 처리

- Fetch Ajax를 통한 승인/반려 처리
- 중복 로직을 fetchJsonPost 함수로 모듈화

![image](https://github.com/user-attachments/assets/923ac6e9-51af-48de-8764-52d6cde3d597)

```js
async function fetchJsonPost(url, jsonData) {
  const response = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(jsonData)
  });
  if (!response.ok) throw new Error("서버오류");
  return await response.json();
}
```

---

## HandlerBars.js를 활용한 템플릿 엔진 구현

기존 전자결재 문서 상세 페이지는 jQuery로 DOM을 직접 조작하는 구조였으나, HTML 구조와 로직이 뒤섞여 유지보수에 어려움이 있었습니다.
이를 개선하기 위해 Handlebars.js를 도입하여 템플릿 기반의 렌더링 구조로 리팩토링하였습니다.

![Image](https://github.com/user-attachments/assets/ac9a7897-15ee-458f-b2b1-f366c6151adf)

---

## 🔔 WebSocket 실시간 알림
### 개요
현재 시스템은 전자결재의 승인/반려 및 긴급결재 발생 시 실시간으로 사용자에게 알림을 전달하기 위해 WebSocket 기반으로 실시간 알림 기능을 구현하였습니다.
또한, 알림 구조를 채팅 서비스로 확장 가능하도록 설계하여 실시간 메시지 서비스로의 전환에도 대응 가능하도록 설계하였습니다. 

**기능 흐름**

1. 클라이언트에서 문서 승인/반려 등 이벤트 발생
2. 서버 처리 → `HttpSession ↔ WebSocketSession` 매핑
3. 알림 대상 사용자에게 메시지 전송
4. 클라이언트 토스트 팝업으로 실시간 반영

![Image](https://github.com/user-attachments/assets/a4c80afe-1b79-448a-a93a-66b371611163)

**WebSocket 설정 XML**

```xml
<websocket:handlers>
  <websocket:mapping path="/ws/notification.do" handler="websocketHandler" />
  <websocket:handshake-interceptors>
    <bean class="HttpSessionHandshakeInterceptor"/>
  </websocket:handshake-interceptors>
</websocket:handlers>
```

**JSON 타입으로 전송하여 추후 채팅 서비스로의 확장**
현재 알림은 type을 notification으로 설정하여 전송하고 있습니다. 
추후 추가적인 실시간 서비스로 확장할 땐 type만 수정하여 확장이 가능한 설계를 진행했습니다.

![image](https://github.com/user-attachments/assets/91ccf070-47d7-4902-bdd2-496e2378f007)

---

## 🔐 Spring Security 적용

![image](https://github.com/user-attachments/assets/ff9f703b-6a85-49c6-9ce8-9892555a2431)

### ✅ 도입 배경

기존 Spring MVC에서는 `WebFilter`로 로그인 처리, `Interceptor`로 권한을 관리했으나  
로직 분산으로 보안 설정이 복잡하고 유지보수가 어려웠습니다.

이를 해결하기 위해 Spring Boot 마이그레이션 시 **Spring Security**를 도입하여  
인증/인가 처리를 통합하였습니다.

### ✅ Security 설정 예시

![image](https://github.com/user-attachments/assets/c4311500-76e2-4d9f-9da7-266827522c1f)

---

## ⚙ 마이그레이션 요약

Spring 5.x 기반 프로젝트를 Spring Boot 3.x로 마이그레이션하면서 다음과 같은 개선사항을 적용하였습니다.

항목	변경 사항
패키지 구조 변경	javax → jakarta
JSP 처리	외장 Tomcat → 내장 Tomcat (Jasper 의존성 추가)
설정 방식	XML → application.properties
Bean 등록 방식	XML → Java Config (@Bean, @Configuration)
보안 처리	Filter → Spring Security로 통합
DAO 구조 개선	Dao → DaoImpl → Service → Mapper → Service 간소화
예외 처리 방식	web.xml → @ControllerAdvice
커넥션 풀 변경	BasicDataSource → HikariCP

---

## 🧪 테스트 전략

개요
  다음과 같은 3단계 테스트 전략을 통해 프로젝트의 안정성과 신뢰성을 확보하였습니다.
  1. 쿼리테스트 (SQL 단위 검증)
     ✔ 가장 기초적인 단계로, DB 연결 및 쿼리 정확성을 확인합니다.

  테스트 문서 : https://docs.google.com/spreadsheets/d/13WGaxOJVDdM3YQjfI_qG-v8030xWArVYhmzDWTGYeq4/edit?gid=447662315#gid=447662315
  
  3. 단위테스트
     ✔ 총 47개의 단위 테스트를 통해 주요 기능에 대한 로직 검증을 완료하였습니다.
  
  4. Controller 테스트
     ✔ API 테스트는 Postman으로 요청을 검증하여 프론트/백 간 연동을 점검하였습니다.
 
  이를 통해 기능 개발 단계에서 발생할 수 있는 오류를 초기에 발견하고 수정할 수 있었습니다.

**JUnit 기반 DAO/Service 단위 테스트**
  
Junit을 통한 단위테스트 총 47개의 테스트 케이스(, 문서양식 7건, 카테고리 6건)
    
결재문서 17건

  ![결재문서 테스트케이스 17건](https://github.com/user-attachments/assets/13aaa036-1e53-4375-9bc2-71590f7e7f46)
  
결재선 7건
  
  ![결재선 테스트 7건](https://github.com/user-attachments/assets/0eaea364-71c7-4cbe-9b41-077fe36fc357)
  
문서양식 7건
  
  ![문서양식 테스트 7건](https://github.com/user-attachments/assets/391ad5a7-f0db-4e11-8b25-4edf28f37491)
    
카테고리 6건
  
  ![카테고리 테스트 6건](https://github.com/user-attachments/assets/a55eb661-6436-4c96-ad47-207c226c07a8)
    
  
  **Controller 테스트**
  
  ![image](https://github.com/user-attachments/assets/1ca5f724-6c1a-4f59-bb3f-98197f46ce0b)





