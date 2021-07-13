# Ajax 통신

## AJAX(Asynchronous Javascript and XML)란?

- 브라우저 대신 Javascript의 코드로 서버에 **요청(Request)하고 응답(Response) 받는다.**  
- 웹페이지의 Reload 없이 동적으로 웹페이지를 구성할 수 있다.
- `비동기(Asynchronous)`로 통신한다.

### 동기(Synchronous) vs 비동기(Asynchronous)
- `동기(Sync)`: 수행시킨 코드가 다 진행될 때까지 기다리고 다음 코드 수행
- `비동기(Async)`: 수행시킨 코드의 결과를 확인하지 않고 다음 코드 수행

> JQuery를 이용한 AJAX 코드의 예

```
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
    $.ajax({
        type:"GET",
        url:"/test",
        dataType:"JSON", 
        data: {"name":"boram", "nickname":"marobiana"},
        success : function(data) {
            // 통신 성공시 함수 수행. data에 response 값이 들어있다.
        },
        complete : function(data) {
            // 통신이 성공했거나 실패해도 완료되면 함수 수행
        },
        error : function(xhr, status, error) {
            // 통신 후 에러 발생시 함수 수행
        }
    });
</script>
```

> JQuery를 이용한 AJAX 코드의 예(2)
```
var request = $.ajax({
    url: "script.php",
    method: "POST",
    data: { id : menuId },
    dataType: "html"
});
 
request.done(function( msg ) {
    $( "#log" ).html( msg );
});
 
request.fail(function( jqXHR, textStatus ) {
    alert( "Request failed: " + textStatus );
});
```


### > [JQuery AJAX 레퍼런스 문서](https://api.jquery.com/jquery.ajax/)

