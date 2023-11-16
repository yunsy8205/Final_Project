<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %> <%@ taglib prefix="spring"
uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <style>
      .container-p-y {
        padding-bottom: 0 !important;
        padding-top: 1rem !important;
      }

      #off {
        display: none;
        margin: 0 auto;
      }
      .row {
        height: 450px;
      }
      #notice {
        display: flex;
      }
      #plus {
        flex: 0 0 auto;
        width: 3%;
        font-size: 25px;
      }
      #ntitle {
        flex: 0 0 auto;
        width: 94%;
        margin: auto;
      }
      #hr1 {
        background-color: #696cff;
      }
      .b1 {
        height: 55%;
        text-align: center;
      }
      .b2 {
        height: 15%;
        text-align: center;
        margin-top: 3px;
        padding-top: 5px;
      }
      .b3 {
        height: 15%;
        text-align: center;
        margin-top: 3px;
        padding-top: 5px;
      }
      .b4 {
        height: 12%;
        text-align: center;
        margin-top: 3px;
        padding-top: 5px;
      }
      .tTitle {
        width: 40%;
      }
      .tTime {
        width: 40%;
        font-size: 16px;
      }
      .a1 {
        color: #697a8d;
      }
      #fc-dom-1 {
        font-size: 17px;
      }
      .chartBox {
        width: 100%;
        height: 100%;
      }
      .chart1 {
        width: 100%;
        height: 90%;
      }
      .timeBox {
        display: flex;
        margin-left: 17%;
      }
      .card-body {
        height: 434px;
      }
      .user {
        font-size: 17px;
        font-weight: bold;
      }
      #userProfile {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      #proBox {
        width: 8rem;
        height: 8rem;
        border-radius: 50%;
        overflow: hidden;
        margin: auto;
      }
      .fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events {
        min-height: 1rem;
      }
    </style>
    <!-- moment lib -->
    <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js"></script>
    <!-- fullcalendar bundle -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.9/index.global.min.js"></script>
    <!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/moment@6.1.9/index.global.min.js"></script>
    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
  </head>
  <script type="text/javascript">
    //full calendar
    document.addEventListener("DOMContentLoaded", function () {
      const calendarEl = document.getElementById("calendar");

      const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: "dayGridMonth",
        headerToolbar: {
          left: "",
          center: "title",
          right: "",
        },
        titleFormat: "YYYY년 M월",
        //height: "100%",
        // contentHeight: 350,
        contentHeight: function () {
          if (screen.width < 800) {
            return 350;
          } else {
            return 850;
          }
        },
        contentHeight: 300,
        fixedWeekCount: false,
        expandRows: true, // 화면에 맞게 높이 재설정
        events: "/attendance/month",
      });
      //캘린더 그리기
      calendar.render();
    });
  </script>
  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <!-- sidebar -->
        <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
        <!-- /sidebar -->
        <!-- Layout container -->
        <div class="layout-page" style="padding-left: 23rem">
          <!-- Navbar -->

          <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

          <!-- Content wrapper -->
          <div class="content-wrapper" style="height: 50rem">
            <!-- Content -->

            <div
              class="container-xxl flex-grow-1 container-p-y"
              style="padding: 1rem 0 0 0 !important; height: 100%"
            >
              <div
                class="row mb-3 r1"
                style="
                  display: flex;
                  justify-content: space-between;
                  height: 45%;
                "
              >
                <div class="card h-100" style="width: 20%">
                  <div class="card-body box1" style="height: 100%">
                    <div class="b1">
                      <!-- 이미지 이름 직책 -->
                      <sec:authentication property="principal" var="user" />
                      <div id="proBox">
                        <img
                          id="userProfile"
                          alt=""
                          src="../file/employee/${user.proFile}"
                        />
                      </div>
                      <div
                        class="user mt-2"
                        id="user"
                        data-num="${user.employeeNum}"
                        style="font-weight: 500"
                      >
                        ${user.name}
                      </div>
                      <div
                        class="user"
                        id="position"
                        data-position="${user.position}"
                      >
                        <span id="pInner" style="font-size: 0.9rem"></span>
                      </div>
                    </div>
                    <div class="b2">
                      <!-- 출근시간 퇴근시간 -->
                      <div class="timeBox">
                        <div class="tTitle">출근시간</div>
                        <div class="tTime" id="onTime">-</div>
                      </div>
                      <div class="timeBox">
                        <div class="tTitle">퇴근시간</div>
                        <div class="tTime" id="offTime">-</div>
                      </div>
                    </div>
                    <div class="b3">
                      <!-- 디지털 시계 -->
                      <div class="clock">
                        <h1 id="time" class="time"></h1>
                      </div>
                    </div>
                    <div id="btn_block" class="b4">
                      <button type="button" id="on" class="btn btn-primary">
                        출근하기
                      </button>
                      <button type="button" id="off" class="btn btn-primary">
                        퇴근하기
                      </button>
                    </div>
                  </div>
                </div>
                <div class="card h-100" style="width: 50%">
                  <div class="card-body">
                    <div id="notice">
                      <h5 id="ntitle" class="card-title">최근 공지</h5>
                      <a id="plus" href="/notice/list">+</a>
                    </div>
                    <hr id="hr1" />
                    <div class="table-responsive text-nowrap">
                      <table class="table table-hover">
                        <tbody class="table-border-bottom-0">
                          <c:forEach items="${list}" var="n">
                            <tr>
                              <td>
                                <span class="badge bg-label-primary me-1"
                                  >${n.category}</span
                                >
                                <a
                                  class="a1"
                                  href="./notice/detail?noticeNum=${n.noticeNum}"
                                  >${n.title}</a
                                >
                              </td>
                              <td>${n.name}</td>
                              <td>${n.modDate}</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="card h-100" style="width: 28%">
                  <div class="card-body calendarBox">
                    <div id="calendar"></div>
                  </div>
                </div>
              </div>
              <div
                class="row mb-5 r2"
                style="
                  display: flex;
                  justify-content: space-between;
                  height: 50%;
                  margin-bottom: 0 !important;
                "
              >
                <div class="card h-100" style="width: 49%">
                  <div class="card-body chartBox">
                    <div style="width: 100%; height: 10%">
                      <h5>총 회원 현황</h5>
                    </div>
                    <div class="chart1">
                      <canvas
                        id="myChart"
                        width="666"
                        height="330"
                        style="padding-bottom: 1rem"
                      ></canvas>
                    </div>
                    <div>
                      <c:forEach items="${chart}" var="c">
                        <div id="${c.monthNum}" data-member="${c.total}"></div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
                <div class="card h-100" style="width: 49%">
                  <div class="card-body">
                    <div id="notice">
                      <h5 id="ntitle" class="card-title">기안결재관리</h5>
                      <a id="plus" href="./approval/list">+</a>
                    </div>
                    <hr id="hr1" />
                    <div class="table-responsive text-nowrap">
                      <table class="table table-hover">
                        <tbody class="table-border-bottom-0">
                          <c:forEach items="${app}" var="a">
                            <tr>
                              <td>
                                <span class="badge bg-label-primary me-1"
                                  >${a.category}</span
                                >
                                <a
                                  class="a1"
                                  href="./approval/detail?approvalNum=${a.approvalNum}"
                                  >${a.title}</a
                                >
                              </td>
                              <td>${a.state}</td>
                              <td>${a.regDate}</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->

            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
    <script src="/js/attendance/work.js"></script>
    <script src="/js/home.js"></script>
    <script>
      // 요소 선택
      const timeDiv = document.getElementById("time");

      // getTime 함수
      function getTime() {
        let now = new Date();
        //let year = now.getFullYear();
        //let month = now.getMonth() + 1; //getMonth는 0부터 시작하기 때문
        //let date = now.getDate();
        let hour = now.getHours();
        let minute = now.getMinutes();
        let second = now.getSeconds();

        hour = hour < 10 ? "0" + hour : hour;
        minute = minute < 10 ? "0" + minute : minute;
        second = second < 10 ? "0" + second : second;
        // 위의 각 변수에는 시간 데이터가 숫자로 대입되어 있으나 두 자리 또는 한 자리수로 있어
        // 자릿수를 맞추기 위해 삼항연산식을 사용해 10보다 작은 경우 숫자의 앞에 0을 붙여 두 자릿수를 맞춘다.

        timeDiv.innerText = hour + ":" + minute + ":" + second;
      }

      // setInterval 메소드
      getTime();
      setInterval(getTime, 1000);

      let employeeNum = $("#user").attr("data-num");
      let workDate = getTodayDate();

      attendanceTime(employeeNum, workDate);
      function attendanceTime(employeeNum, workDate) {
        $.ajax({
          type: "get",
          url: "./attendanceTime",
          data: {
            employeeNum: employeeNum,
            workDate: workDate,
          },
          success: function (response) {
            if (response.time != null) {
              if (response.time.offTime != null) {
                $("#offTime").text(response.time.offTime);
              }
              if (response.time.onTime != null) {
                $("#onTime").text(response.time.onTime);
              }
            }
          },
          error: function () {
            console.log("ajax 실패");
          },
        });
      }

      function getTodayDate() {
        let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)

        attendanceTime(employeeNum, workDate);
        function attendanceTime(employeeNum, workDate) {
          $.ajax({
            type: "get",
            url: "./attendanceTime",
            data: {
              employeeNum: employeeNum,
              workDate: workDate,
            },
            success: function (response) {
              if (response.time != null) {
                if (response.time.offTime != null) {
                  $("#offTime").text(response.time.offTime);
                }
                if (response.time.onTime != null) {
                  $("#onTime").text(response.time.onTime);
                }
              }
            },
            error: function () {
              console.log("ajax 실패");
            },
          });
        }
      }
      function getTodayDate() {
        let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)

        let year = today.getFullYear();
        let month = ("0" + (today.getMonth() + 1)).slice(-2);
        let day = ("0" + today.getDate()).slice(-2);

        let dateString = year + "-" + month + "-" + day;

        console.log(dateString);

        return dateString;
      }

      // // 직급 한글 변환
      // const position = document.getElementById("position").value;
      // const pInner = document.getElementsByClassName("position_inner");

      // for(let i=0;i<pInner.length;i++){
      //     if(position == 'ROLE_CEO'){
      //         pInner[i].innerHTML = '대표';
      //     }else if(position == 'ROLE_GENERAL'){
      //         pInner[i].innerHTML = '총괄 매니저'
      //     }else if(position == 'ROLE_CUSTOMER'){
      //         pInner[i].innerHTML = '고객관리 매니저'
      //     }else if(position == 'ROLE_RESOURCES'){
      //         pInner[i].innerHTML = '인사 매니저'
      //     }else if(position == 'ROLE_FACILITY'){
      //         pInner[i].innerHTML = '시설 매니저'
      //     }else if(position == 'ROLE_TRAINER'){
      //         pInner[i].innerHTML = '트레이너 매니저'
      //     }else{
      //         pInner[i].innerHTML = '가발령 매니저'
      //     }
      // }

      // 차트
      let jan = Number($("#01").attr("data-member"));
      let feb = Number($("#02").attr("data-member")) + jan;
      let mar = Number($("#03").attr("data-member")) + feb;
      let apr = Number($("#04").attr("data-member")) + mar;
      let may = Number($("#05").attr("data-member")) + apr;
      let jun = Number($("#06").attr("data-member")) + may;
      let jul = Number($("#07").attr("data-member")) + jun;
      let aug = Number($("#08").attr("data-member")) + jul;
      let sep = Number($("#09").attr("data-member")) + aug;
      let oct = Number($("#10").attr("data-member")) + sep;
      let nov = Number($("#11").attr("data-member")) + oct;
      let dec = Number($("#12").attr("data-member")) + nov;

      let chartData = [
        jan,
        feb,
        mar,
        apr,
        may,
        jun,
        jul,
        aug,
        sep,
        oct,
        nov,
        dec,
      ];

      const ctx = document.getElementById("myChart").getContext("2d");
      new Chart(ctx, {
        type: "line",
        data: {
          labels: [
            "1월",
            "2월",
            "3월",
            "4월",
            "5월",
            "6월",
            "7월",
            "8월",
            "9월",
            "10월",
            "11월",
            "12월",
          ],
          datasets: [
            {
              label: "회원수",
              data: chartData,
              borderWidth: 2,
              borderColor: "#696CFF",
              backgroundColor: "#F0F0FF",
              fill: true,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
          elements: {
            line: {
              tension: 0.4,
            },
          },
        },
      });
    </script>
  </body>
</html>
