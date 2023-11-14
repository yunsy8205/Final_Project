
document.addEventListener('DOMContentLoaded', function() {
    getRequestList();
});

//근태 수정 요청 목록
function getRequestList(page, kind, search){
    $.ajax({
        type: 'get',
        url: '/admin/attendanceModify/list',
        data: {
            page: page,
             kind: kind,
           search: search
          },
        success: function(result){
            $('#navs-justified-profile').html(result);

            $('#navs-justified-profile').find('.kind').each(function(){
                if($(this).val()==$('#k').attr('data-kind')){
                    $(this).prop('selected', true);
                    return false;
                }
            })
        }
    })
}

//검색
$('#navs-justified-profile').on('click', '#search_btn', function(){
    getRequestList($('#page').val(),  $('#k').val(),  $("input[name='search']").val());
});

//paging
$('#navs-justified-profile').on('click', '.move', function(){
    let num = $(this).attr('data-num');
    $('#page').val(num);
    getRequestList($('#page').val(),  $('#k').val(),  $("input[name='search']").val());
});



