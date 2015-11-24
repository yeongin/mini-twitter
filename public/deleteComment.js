function deleteComment() {
    var password = prompt("패스워드를 입력해주세요.");
    $('#comment_pw').val(password);
    $('#comment_del_form').submit();
    }
    
$(document).ready(function(){
    $('.test').click(function(event) {
        event.preventDefault()
        console.log("$(this)[0] : " + $(this).attr('href'));
        $('#comment_id').val($(this).attr('href'));
        //console.log("comment_id: " + $('#comment_id').val());
        $('#myModal').modal('show')
    });    
});