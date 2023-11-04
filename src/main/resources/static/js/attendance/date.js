//오늘 날짜 데이터
let date = new Date();
//원하는 형식으로 포맷 
const today = moment(date).format("YYYY-MM-DD");
let formattedDay = moment(date).format("YYYY-MM-DD");
let formattedMonth = moment(date).format("YYYY-MM");
console.log(formattedMonth);

$('#work').text(formattedMonth);

//month list
function getMonthList(day, month){
  $.ajax({
    type: 'get',
    url: '/admin/attendance/month',
    data: {
      workDate: day
    },
    success: function(result){
      $('#navs-justified-home').html(result);
      $('#work').attr('data-date', day) //data-date 속성 업데이트
      $('#work').text(month); //화면에 표시될 날짜 업데이트
    }
  })
} 

//당일 근태 조회버튼 클릭 시 
$('#navs-justified-home').on('click', '#day_btn', function(){
    getDayList(today); //당일 근태 목록 불러오기 
})

//월별 근태 조회버튼 클릭 시 
$('#navs-justified-home').on('click', '#month_btn', function(){
    getMonthList(formattedDay, formattedMonth); //월별 근태 목록 불러오기 
})

//day list
function getDayList(day){
  $.ajax({
    type: 'get',
    url: '/admin/attendance/day',
    data: {
      workDate: day
    },
    success: function(result){
      $('#navs-justified-home').html(result);
      console.log(date);
      $('#work').attr('data-date', day); //data-date 속성 업데이트
      console.log($('#work').attr('data-date'));
      $('#work').text(day); //화면에 표시될 날짜 업데이트
    }
  })
}

//이전버튼(전날) 클릭 시 
$('#navs-justified-home').on('click', '#pre_day', function(){
    //기존 날짜 데이터
    const originalDate = $('#work').attr('data-date');
    //기존 날짜 데이터를 JS Date 객체로 변환
    const dateObject = new Date(originalDate);
    //하루 전의 날짜로 변경
    dateObject.setDate(dateObject.getDate()-1);
    //원하는 형식으로 포맷
    formattedMonth = moment(dateObject).format("YYYY-MM");
    formattedDay = moment(dateObject).format("YYYY-MM-DD");

    getDayList(formattedDay); //해당 날짜의 근태 목록 불러오기 
})

//다음버튼(다음날) 클릭 시
$('#navs-justified-home').on('click', '#next_day', function(){
    //기존 날짜 데이터
    const originalDate = $('#work').attr('data-date');
    //기존 날짜 데이터를 JS Date 객체로 변환
    const dateObject = new Date(originalDate);
    //하루 후의 날짜로 변경
    dateObject.setDate(dateObject.getDate()+1);
    //원하는 형식으로 포맷
    formattedMonth = moment(dateObject).format("YYYY-MM");
    formattedDay = moment(dateObject).format("YYYY-MM-DD");

    getDayList(formattedDay); //해당 날짜의 근태 목록 불러오기 
})

//이전버튼(전달) 클릭 시 
$('#navs-justified-home').on('click', '#pre_month', function(){
    //기존 날짜 데이터
    const originalDate = $('#work').attr('data-date');
    //기존 날짜 데이터를 JS Date 객체로 변환
    const dateObject = new Date(originalDate);
    //한달 전의 날짜로 변경
    dateObject.setMonth(dateObject.getMonth()-1);
    //원하는 형식으로 포맷
    formattedMonth = moment(dateObject).format("YYYY-MM");
    formattedDay = moment(dateObject).format("YYYY-MM-DD");
    
    getMonthList(formattedDay, formattedMonth); //해당 월의 근태 목록 불러오기 ;
})

//다음버튼(다음달) 클릭 시
$('#navs-justified-home').on('click', '#next_month', function(){
    //기존 날짜 데이터
    const originalDate = $('#work').attr('data-date');
    //기존 날짜 데이터를 JS Date 객체로 변환
    const dateObject = new Date(originalDate);
    //한달 후의 날짜로 변경
    dateObject.setMonth(dateObject.getMonth()+1);
    //원하는 형식으로 포맷
    formattedMonth = moment(dateObject).format("YYYY-MM");
    formattedDay = moment(dateObject).format("YYYY-MM-DD");
    
    getMonthList(formattedDay, formattedMonth); //해당 월의 근태 목록 불러오기 
})

//당일 근태 검색 
$('#navs-justified-home').on('click', '#submit_btn', function(){
    getSearchDayList(formattedDay, $('#page').val(),  $('#k').val(),  $("input[name='search']").val());
})

//search day list
function getSearchDayList(day, page, kind, search){
  $.ajax({
      type: 'get',
      url: '/admin/attendance/day',
      data: {
        workDate: day,
        page: page,
        kind: kind,
        search: search
      },
      success: function(result){
        $('#navs-justified-home').html(result);
      }
  })
}

//월 근태 검색 
$('#navs-justified-home').on('click', '#submit_btn', function(){
  getSearchMonthList(formattedDay, $('#page').val(),  $('#k').val(),  $("input[name='search']").val());
})

//search Month list
function getSearchMonthList(day, page, kind, search){
  $.ajax({
      type: 'get',
      url: '/admin/attendance/month',
      data: {
        workDate: day,
        page: page,
        kind: kind,
        search: search
      },
      success: function(result){
        $('#navs-justified-home').html(result);
      }
  })
}


$('#navs-justified-home').on('click', '.move', function(){
    const num = $(this).attr('data-num');
    $('#page').val(num);
    getSearchMonthList(formattedDay, $('#page').val(),  $('#k').val(),  $("input[name='search']").val());
})

$('#navs-justified-home').find('.kind').each(function(){
    if($(this).val()==$('#k').attr('data-kind')){
        $(this).prop('selected', true);
        return;
    }
})