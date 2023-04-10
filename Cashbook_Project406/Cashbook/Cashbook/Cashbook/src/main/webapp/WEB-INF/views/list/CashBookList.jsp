<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
select option[value=""][disabled]{
	display:none;
}

.modal{
	width: 100%;
	height: 100%;
	left: 0;
	top: -100;
	bottom: 100;
	z-index: 999;
}
 .modal-backdrop {
    z-index: -1;
}
</style>

<script>
$(function(){
	// 검색 input date 오늘날짜로 기본 세팅
	document.getElementById('now_date').valueAsDate = new Date();
	
	// 지금 날짜를 밀리초로
	var now_utc = Date.now();
	
	// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	
	// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("now_date").setAttribute("max", today);
	
	//가계부 상세 내용 가져오기
	$(".tr").on("click", function(){
		$("input[type='checkbox'][name='account']").prop("checked", false);
		
		var DetailDate = $(this).find("td:eq(1)").text();
		var DetailGroup = $(this).find("td:eq(2)").text();
		var DetailAssets = $(this).find("td:eq(3)").text();
		var DetailContents = $(this).find("td:eq(4)").text();
		var DetailPrice = $(this).find("td:eq(5)").text();
		var csboCate = $(this).find("td:eq(6)").text();
		var csboCd = $(this).find("td:eq(7)").text();

		// 수입, 지출, 이체 체크
		if(csboCate == "수입"){
			$("input:checkbox[id='import']").prop("checked", true);
		}else if(csboCate = "지출"){
			$("input:checkbox[id='expense']").prop("checked", true);
		}else if(csboCate = "이체"){
			$("input:checkbox[id='withdrawal']").prop("checked", true);	
		}
		
		$("#DetailDate").val(DetailDate);
		$("#DetailAssets").val(DetailAssets);
		$("#DetailGroup").val(DetailGroup);
		$("#DetailContents").val(DetailContents);
		$("#DetailPrice").val(DetailPrice);
		$("#DetailcsboCd").val(csboCd);
		
	});
	
	//가계부 close 버튼 툴렀을 시 체크박스 해제
	$("#Close").on("click", function(){
		$("input:checkbox[id='check']").prop("checked", false);
	});
	
	//가게부 추가
	$("#Add").on("click", function(){
		$("input[type='checkbox'][name='account']").prop("checked", false);
		$("#DetailDate").val("");
		$("#DetailAssets").val("");
		$("#DetailGroup").val("");
		$("#DetailContents").val("");
		$("#DetailPrice").val("");
		$("#DetailcsboCd").val("");
	});
	
	// 수입, 지출, 이체 중복 체크 X
	$("input[type='checkbox'][name='account']").click(function(){
		if($(this).prop('checked')){
			$("input[type='checkbox'][name='account']").prop("checked", false);
			$(this).prop("checked", true);
		}
	}); 
	
	//가계부 삭제
	$("#delete").on("click", function(){
		var userCd = $("#userCd").val();
		var DetailcsboCd = $("#DetailcsboCd").val();
		
		if(DetailcsboCd == ''){
			alert("삭제할 내용이 없습니다.");
			return false;
		}
		
		let data = {
				csboCd:DetailcsboCd,
				userCd:userCd
		} 
		
		$.ajax({
			url: "/CashbookDelete",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			success:function(result){
				console.log("결과 : " + result );
				alert("삭제 완료됐습니다.");
			}
		})
				
	})
	
	//가계부 저장
	$("#save").on("click", function(){
		var DetailDate = $("#DetailDate").val();
		var DetailAssets = $("#DetailAssets").val();
		var DetailGroup = $("#DetailGroup").val();
		var DetailContents = $("#DetailContents").val();
		var DetailPrice = $("#DetailPrice").val();
		var account = '';
		var DetailcsboCd = $("#DetailcsboCd").val();
		var userCd = $("#userCd").val();
		
		if($("#import").is(":checked")){
			Account = 'CT000001'
		}else if($("#expense").is(":checked")){
			Account = 'CT000002'
		}else if($("#withdrawal").is(":checked")){
			Account = 'CT000003'
		}
		
		if(DetailAssets = '현금'){
			DetailAssets = 'CT000004'
		}else if(DetailAssets = '은행'){
			DetailAssets = 'CT000005'
		}else if(DetailAssets = '카드'){
			DetailAssets = 'CT000006'
		}
		
		if(DetailPrice == ''){
			alert("금액을 입력해 주세요");
			return false;
		}
		
		if(DetailcsboCd == ''){
			let data = {
					DetailGroup:DetailGroup,
					userCd:userCd
			} 
			
			$.ajax({
				url: "/GetDetailGroupCd",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				type:"post",
				success:function(result){
					console.log("결과 : " + result );
					var DetailGroupCd = result;
					let data = {
							csboDt:DetailDate,
							csboAst:DetailAssets,
							csboNm:DetailGroupCd,
							csboCnt:DetailContents,
							csboAmt:DetailPrice,
							csboCate:Account,
							userCd:userCd
					}
					
					$.ajax({
						url: "/CashbookSave",
						contentType:"application/json;charset=utf-8",
						data:JSON.stringify(data),
						type:"post",
						success:function(result){
							console.log("결과 : " + result );
							alert("가계부 저장 완료!");
						}
					})
						
				}
			})
		}else{
			let data = {
					DetailGroup:DetailGroup,
					userCd:userCd
			} 
			
			$.ajax({
				url: "/GetDetailGroupCd",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				type:"post",
				success:function(result){
					console.log("결과 : " + result );
					var DetailGroupCd = result;
					let data = {
							csboDt:DetailDate,
							csboAst:DetailAssets,
							csboNm:DetailGroupCd,
							csboCnt:DetailContents,
							csboAmt:DetailPrice,
							csboCate:Account,
							csboCd:DetailcsboCd,
							userCd:userCd
					}
					
					$.ajax({
						url: "/CashbookUpdate",
						contentType:"application/json;charset=utf-8",
						data:JSON.stringify(data),
						type:"post",
						success:function(result){
							console.log("결과 : " + result );
							alert("가계부 수정 완료!");
						}
					})
						
				}
			})
		}
	});
	
	// 요약 탭일 때
	$("#summary").on("click", function(){
		// 날짜  값 가져오기
		var date = $('#now_date').val();
		
		let data = {
			csboDt:date
		}
		
		$.ajax({
			url: "/selectSummary",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			success:function(result){
				var code = '';
	        	
	        	$.each(result, function(i, v) {
	        		code += '<tr>';
	        		code += '<td>' + v.astNm + '</td>';
	        		if(v.cateNm == '수입'){
		        		code += '<td><span class="text-primary">' + v.cateNm + '</span></td>';
	        		}else{
		        		code += '<td><span class="text-danger">' + v.cateNm + '</span></td>';
	        		}
	        		code += '<td>' + v.cateTotal + '</td>';
	        		code += '</tr>';
	        	});//end each
	        	
	        	$("#summaryTbody").html(code);
			}
		})
	});
	
	// 날짜의 변화가 있었을 때 검색 시작
	$("#now_date").on("change", function(){
		// 날짜  값 가져오기
		var date = $('#now_date').val();
		
		let data = {
			csboDt:date
		}
		
		$.ajax({
			url: "/selectbyDate",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			success:function(result){
				console.log("result :: " + result);
				
				if(result == null || result.length == 0){
					var text = '<tr>';
						text +='<td></td>';
						text +='<td></td>';
						text +='<td></td>';
						text +='<td class="text-center">조회된 결과값이 존재하지 않습니다</td>';
						text +='<td></td>';
						text +='<td></td>';
						text +='</tr>';
					
					$("#dayList").html(text);
					$("#totalIncome").text("0");
					$("#totalExpense").text("0");
					$("#totalAmt").text("0");
				}else{
					var code = '';
		        	
		        	$.each(result, function(i, v) {
		        		code += '<tr>';
		     			code += '<td class="text-center">';
		        		code += '<input type="checkbox" class="form-check-input" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" id="check">';
		     			code += '</td>';
		     			code += '<td class="text-center" id="date">'+ v.csboDt +'</td>';
		     			code += '<td class="text-center" id="group">' + v.csboNm + '</td>';
		     			code += '<td class="text-center" id="assets">'+ v.csboAst +'</td>';
		     			code += '<td id="contents" style="text-align: center;">'+ v.csboCnt +'</td>';
		     			code += '<td style="text-align: right" id="price">' + v.csboAmt + '</td>';
		     			code += '<td style="display: none;" id="csboCd">' + v.csboCate + '</td>';
		     			code += '<td style="display: none;" id="csboCd">' + v.csboCd + '</td>';
		        		code += '</tr>';
		        	});//end each
		        	
		        	$("#dayList").html(code);
		        	
		        	$.ajax({
						url: "/selectTotalbyDate",
						contentType:"application/json;charset=utf-8",
						data:JSON.stringify(data),
						type:"post",
						success:function(result){
							$("#totalIncome").text(result.totalIncome);
							$("#totalExpense").text(result.totalExpense);
							$("#totalAmt").text(result.totalAmt);
						}
					})
				}
			}
		});//end ajax
		
	});//end now_date function
})
</script>

