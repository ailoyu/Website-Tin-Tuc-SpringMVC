<%@ page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Navigation -->


<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<a class="navbar-brand" href="<c:url value='/index.jsp' />">Twinkle News</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<% if(SecurityUtils.getPrincipal() != null){ %>
			<a class="navbar-brand" href="<c:url value='/twinkle' />">Twinkle Social Media</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<% } else { %>
			<a class="navbar-brand" href="<c:url value='/dang-nhap' />">Twinkle Social Media</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<% } %>
		</div>
		
		<div class="collapse navbar-collapse" id="navbarResponsive"
			style="margin-left: 5%;">
			<form action="<c:url value='/search'/>">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><input oninput="" style="width: 16em"
						class="form-control me-2" type="text"
						placeholder="Tìm kiếm bài viết và người dùng" aria-label="Search" name="key"
						value="${key}"></li>
					<li class="nav-item" style="margin-left: 1em;">
						<button class="btn btn-outline-success" type="submit">Tìm</button>
					</li>
					

					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/index.jsp' />">Trang Chủ <span
							class="sr-only">(current)</span>
					</a></li>
					<security:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/dang-nhap'/>">Đăng Nhập</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/dang-ky'/>">Đăng Ký</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<security:authorize access="hasAnyRole('ADMIN')">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle"
									href="" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> Welcome, <%=SecurityUtils.getPrincipal().getFullName()%></a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a></li>
										<li><a class="dropdown-item" href="<c:url value='/trang-ca-nhan'/>">Trang cá nhân</a></li>
										<li><a class="dropdown-item" href="<c:url value='/thay-doi-thong-tin' />">Thay đổi thông
												tin</a></li>
										<li><a class="dropdown-item" href="<c:url value='/tin-nhan' />">Nhắn tin</a></li>
										<li><a class="dropdown-item" href="<c:url value='/thay-doi-mat-khau' />">Đổi mật khẩu</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item"
											href="<c:url value='/thoat' />">Đăng xuất</a></li>
									</ul></li>
							</security:authorize>
							<security:authorize access="hasAnyRole('USER')">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> Welcome, <%=SecurityUtils.getPrincipal().getFullName()%></a>
									<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="<c:url value='/trang-ca-nhan'/>">Trang cá nhân</a></li>
										<li><a class="dropdown-item" href="<c:url value='/thay-doi-thong-tin' />">Thay đổi thông
												tin</a></li>
										<li><a class="dropdown-item" href="<c:url value='/tin-nhan' />">Nhắn tin</a></li>
										<li><a class="dropdown-item" href="<c:url value='/thay-doi-mat-khau' />">Đổi mật khẩu</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item"
											href="<c:url value='/thoat' />">Đăng xuất</a></li>
									</ul></li>
							</security:authorize>

						</ul>
					</security:authorize>
				</ul>
			</form>
		</div>
	</div>
</nav>

<audio preload="auto" src="<c:url value="/template/c1.mp3" />" loop="true" autobuffer>
					</audio>

<script type="text/javascript">
function setCookie(c_name,value,exdays)
{
    var exdate=new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
    document.cookie=c_name + "=" + c_value;
}

function getCookie(c_name)
{
    var i,x,y,ARRcookies=document.cookie.split(";");
    for (i=0;i<ARRcookies.length;i++)
    {
      x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
      y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
      x=x.replace(/^\s+|\s+$/g,"");
      if (x==c_name)
        {
        return unescape(y);
        }
      }
}

var song = document.getElementsByTagName('audio')[0];
var played = false;
var tillPlayed = getCookie('timePlayed');
function update()
{
	song.volume = 0.1;
    if(!played){
        if(tillPlayed){
        song.currentTime = tillPlayed;
        song.play();
        played = true;
        }
        else {
                song.play();
                played = true;
        }
    }

    else {
    setCookie('timePlayed', song.currentTime);
    }
}
setInterval(update,1000);
</script>