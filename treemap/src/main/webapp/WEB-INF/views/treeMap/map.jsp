<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>좌표로 주소를 얻어내기</title>
<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 10px;
	border: 1px solid #888;
	border-radius: 10px;
	width: 30%; /* Could be more or less, depending on screen size */
	min-width: 400px;
	min-height: 200px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.fBtn {
	width: 120px;
	margin: 5px;
	border: none;
	cursor: pointer;
	background-color: #DDDDDD;
	text-align: center;
	cursor: pointer;
	padding: 3px;
	background-color: darkslategray;
	color: white;
}

.modalInput {
	width: 200px;
	height: 20px;
	border: 0.5px solid gray;
	padding: 3px;
}
.modalInput:focus {
	border: solid 1px lightblue;
}

.modalLabel {
	margin-right: 5px;
	color: darkslategray;
}

.modalBox {
	width: 300px;
	display: flex;
	justify-content: space-between;
	margin: 5px;
}

.modalTitle {
	margin-bottom: 20px;
}
.modalmemo{
	width: 200px;
	height: 100px;
	resize:none;
	padding: 3px;
}

</style>
<link href="../../../../resources/css/map.css" rel="stylesheet" type="text/css">
<link href="../../../../resources/css/searchKeyword.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../include/mapNav.jsp"%>
	<%@ include file="../include/mapboard.jsp"%>
	<div class="mapboardWrap">
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 700px; position: relative; overflow: hidden;"></div>
			<div class="hAddr">
				<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modalTitle">
				<h3 style="color: darkslategray">즐겨찾기 등록</h3>
			</div>
			<div class="modalBox">
				<label class="modalLabel">카테고리</label><input class="modalInput"
					id="category" type="text" placeholder="예) 맛집, 쇼핑" />
			</div>
			<div class="modalBox">
				<label class="modalLabel">별칭</label><input class="modalInput"
					id="addressname" type="text" />
			</div>
			<div class="modalBox">
				<label class="modalLabel">메모</label><textarea class="modalmemo" id="memo"> </textarea>
			</div>
			<p>
				<br />
			</p>
			<div
				style="width: 100%; display: flex; align-items: center; justify-content: center;">
				<div style="width: 40%">
					<button class="fBtn" onClick="setFavorites();">
						<span class="pop_bt" style="font-size: 10pt;"> 등록 </span>
					</button>
				</div>
				<div>
					<button class="fBtn" onClick="closeModal();">
						<span class="pop_bt" style="font-size: 10pt;"> 취소 </span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=842543be7b015b65d49c7a92818f1397&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		//위도
		let lat;
		//경도
		let lng;
		//도로명주소
		let rowaddress;
		//지번주소
		let address;
		let markerChk= false;
		function addrmarker(lat, lng, rowaddress, address, adrName) {
			if(markerChk===false){
			markerChk==true;
			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(lat, lng);
			
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(40, 44), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(18, 43)}; // 마커이미지의 옵션입니다.	 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition,
				image: markerImage
			});

			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(lat, lng);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			/*
			var iwContent = '<div style="padding:7px;"> <h4>'+adrName+'</h4> <div>'+rowaddress+'</div>'+address+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다
			
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			 */
			let iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다
			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ adrName
					+ '        </div>' 
					+ '        <div class="body">'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">' 
					+ rowaddress
					+ '</div>' + 
					'                <div class="jibun ellipsis">'
					+ address + '</div>' + '            </div>'
					+ '        </div>' + '    </div>' + '</div>';

			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : iwPosition
			});

			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			overlay.setMap(map);
			
			/*
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
				overlay.setMap(null);
			}
			*/

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			//infowindow.open(map, marker);
			}else{
				
			}
		}

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map,'click',function(mouseEvent) {
							searchDetailAddrFromCoords(mouseEvent.latLng,function(result, status) {
										if (status === kakao.maps.services.Status.OK) {
											//marker.setMap(null);
											var detailAddr = !!result[0].road_address ? '<div class="ellipsis">도로명주소 : '
													+ result[0].road_address.address_name
													+ '</div>': '';
											detailAddr += '<div class="jibun ellipsis"> 지번 주소 : '+ result[0].address.address_name+ '</div>';
											/*
											var content = '<div class="bAddr">'
													+ '<div class="favoritesBox">'
													+ '<button type="button" class="favoritesBtn" onclick="openModal();">즐겨찾기</button> </div>'
													+ detailAddr + '</div>';
											*/
											var content = '<div class="wrap" style="margin-left:0;left:-68px;top:-67px;">'
													+ '    <div class="info">'
													+ '        <div class="title">'
													+ '			<button type="button" class="favoritesBtn" onclick="openModal();">즐겨찾기 등록하기</button>'
													+ '			<img src="../../../../resources/imgs/위치.png" style="width:20px; float:right;margin-right:10px;margin-top:5px;"/>'
													+ '        </div>' 
													+ '        <div class="body">'
													+ '            <div class="desc">'
													+                detailAddr
													+ '            </div>'
													+ '        </div>' + '    </div>' + '</div>';

											// 마커를 클릭한 위치에 표시합니다 
											marker.setPosition(mouseEvent.latLng);
											marker.setMap(map);
											
											// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
											infowindow.setContent(content);
											infowindow.open(map, marker);

											lat = mouseEvent.latLng.getLat();
											lng = mouseEvent.latLng.getLng();
											rowaddress = !!result[0].road_address ? result[0].road_address.address_name
													: '';
											address = result[0].address.address_name;

										}
									});
						});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function openModal() {
			document.querySelector('#myModal').style = "display:block";
			//$('#myModal').show();
		}

		function setFavorites() {
			let addressname = document.querySelector("#addressname");
			let category = document.querySelector("#category");
			let memo = document.querySelector("#memo");
			
			let params = {
				"lat" : lat,
				"lng" : lng,
				"rowaddress" : rowaddress,
				"address" : address,
				"adrName" : addressname.value,
				"category" : category.value,
				"memo" : memo.value
			};

			$.ajax({
				type : "POST",
				url : "/treeMap/favorites",
				data : params,
				dataType : 'json',
				success : function(res) {
					console.log("성공")
				}
			});
			$('#myModal').hide();
		}

		function closeModal() {
			document.querySelector('#myModal').style = "display:none";
		}
		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
	</script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		//searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.querySelector('.mapSearch');
			keyword = keyword.value;
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			//removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			//listEl.appendChild(fragment);
			//menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
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
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		/*
		 function removeAllChildNods(el) {   
		 while (el.hasChildNodes()) {
		 el.removeChild (el.lastChild);
		 }
		 }*/
	</script>
</body>
</html>