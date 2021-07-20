<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../../../resources/css/mapboardNav.css" rel="stylesheet"
	type="text/css">
<html>
<meta charset="UTF-8">
<body>
	<div id="boardNav" class="boardNav">
		<div class="category">
			<ul>
				<li>맛집</li>
				<li>쇼핑</li>
				<li>카테고리</li>
			</ul>
		</div>
		<div id="mapboardListBox" class="mapboardListBox">
			<div class="mapboardListSearch">
				<input class="boardSearch" placeholder="검색" />
			</div>
			<c:choose>
				<c:when test="${mapBoardDetail.detail}">
					<div class="boardDetailwapper">
						<div class="boardDetail">
							<div class="detailTitle">
								<h3 style="margin-left:10px;">${mapBoardDetail.adrName}</h3>
							</div>
							<div class="detailaddress">
								<div class="detailLabel">주소</div>
									<div style="font-size: 12px; margin-top:10px;">
										<p style="margin-bottom:5px;">지번 : ${mapBoardDetail.address}</p>
										<c:if test="${mapBoardDetail.rowaddress!=null }">
											<p>도로명 : ${mapBoardDetail.rowaddress}</p>
										</c:if>
								</div>
							</div>

							<div class="date">
								<div class="detailLabel">작성일</div>
								<div style="font-size: 12px; margin-top:10px;">${mapBoardDetail.createdAt}</div>
							</div>
							<div class="memoBox">
								<div class="detailLabel">메모일</div>
								<textarea class="memo" disabled>${mapBoardDetail.memo} </textarea>
							</div>
							<div class="MapChange">
								<button type="button" onclick="modifyMapBoard()">수정</button>
								<button type="button" onclick="deleteMapboard()">삭제</button>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${mapBoardList}" var="list" varStatus="status">
						<div class="boardList">
							<button class="addrName"
								onclick="addrmarker(${list.lat},${list.lng},'${list.rowaddress}','${list.address}','${list.adrName}',${list.adrNo});">
								<span>${list.adrName}</span>
							</button>
							<p class="address">${list.address}</p>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>
		<div id="modifyModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modalTitle">
				<h3 style="color: darkslategray">즐겨찾기 등록</h3>
			</div>
			<div class="modalBox">
				<label class="modalLabel">카테고리</label>
				<input class="modalInput" id="category" type="text" placeholder="예) 맛집, 쇼핑" />
			</div>
			<div class="modalBox">
				<label class="modalLabel">별칭</label><input class="modalInput" id="addressname" type="text" value="${mapBoardDetail.adrName}" />
			</div>
			<div class="modalBox">
				<label class="modalLabel">메모</label><textarea class="modalmemo" id="memo">${mapBoardDetail.memo}</textarea>
			</div>
			<div class="modalBox">
				<label class="modalLabel">마커 선택하기</label> 
				<select class="makerSelect"><option><img src="../../../../resources/imgs/bank.png" /></option> </select>
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
</body>
<script type="text/javascript">
	function modifyMapBoard(){
		document.querySelector('#modifyModal').style = "display:block";
	}
	function deleteMapboard(){
		
	}
</script>
</html>