<!-- 날짜 선택, 요약보기 버튼 row start -->
<div class="row mb-2">
	<div class="col-md-6"></div>

	<div class="col-md-6">
		<div
			class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
			<div>
				<input class="form-control" type="date" id="now_date">
			</div>

			<div>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#summaryModal" id="summary">
					<i class="fas fa-file-contract"></i>
				</button>
			</div>
		</div>
		<!-- d-flex div end -->
	</div>
	<!-- col-md-6 div end -->
</div>
<!-- 날짜 선택, 검색, 엑셀 다운 버튼 row end -->

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body p-0" id="selectCard">
				<!-- table div start -->
				<div class="table-responsive">
					<table class="table mb-0">
						<thead class="text-center">
							<tr>
								<th colspan="2">수입 <br /> <span class="text-primary" id="totalIncome">${totalIncome}</span>
								</th>
								<th colspan="2">지출 <br /> <span class="text-danger" id="totalExpense">${totalExpense}</span>
								</th>
								<th colspan="2">합계<br /> <span id="totalAmt">${TOTAL_AMT}</span>
								</th>
							</tr>

							<tr>
								<th><input type="checkbox" class="form-check-input"
									id="formrow-customCheck"></th>
								<th>날짜</th>
								<th>분류</th>
								<th>자산</th>
								<th>내용</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody id="dayList">
							<c:if test="${cashBookList.size() == 0}">
								<tr>
									<td colspan="6" class="text-center">
										조회된 결과값이 존재하지 않습니다.
									</td>
								</tr>
							</c:if>
							
							<c:forEach var="list" items="${cashBookList}" varStatus="status">
								<tr class="tr">
									<td class="text-center">
										<input type="checkbox" class="form-check-input" data-bs-toggle="offcanvas"
										data-bs-target="#offcanvasRight"
										aria-controls="offcanvasRight" id="check">
									</td>
									<td class="text-center" id="date">${list.csboDt}</td>
									<td class="text-center" id="group">${list.csboNm}</td>
									<td class="text-center" id="assets">${list.csboAst}</td>
									<td id="contents" style="text-align: center;">${list.csboCnt}</td>
									<td style="text-align: right" id="price">${list.csboAmt}</td>
									<td style="display: none;" id="csboCd">${list.csboCate }</td>
									<td style="display: none;" id="csboCd">${list.csboCd }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- table div end -->
			</div>
			<!-- end card-body -->
		</div>
		<!-- end card -->
	</div>
	<!-- end col -->
