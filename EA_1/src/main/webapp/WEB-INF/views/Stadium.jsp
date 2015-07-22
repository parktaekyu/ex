<%@page import="com.dto.StadiumDTO"%>
<%@page import="java.util.List"%>
<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.dto.StadiumDTO"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Real Estate Map Update Template | PrepBootstrap</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="assets/font-awesome/css/font-awesome.min.css" />


<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

#category {
	position: absolute;
	top: 5px;
	left: 5px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
	display: none;
}

#menu_wrap {
	position: absolute;
	top: 65px;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
	display: none;
}

#hide_button {
	position: absolute;
	top: -34px;
	left: 0;
	bottom: 0;
	width: 12opx;
	height: 27px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0);
	z-index: 1;
	font-size: 12px;
	border-radius: 5px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
	
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>

<script type="text/javascript">


</script>
</head>
<body>


	<div class="container">

		<div class="page-header">
			<h1>
				Real Street Soccer Map <small>Bootstrap template, Show View
					Street Real Map</small>
			</h1>
		</div>

		<!-- Real Estate Map Update - START -->
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 "   style="width:45%; height:737px; overflow:auto">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
							<div class="panel panel-default"">
								<div class="row padall">
									<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
										<span></span>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
										<!--	<div class="clearfix">
											<div class="pull-left">
												<span class="fa fa-dollar icon">499,000</span>
											</div>
											<div class="pull-right">900 SqFt | 1 Bedroom | 1
												Bathroom</div>
										</div>
										<div>
											
										</div>-->

										<h4>Stadium Inventory View</h4>
										Touch Stadium List
									</div>
								</div>
							</div>
						</div>
					</div>

					<%
					
						String userAddr = (String)session.getAttribute("userAddr");	//사용자의 주소값 
						List<StadiumDTO> list = (List<StadiumDTO>) session.getAttribute("stadium");	//Stadium DB - 모든 리스트 
					
						for (StadiumDTO dto : list) {
					%>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
							<div class="panel panel-primary"
								onclick="javascript:init_map(' <%=dto.getStadiumAddr()%> ',' <%=dto.getStadiumName()%> ');">
								<div class="row padall">
									<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
										<span></span>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
										<div class="clearfix">
											<div class="pull-left">
												<span class="fa fa-dollar icon"> <%=dto.getStadiumName()%>
												</span>
											</div>

										</div>
										<div>
											<h4>
												<span class="fa fa-map-marker icon"></span>
												<%=dto.getStadiumAddr()%>
												&nbsp;&nbsp; <span class="fa fa-search icon pull-right">&nbsp;&nbsp;
													<button type="button"
														onclick="init_map(' <%=dto.getStadiumAddr()%> ',' <%=dto.getStadiumName()%> ')"
														data-toggle="modal" data-target=".bs-example-modal-lg"
														id="butt">JOIN</button>
												</span>
											</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<%
						}
					%>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<div class="map_wrap">
						<div id="map"
							style="width: 120%; height: 210%; position: relative; overflow: hidden;">
							
							</div>
						<div id="hide_button" >
							
							<button id="showr" >편의시설</button>
							<button id="hidr">검색창</button>
						</div>
						<div>
							
							<ul id="category">
								<li id="BK9" data-order="0"><span class="category_bg bank"></span>
									은행</li>
								<li id="MT1" data-order="1"><span class="category_bg mart"></span>
									마트</li>
								<li id="PM9" data-order="2"><span
									class="category_bg pharmacy"></span> 약국</li>
								<li id="OL7" data-order="3"><span class="category_bg oil"></span>
									주유소</li>
								<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
									카페</li>
								<li id="CS2" data-order="5"><span class="category_bg store"></span>
									편의점</li>
							</ul>
						</div>
						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<p>
								<form onsubmit="searchPlacesMap(); return false;">
									키워드 : <input type="text" value="" id="keyword" size="15">
									<button type="submit">검색하기</button>
								</form>

							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<script type="text/javascript"
			src="//apis.daum.net/maps/maps3.js?apikey=5b8cec7ffb2066fbdb00166885e1cc4a&libraries=services"></script>

		
		
		<script type="text/javascript">
		var category_check=0;
		var search_map_view=0;
		$( "#showr" ).click(function() {
			if(category_check==0){
				if(search_map_view==1&& $( "#menu_wrap" ).height()==300){
					  $( "#menu_wrap" ).animate({ "top": "+=65px" }, "fast" );
					  }
				$("#showr").value = "편의시설 감추기";
				  $( "ul" ).first().show(700);
				  category_check=1;
			}else{
				$("#showr").val = "편의시설 보이기";
				$( "ul" ).hide( 300 );
				category_check=0;	
				if(search_map_view==1&& $( "#menu_wrap" ).height()==235){
					  $( "#menu_wrap" ).animate({ "top": "-=65px" }, "fast" );
					  }
				
				
			}	
		});

			$( "#hidr" ).click(function() {
				if(search_map_view==0){
					console.log($( "#menu_wrap" ).height());
					if(category_check==0 && $( "#menu_wrap" ).height()==235){
						  $( "#menu_wrap" ).animate({ "top": "-=65px" }, "fast" );
							 	  
					  }
					if(category_check==1&& $( "#menu_wrap" ).height()==300){
						  $( "#menu_wrap" ).animate({ "top": "+=65px" }, "fast" );
						  }
					
					console.log($( "#menu_wrap" ).height());
					$("#showr").value = "편의시설 감추기";
					  $( "#menu_wrap" ).first().show(700);
					  
					  
					  
					  search_map_view=1;
					  
					
				
				}else{
					$("#showr").val = "편의시설 보이기";
					$( "#menu_wrap" ).hide( 300 );
					search_map_view=0;
					
				}
				
			  
			});
		</script>		
		<script type="text/javascript">
	
			var placeOverlay = new daum.maps.CustomOverlay({
				zIndex : 1
			}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
			markers = [], // 마커를 담을 배열입니다
			currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

		
			
		
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center :new daum.maps.LatLng(37.562201,126.975371), // 지도의 중심좌표
				level : 8
			// 지도의 확대 레벨
			};
			var map = new daum.maps.Map(mapContainer, mapOption);
			var geocoder = new daum.maps.services.Geocoder();
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 장소 검색 객체를 생성합니다
			var psPlace = new daum.maps.services.Places(map);

			// 지도에 idle 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'idle', searchPlaces);

			// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
			contentNode.className = 'placeinfo_wrap';

			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
			addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart',
					daum.maps.event.preventMap);

			// 커스텀 오버레이 컨텐츠를 설정합니다
			placeOverlay.setContent(contentNode);

			// 각 카테고리에 클릭 이벤트를 등록합니다
			addCategoryClickEvent();

			// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
			function addEventHandle(target, type, callback) {
				if (target.addEventListener) {
					target.addEventListener(type, callback);
				} else {
					target.attachEvent('on' + type, callback);
				}
			}

			// 카테고리 검색을 요청하는 함수입니다
			function searchPlaces() {

				// 커스텀 오버레이를 숨깁니다 
				placeOverlay.setMap(null);

				if (!currCategory) {
					return;
				}

				psPlace.categorySearch(currCategory, placesSearchCB, {
					useMapBounds : true
				});
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(status, data, pagination) {
				if (status === daum.maps.services.Status.OK) {

					// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
					displayPlaces(data.places);
				}
			}

			// 지도에 마커를 표출하는 함수입니다
			function displayPlaces(places) {

				// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
				// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
				var order = document.getElementById(currCategory).getAttribute(
						'data-order');

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();

				for (var i = 0; i < places.length; i++) {

					// 마커를 생성하고 지도에 표시합니다
					var marker = addMarker(new daum.maps.LatLng(
							places[i].latitude, places[i].longitude), order);

					// 마커와 검색결과 항목을 클릭 했을 때
					// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
					(function(marker, place) {
						daum.maps.event.addListener(marker, 'click',
								function() {
									displayPlaceInfo(place);
								});
					})(marker, places[i]);
				}
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, order) {
				var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new daum.maps.Size(27, 28), // 마커 이미지의 크기
				imgOptions = {
					spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
					spriteOrigin : new daum.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset : new daum.maps.Point(11, 28)
				// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
						imgOptions), marker = new daum.maps.Marker({
					position : position, // 마커의 위치
					image : markerImage
				});

				marker.setMap(map); // 지도 위에 마커를 표출합니다
				markers.push(marker); // 배열에 생성된 마커를 추가합니다

				return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
			function displayPlaceInfo(place) {
				var content = '<div class="placeinfo">'
						+ '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">'
						+ place.title + '</a>';

				if (place.newAddress) {
					content += '    <span title="' + place.newAddress + '">'
							+ place.newAddress
							+ '</span>'
							+ '  <span class="jibun" title="' + place.address + '">(지번 : '
							+ place.address + ')</span>';
				} else {
					content += '    <span title="' + place.address + '">'
							+ place.address + '</span>';
				}

				content += '    <span class="tel">' + place.phone + '</span>'
						+ '</div>' + '<div class="after"></div>';

				contentNode.innerHTML = content;
				placeOverlay.setPosition(new daum.maps.LatLng(place.latitude,
						place.longitude));
				placeOverlay.setMap(map);
			}

			// 각 카테고리에 클릭 이벤트를 등록합니다
			function addCategoryClickEvent() {
				var category = document.getElementById('category'), children = category.children;

				for (var i = 0; i < children.length; i++) {
					children[i].onclick = onClickCategory;
				}
			}

			// 카테고리를 클릭했을 때 호출되는 함수입니다
			function onClickCategory() {
				var id = this.id, className = this.className;

				placeOverlay.setMap(null);

				if (className === 'on') {
					currCategory = '';
					changeCategoryClass();
					removeMarker();
				} else {
					currCategory = id;
					changeCategoryClass(this);
					searchPlaces();
				}
			}

			// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
			function changeCategoryClass(el) {
				var category = document.getElementById('category'), children = category.children, i;

				for (i = 0; i < children.length; i++) {
					children[i].className = '';
				}

				if (el) {
					el.className = 'on';
				}
			}

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			var customOverlay = new daum.maps.CustomOverlay();

			var save_stadium_name;

			//검색기

			var search_markers = [];

			// 장소 검색 객체를 생성합니다

			var ps = new daum.maps.services.Places();

			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다

			var infowindow = new daum.maps.InfoWindow({

				zIndex : 1

			});

			// 키워드 검색을 요청하는 함수입니다

			function searchPlacesMap() {

				var keyword = document.getElementById('keyword').value;

				if (!keyword.replace(/^\s+|\s+$/g, '')) {

					alert('키워드를 입력해주세요!');

					return false;

				}

				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다

				ps.keywordSearch(keyword, places_SearchCB);

			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다

			function places_SearchCB(status, data, pagination) {

				if (status === daum.maps.services.Status.OK) {

					// 정상적으로 검색이 완료됐으면

					// 검색 목록과 마커를 표출합니다

					searchdisplayPlaces(data.places);

					// 페이지 번호를 표출합니다

					displayPagination(pagination);

				} else if (status === daum.maps.services.Status.ZERO_RESULT) {

					alert('검색 결과가 존재하지 않습니다.');

					return;

				} else if (status === daum.maps.services.Status.ERROR) {

					alert('검색 결과 중 오류가 발생했습니다.');

					return;

				}

			}

			// 검색 결과 목록과 마커를 표출하는 함수입니다

			function searchdisplayPlaces(places) {

				var listEl = document.getElementById('placesList'), menuEl = document

				.getElementById('menu_wrap'), fragment = document

				.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

				// 검색 결과 목록에 추가된 항목들을 제거합니다

				removeAllChildNods(listEl);

				// 지도에 표시되고 있는 마커를 제거합니다

				removeSearchMarker();

				for (var i = 0; i < places.length; i++) {

					// 마커를 생성하고 지도에 표시합니다

					var placePosition = new daum.maps.LatLng(
							places[i].latitude,

							places[i].longitude), sMarker = addSearchMarker(
							placePosition,

							i), itemEl = getListItem(i, places[i], sMarker); // 검색 결과 항목 Element를 생성합니다

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해

					// LatLngBounds 객체에 좌표를 추가합니다

					bounds.extend(placePosition);

					// 마커와 검색결과 항목에 mouseover 했을때

					// 해당 장소에 인포윈도우에 장소명을 표시합니다

					// mouseout 했을 때는 인포윈도우를 닫습니다

					(function(sMarker, title, places) {

						daum.maps.event.addListener(sMarker, 'mouseover',

						function() {

							displayInfowindow(sMarker, title);
							customOverlay.setMap(null);

						});

						daum.maps.event.addListener(sMarker, 'mouseout',
								function() {

									infowindow.close();

								});
						
						daum.maps.event.addListener(sMarker, 'click', function() {
							console.log(places);
							console.log(places.address);
							
							//location.href="list.jsp?xxx="+places;
							
							 customOverlay = new daum.maps.CustomOverlay({
							    map: map,
							    position: new daum.maps.LatLng(places.latitude,
										places.longitude),
							    content: '<div class="customoverlay"  >' +
							    '  <a href="#"  id="sendNewStadium">' +
							    '    <span class="title">'+ places.title  +'&nbsp;경기장 추가하기</span>' +
							    '  </a>' +
							    '</div>',
							    yAnchor: 1 
							});
							 
							 customOverlay.setMap(map);
							 var addr;
							 
					
							  $(document).ready( function() {
											
								  $("#sendNewStadium").on("click",function() {
										if (places.newAddress) {
											addr = places.newAddress;
										} else {
											addr = places.address;
										}
										
											 $.ajax({
									             url : "../go/sendNewStadidum",
									             method : "post",
									             data : {"stadiumName":places.title ,
									            		 "stadiumAddr":addr ,
									            		 "stadiumTell":places.phone 
									            		 },
									             dataType : "text", //넘어갈 데이터 타입을 정해준다.
									             success : function(responseData, status, xhr) {
									            	 
									            	 location.href="stadium";
									            	 
									             }
											 });//end ajax
										
								  });	
										

									
								}); //end document  
						});//end event Listener
						//새로운 경기장 추가하기.
						

						itemEl.onmouseover = function() {

							displayInfowindow(sMarker, title);

						};

						itemEl.onmouseout = function() {

							infowindow.close();

						};

					})(sMarker, places[i].title, places[i]);

					fragment.appendChild(itemEl);

				}

				// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다

				listEl.appendChild(fragment);

				menuEl.scrollTop = 0;

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다

				map.setBounds(bounds);

			}

			// 검색결과 항목을 Element로 반환하는 함수입니다

			function getListItem(index, places) {

				var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'

						+ (index + 1)

						+ '"></span>'

						+ '<div class="info">'

						+ '   <h5>' + places.title + '</h5>';

				if (places.newAddress) {

					itemStr += '    <span>' + places.newAddress + '</span>'

					+ '   <span class="jibun gray">' + places.address

					+ '</span>';

				} else {

					itemStr += '    <span>' + places.address + '</span>';

				}

				itemStr += '  <span class="tel">' + places.phone + '</span>'

				+ '</div>';

				el.innerHTML = itemStr;

				el.className = 'item';

				return el;

			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다

			function addSearchMarker(position, idx, title) {

				var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다

				imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기

				imgOptions = {

					spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기

					spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표

					offset : new daum.maps.Point(13, 37)

				// 마커 좌표에 일치시킬 이미지 내에서의 좌표

				}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,

				imgOptions), sMarker = new daum.maps.Marker({

					position : position, // 마커의 위치

					image : markerImage

				});

				sMarker.setMap(map); // 지도 위에 마커를 표출합니다

				search_markers.push(sMarker); // 배열에 생성된 마커를 추가합니다

				return sMarker;

			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다

			function removeSearchMarker() {

				for (var i = 0; i < search_markers.length; i++) {

					search_markers[i].setMap(null);

				}

				search_markers = [];

			}

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다

			function displayPagination(pagination) {

				var paginationEl = document.getElementById('pagination'), fragment = document

				.createDocumentFragment(), i;

				// 기존에 추가된 페이지번호를 삭제합니다

				while (paginationEl.hasChildNodes()) {

					paginationEl.removeChild(paginationEl.lastChild);

				}

				for (i = 1; i <= pagination.last; i++) {

					var el = document.createElement('a');

					el.href = "#";

					el.innerHTML = i;

					if (i === pagination.current) {

						el.className = 'on';

					} else {

						el.onclick = (function(i) {

							return function() {

								pagination.gotoPage(i);

							}

						})(i);

					}

					fragment.appendChild(el);

				}

				paginationEl.appendChild(fragment);

			}

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다

			// 인포윈도우에 장소명을 표시합니다

			function displayInfowindow(sMarker, title) {

				var content = '<div style="padding:5px;z-index:1;">' + title

				+ '</div>';

				infowindow.setContent(content);

				infowindow.open(map, sMarker);

			}

			// 검색결과 목록의 자식 Element를 제거하는 함수입니다

			function removeAllChildNods(el) {

				while (el.hasChildNodes()) {

					el.removeChild(el.lastChild);

				}

			}

			function sendStadium() {

				console.log(save_stadium_name);
				document.getElementById("stadiumName").value = save_stadium_name;
				document.getElementById("stadium_Name").value = save_stadium_name;
			}
		
			customOverlay.setMap(null);

			function init_map(addr_str, stadium_name) {
				customOverlay.setMap(null);

				save_stadium_name = stadium_name;

				sendStadium();
				geocoder
						.addr2coord(
								addr_str,
								function(status, result) {

									// 정상적으로 검색이 완료됐으면 
									if (status === daum.maps.services.Status.OK) {

										var coords = new daum.maps.LatLng(
												result.addr[0].lat,
												result.addr[0].lng);

										map.panTo(coords);

										var marker = new daum.maps.Marker({
											position : coords
										});

										marker.setMap(map);

										var iwContent = '<div class="customoverlay" id="one">'
												+ '  <a href="#" onclick="sendStadium()" target="_blank" data-toggle="modal" data-target=".bs-example-modal-lg" >'
												+ '    <span class="title">'
												+ stadium_name
												+ '</span>'
												+ '  </a>' + '</div>';

										iwRemoveable = true;
										customOverlay = new daum.maps.CustomOverlay(
												{
													map : map,
													
													position : coords,
													content : iwContent,
													xAnchor: 0.485,
												    yAnchor: 0.07,
													removable : iwRemoveable
												});

										console.log(customOverlay);

									}
								});
			}
			
		</script>

		<style>
.gmnoprint img {
	max-width: none;
}

.panel:hover {
	background-color: rgb(237, 245, 252);
}

.map {
	min-width: 300px;
	min-height: 470px;
	width: 100%;
	height: 100%;
}

img {
	max-width: 110%;
	height: auto;
}

.clearfix {
	clear: both;
}

.rowcolor {
	background-color: #CCCCCC;
}

.padall {
	padding: 4px;
}

.padbig {
	padding: 20px;
}

.icon {
	font-size: 18px;
	color: #197BB5;
}
</style>

		<!-- Real Estate Map Update - END -->

	</div>

	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="assets/js/jquery.backstretch.min.js"></script>
	<script>
		$('.backstretch').css('opacity', '0.7');
	</script>
</body>




<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">경기장 등록</h4>
			</div>
			<form action="addApplyTeam" method="post">
				<div class="modal-body">

					<div class="form-group">
						<label for="id" class="control-label">경 기 장</label> <input
							type="text" class="form-control" value="" id="stadium_Name"
							name="stadium_Name" disabled> <input type="hidden"
							id="stadiumName" name="stadiumName" value="">
					</div>
					<div class="form-group">
						<label for="pass" class="control-label">소 속 팀</label> <input
							type="text" class="form-control" id="teamNo" name="teamNo">
					</div>
					<div class="form-group">
						<label for="name" class="control-label">경 기 인 원</label> <input
							class="form-control" id="applyPlayer" name="applyPlayer">
					</div>
					
					<%
						 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
						 String today = formatter.format(new java.util.Date());
						 out.println(today);
					%>

					<div class="form-group">
						<label for="birth" class="control-label">시 작 시 간</label> <input
							class="form-control" id="startTime" name="startTime">
					</div>


					<div class="form-group">
						<label for="tel" class="control-label">종 료 시 간</label> <input
							class="form-control" id="endTime" name="endTime">
					</div>




				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="reset" class="btn btn-default" value="다시 쓰기">
					<input type="submit" class="btn btn-primary" value="신청 하기">
				</div>
			</form>
		</div>
	</div>
</div>


</html>