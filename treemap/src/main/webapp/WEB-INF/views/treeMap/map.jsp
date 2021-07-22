<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>트리맵</title>

<link href="../../../../resources/css/map.css" rel="stylesheet"
	type="text/css">
<link href="../../../../resources/css/searchKeyword.css"
	rel="stylesheet" type="text/css">
<link href="../../../../resources/css/modal.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<%@ include file="../include/mapNav.jsp"%>
	<div id="include">
		<%@ include file="../include/mapboard.jsp"%>
	</div>
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
				<label class="modalLabel">카테고리</label> <input class="modalInput"
					id="category" type="text" placeholder="예) 맛집, 쇼핑" />
			</div>
			<div class="modalBox">
				<label class="modalLabel">별칭</label><input class="modalInput"
					id="addressname" type="text" value="${mapBoardDetail.adrName}" />
			</div>
			<div class="modalBox">
				<label class="modalLabel">메모</label>
				<textarea class="modalmemo" id="memo">${mapBoardDetail.memo}</textarea>
			</div>
			<div class="modalBox">
				<label class="modalLabel">마커 선택</label>
				<div class="markerBtnDiv">
					<div class="markerBtnDiv2">
						<button class="markerBtn" id="food"
							onclick="markerSelect('food','../../../../resources/imgs/food.png')">
							<img style="width: 50px;"
								src="../../../../resources/imgs/food.png">
						</button>
						<button class="markerBtn" id="bank"
							onclick="markerSelect('bank','../../../../resources/imgs/bank.png')">
							<img style="width: 50px;"
								src="../../../../resources/imgs/bank.png">
						</button>
						<button class="markerBtn" id="hospital"
							onclick="markerSelect('hospital','../../../../resources/imgs/hospital.png')">
							<img style="width: 50px;"
								src="../../../../resources/imgs/hospital.png">
						</button>
					</div>
					<div class="markerBtnDiv2">
						<button class="markerBtn" id="mart"
							onclick="markerSelect('mart','../../../../resources/imgs/mart.png')">
							<img style="width: 50px;"
								src="../../../../resources/imgs/mart.png">
						</button>
						<button class="markerBtn" id="shopping"
							onclick="markerSelect('shopping','../../../../resources/imgs/shopping.png')">
							<img style="width: 50px;"
								src="../../../../resources/imgs/shopping.png">
						</button>
						<button class="markerBtn" id="home"
							onclick="markerSelect('home','../../../../resources/imgs/home.png')">
							<img style="width: 50px;"
								src="../../../../resources/imgs/home.png">
						</button>
					</div>
				</div>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=842543be7b015b65d49c7a92818f1397&libraries=services"></script>
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

		let iconUrl;
		let check = true;
		let icon = [];

		//수정 모달 오픈
		function modifyModel() {
			document.querySelector('#modifyModal').style = "display:block";
		}

		//수정
		function modifyFavorites(adrNo, catNo) {

			let addressname = document.querySelector('#Maddressname');
			let memo = document.querySelector('#Mmemo');
			let category = document.querySelector('#Mcategory');

			$.ajax({
				type : "POST",
				url : "/treeMap/modifyMapBoard",
				//dataType : 'json', 받아올 데이터 타입
				data : {
					'adrNo' : adrNo,
					'catNo' : catNo,
					'catName' : category.value,
					'adrName' : addressname.value,
					'memo' : memo.value,
					'iconUrl' : iconUrl
				},
				success : function(res) {
					reloadMapList();
					iconUrl = '';
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
			document.querySelector('#modifyModal').style = "display:none";
		}
		//삭제
		function deleteMapboard(adrNo, catNo) {
			if (confirm("정말 삭제하시겠습니까 ?")) {
				$.ajax({
					type : "POST",
					url : "/treeMap/deleteMapBoard",
					//dataType : 'json', 받아올 데이터 타입
					data : {
						'adrNo' : adrNo,
						'catNo' : catNo
					},
					success : function(res) {
						reloadMapList();
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
			}
		}

		//마커 선택
		function markerSelect(icons, url) {

			let marker = document.querySelector('#' + icons);

			//중복제거
			for (let i = 0; i < icon.length; i++) {
				if (icon[i] === icons) {
					icon.splice(i, 1);
				}
			}
			//배열에 더함
			icon.push(icons);

			if (icon.length > 1) {
				icon.pop();
				alert("한가지만 선택해주세요!");
			}

			if (icon[0] === icons) {
				if (check) {
					marker.style.backgroundColor = "rgb(200,200,200)";
					check = false;
					iconUrl = url;
				} else {
					marker.style.background = "rgb(230,230,230)";
					check = true;
					icon.pop();
					iconUrl = '';
				}
			}
			
		}
		//오픈 모달
		function openModal() {
			document.querySelector('#myModal').style = "display:block";
		}
		//즐겨찾기
		function setFavorites() {
			let addressname = document.querySelector("#addressname");
			let catName = document.querySelector("#category");
			let memo = document.querySelector("#memo");

			let params = {
				"lat" : lat,
				"lng" : lng,
				"rowaddress" : rowaddress,
				"address" : address,
				"adrName" : addressname.value,
				"catName" : catName.value,
				"memo" : memo.value,
				"iconUrl" : iconUrl
			};

			$.ajax({
				type : "POST",
				url : "/treeMap/favorites",
				//dataType : 'json', 받아올 데이터 타입
				data : params,
				success : function(res) {
					reloadMapList();
					iconUrl = '';
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

			$('#myModal').hide();
		}

		function reloadMapList() {
			$.ajax({
				type : "GET",
				url : "/treeMap/reloadBoard",
				dataType : 'html',
				success : function(res) {
					$('#include').html(res);
				}
			});
		}
		
		function closeModal() {
			document.querySelector('#myModal').style = "display:none";
			document.querySelector('#modifyModal').style = "display:none";
			iconUrl = '';
			icon = [];
			check = true;
		}

		function addrmarker(lat, lng, rowaddress, address, adrName, adrNo,
				catNo, iconUrl) {

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(lat, lng);

			var imageSrc = iconUrl, // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
			imageOption = {
				offset : new kakao.maps.Point(20, 43)
			}; // 마커이미지의 옵션입니다.	 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition,
				image : markerImage
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
			var content = '<div class="wrap">' + '    <div class="info">'
					+ '        <div class="title">' + adrName
					+ '        </div>' + '        <div class="body">'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">' + rowaddress
					+ '</div>' + '                <div class="jibun ellipsis">'
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

			$.ajax({
				type : 'GET',
				url : "/treeMap/mapBoardDetail",
				data : {
					'adrNo' : adrNo,
					'catNo' : catNo
				},
				success : function(res) {
					$('#include').html(res);
				}
			});
			/*
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
				overlay.setMap(null);
			}
			 */

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			//infowindow.open(map, marker);
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
													+ '</div>'
													: '';
											detailAddr += '<div class="jibun ellipsis"> 지번 주소 : '
													+ result[0].address.address_name
													+ '</div>';
											var content = '<div class="wrap" style="margin-left:0;left:-68px;top:-67px;">'
													+ '    <div class="info">'
													+ '        <div class="title">'
													+ '			<button type="button" class="favoritesBtn" onclick="openModal();">즐겨찾기 등록하기</button>'
													+ '			<img src="../../../../resources/imgs/위치.png" style="width:20px; float:right;margin-right:10px;margin-top:5px;"/>'
													+ '        </div>'
													+ '        <div class="body">'
													+ '            <div class="desc">'
													+ detailAddr
													+ '            </div>'
													+ '        </div>'
													+ '    </div>' + '</div>';

											// 마커를 클릭한 위치에 표시합니다 
											marker.setPosition(mouseEvent.latLng);
											marker.setMap(map);
											console.log(mouseEvent.latLng);

											// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
											infowindow.setContent(content);
											infowindow.open(map, marker);

											lat = mouseEvent.latLng.getLat();
											lng = mouseEvent.latLng.getLng();
											rowaddress = !!result[0].road_address ? result[0].road_address.address_name: '';
											address = result[0].address.address_name;

										}
									});
						});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

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
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });
			console.log(place);
			
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        //let content = '<div style="padding:5px;font-size:12px;">' +  + '</div>';
		        
		        var detailAddr = !!place.road_address ? '<div class="ellipsis">도로명주소 : '
						+ place.road_address_name
						+ '</div>'
						: '';
				detailAddr += '<div class="jibun ellipsis"> 지번 주소 : '
						+ place.address_name
						+ '</div>';
						
						//console.log(result[0].road_address.address_name);
						//console.log(result[0].address.address_name);
				
				var content = '<div class="wrap" style="margin-left:0;left:-68px;top:-67px;">'
						+ '    <div class="info">'
						+ '        <div class="title">'
						+ '			<button type="button" class="favoritesBtn" onclick="openModal();">'+place.place_name+' 즐겨찾기 등록하기</button>'
						+ '			<img src="../../../../resources/imgs/위치.png" style="width:20px; float:right;margin-right:10px;margin-top:5px;"/>'
						+ '        </div>'
						+ '        <div class="body">'
						+ '            <div class="desc">'
						+ detailAddr
						+ '            </div>'
						+ '        </div>'
						+ '    </div>' + '</div>';
						
						lat = place.y;
						lng =  place.x;
						rowaddress = !!place.road_address ? place.road_address_name: '';
						address = place.address_name;
				        
						infowindow.setContent(content);
				        infowindow.open(map, marker);
		    });
		}
		
	</script>
</body>
</html>