</div>
<!-- end row -->

<!-- 가계부 추가 버튼 -->
	 <button type="button" class="btn btn-primary"
			 data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" style="float: right;" id="Add">+</button>

<!-- 추가, 수정 탭바 시작 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel" style="visibility: hidden;" aria-hidden="true">
	<div class="offcanvas-header">
	  <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close" id="Close"></button>
	</div>
	<div class="offcanvas-body">
	  <div class="card">
	        <div class="card-header">
	            <h4 class="card-title">가계부 정보</h4>
	        </div>
	        <div class="card-body">
	            <input type="checkbox" class="btn btn-soft-primary btn-sm w-47" name="account" id="import" value="CT000001">수입</input>
	       		&nbsp;
	            <input type="checkbox" class="btn btn-soft-primary btn-sm w-47" name="account" id="expense" value="CT000002">지출</input>
	            &nbsp;
	            <input type="checkbox" class="btn btn-soft-primary btn-sm w-47" name="account" id="withdrawal" value="CT000003">이체</input>
	            <input style="display: none;" id="DetailcsboCd"></input>
	            <input style="display: none;" id="userCd" value="${userCd }"></input>
	            <p></p>
	                
	            <div class="mb-3 row">
	                <label for="example-date-input" class="col-md-2 col-form-label">날짜</label>
	                <div class="col-md-10">
	                    <input class="form-control" type="date" id="DetailDate">
	                </div>
	            </div>
	            
	            <div class="mb-3 row">
	                <label for="example-number-input" class="col-md-2 col-form-label">금액</label>
	                <div class="col-md-10">
	                    <input class="form-control" id="DetailPrice">
	                </div>
	            </div>
	            
	            <div class="mb-3 row">
                   <label class="col-md-2 col-form-label">분류</label>
                   <div class="col-md-8">
	                   <select class="form-select" id="DetailGroup">
	                      <option value="" disabled="disabled" selected="selected">분류를 선택해주세요</option>
		                   <c:forEach var="list" items="${DetailGroup}" varStatus="status">
		                      <option>${list.cbctNm}</option>
		                    </c:forEach>
	                   </select>
	                   
                   </div>
                   <div class="col-md-2">
                   	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">+</button>
                   </div>
                </div>
               
                <div class="mb-3 row">
                   <label class="col-md-2 col-form-label">자산</label>
                   <div class="col-md-10">
                       <select class="form-select" id="DetailAssets">
                       	   <option value="" disabled="disabled" selected="selected">자산을 선택해주세요</option>
                           <option>현금</option>
                           <option>은행</option>
                           <option>카드</option>
                       </select>
                   </div>
                </div>
	
	            <div class="mb-3 row">
	                <label for="example-text-input" class="col-md-2 col-form-label">내용</label>
	                <div class="col-md-10">
	                    <input class="form-control" type="text" id="DetailContents">
	                </div>
	            </div>
	            
	            <div class="mb-3 row">
	            	 <button type="submit" class="btn btn-primary" id="save">저장</button>
	            </div>
	            <div class="mb-3 row">
	            	 <button type="submit" class="btn btn-primary" id="delete">삭제</button>
	            </div>
	        </div>
	    </div>
	</div>
</div>
<!-- 추가, 수정 탭바 끝 -->

<!-- Modal -->
<div class="modal" id="summaryModal" tabindex="-1" aria-labelledby="summaryModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="summaryModalLabel">요약</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body">
				<div class="table-responsive">
					<table class="table mb-0">
						<tbody id="summaryTbody">
							<tr>
								<td>현금</td>
								<td class="text-end">0원</td>
							</tr>
							<tr>
								<td>체크카드</td>
								<td class="text-end">0원</td>
							</tr>
							<tr>
								<td>신용카드</td>
								<td class="text-end">0원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- end table-responsive -->
			</div>
		</div>
	</div>
</div>
<!-- end modal -->