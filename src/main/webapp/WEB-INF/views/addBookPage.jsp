<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Homepage - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>

</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">책 추가 페이지</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Main</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown2" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">서재</a>
<%--                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">전체 책</a></li>
                        <li><a class="dropdown-item" href="#!">읽고 싶은 책</a></li>
                        <li><a class="dropdown-item" href="#!">읽은 책</a></li>
                    </ul>--%>
                </li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Record</a></li>
            </ul>
            <form class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
                    로그인
                </button>
            </form>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Book Record</h1>
            <p class="lead fw-normal text-white-50 mb-0">내 서재</p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <input id="searchKeyword" style="width: 300px">
            <button id="searchBtn" style="width: 70px">검색</button>
        </div>
        <div id="searchDataTable"></div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
<script>
    const searchBtn = document.getElementById('searchBtn');
    const searchData = document.getElementById('searchDataTable');

    searchBtn.addEventListener('click', () => {
        document.getElementById('searchDataTable').textContent = '';

        const searchKeyword = document.getElementById('searchKeyword').value;
        console.log('searchKeyword: ', searchKeyword)
        $.ajax({
            url : 'https://dapi.kakao.com/v3/search/book',
            type : 'GET',
            data : {
                query : searchKeyword
            },
            headers: {
                Authorization: 'KakaoAK API키'
            },
            dataType : "json",
            contentType:"application/json",
            timeout: 10000,
            success : function(data){
                setSearchData(data.documents);
            },
            error : function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            complete:function(){

            }
        });
    });

    /**
     * 받아 온 데이터를 화면에 뿌려 주는 부분
     * */
    const setSearchData = data => {
        data.forEach(item => {
            const titleElement = document.createElement('div');
            const contentsElement = document.createElement('div');
            const authorsElement = document.createElement('div');
            const thumbnailElement = document.createElement('img');

            authorsElement.textContent = item.authors;
            contentsElement.textContent = item.contents;
            titleElement.textContent = item.title;
            thumbnailElement.src = item.thumbnail;

            searchData.appendChild(thumbnailElement);
            searchData.appendChild(titleElement);
            searchData.appendChild(authorsElement);
            searchData.appendChild(contentsElement);
        })
    }

</script>
</html>
