<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <c:import url="../temp/bootStrap.jsp" />
        </head>
        <style>
            .submenu {
                list-style-type: none;
                position: right;
                display: none;
            }
        </style>

        <body>
            <div id="orgChart">
                <ul id="menu">
                    <c:forEach items="${employeeVO}" var="emp" varStatus="i">
                        <c:if test="${emp.position!='트레이너'}">
                            <li id="employee${i.index}" class="empList" data-name="${emp.name}" data-position="${emp.position}">${emp.name}:${emp.position}</li>
                        </c:if>
                    </c:forEach>
                    <li>
                      트레이너
                      <ul class="submenu">
                        <c:forEach items="${employeeVO}" var="emp" varStatus="i">
                            <c:if test="${emp.position=='트레이너'}">
                                <li id="trainer${i.index}" data-name="${emp.name}" data-position="${emp.position}" class="trainerList">${emp.name}</li>
                            </c:if>
                        
                        </c:forEach>
                      </ul>
                    </li>
                  </ul>

                <!-- <c:forEach items="${employeeVO}" var="emp" varStatus="i">
                <c:if test="${emp.position!='트레이너'}">
                    <ul id="employee${i.index}">
                    <li class="employee" data-name="${emp.name}" data-position="${emp.position}">${emp.position}:${emp.name}</li>
                    </ul>
                </c:if>
            </c:forEach> -->
                <!-- <ul>
                
                    <c:forEach items="${employeeVO}" var="emp" varStatus="i">
                        <c:if test="${emp.position=='트레이너'}">
                            <li id="trainer${i.index}" class="trainer">${emp.name}</li>
                        </c:if>
                    
                    </c:forEach>
            </ul> -->
            </div>
            <div>
                <table>
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>타입</th>
                                <th>결재자</th>
                                <th>직급</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                            <tr id="middleRow">
                                <th>중간</th>

                            </tr>
                            <tr id="lastRow">
                                <th>최종</th>
                            </tr>
                        </tbody>
                    </table>
                </table>
            </div>
            <form action="./add.jsp">
                <input type="hidden" id="middle" name="middle">
                <input type="hidden" id="last" name="last">
            <button id="okBtn">확인</button>
             </form>
            <script src="/resources/js/approval/line.js"></script>
        </body>

        </html>