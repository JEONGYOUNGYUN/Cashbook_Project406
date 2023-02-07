<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body p-0">
				<ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-bs-toggle="tab" href="#home1" role="tab" aria-selected="true">
							<span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
							<span class="d-none d-sm-block">일일</span>
						</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" data-bs-toggle="tab" href="#profile1" role="tab" aria-selected="false">
							<span class="d-block d-sm-none"><i class="far fa-user"></i></span>
							<span class="d-none d-sm-block">주별</span>
						</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" data-bs-toggle="tab" href="#messages1" role="tab" aria-selected="false">
							<span class="d-block d-sm-none">
								<i class="far fa-envelope"></i>
							</span>
							<span class="d-none d-sm-block">월별</span>
						</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" data-bs-toggle="tab" href="#settings1" role="tab" aria-selected="false">
							<span class="d-block d-sm-none">
								<i class="fas fa-cog"></i>
							</span>
							<span class="d-none d-sm-block">요약</span>
						</a>
					</li>
				</ul>

				<div class="tab-content p-0 text-muted">
					<div class="tab-pane active" id="home1" role="tabpanel">
						<!-- table div start -->
						<div class="table-responsive">
							<table class="table mb-0">
								<thead class="text-center">
									<tr>
										<th colspan="2">
											수입 <br/>
											<span class="text-primary">${totalIncome}</span>
										</th>
										<th colspan="2">
											지출 <br/>
											<span class="text-danger">${totalExpense}</span>
										</th>
										<th colspan="2">
											합계<br/>
											<span>${TOTAL_AMT}</span>
										</th>
									</tr>
									
									<tr>
										<th>
											<input type="checkbox" class="form-check-input" id="formrow-customCheck">
										</th>
										<th>날짜</th>
										<th>자산</th>
										<th>분류</th>
										<th>내용</th>
										<th>금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${cashBookList}" varStatus="status">
										<tr>
											<td class="text-center">
												<input type="checkbox" class="form-check-input" id="formrow-customCheck ${list.csboCd}">
											</td>
											<td class="text-center">${list.csboDt}</td>
											<td class="text-center">${list.cateNm}</td>
											<td class="text-center">${list.cbctNm}</td>
											<td>${list.csboCnt}</td>
											<td style="text-align: right">${list.csboAmt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- table div end -->
					</div>
					<!-- 일일 tab-pane end -->
					
					<div class="tab-pane" id="profile1" role="tabpanel">
						<p class="mb-0">Food truck fixie locavore, accusamus
							mcsweeney's marfa nulla single-origin coffee squid. Exercitation
							+1 labore velit, blog sartorial PBR leggings next level wes
							anderson artisan four loko farm-to-table craft beer twee. Qui
							photo booth letterpress, commodo enim craft beer mlkshk aliquip
							jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic,
							assumenda labore aesthetic magna delectus.</p>
					</div>
					
					<div class="tab-pane" id="messages1" role="tabpanel">
						<p class="mb-0">Etsy mixtape wayfarers, ethical wes anderson
							tofu before they sold out mcsweeney's organic lomo retro fanny
							pack lo-fi farm-to-table readymade. Messenger bag gentrify
							pitchfork tattooed craft beer, iphone skateboard locavore carles
							etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony.
							Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh
							mi whatever gluten-free carles.</p>
					</div>
					
					<div class="tab-pane" id="settings1" role="tabpanel">
						<p class="mb-0">Trust fund seitan letterpress, keytar raw
							denim keffiyeh etsy art party before they sold out master cleanse
							gluten-free squid scenester freegan cosby sweater. Fanny pack
							portland seitan DIY, art party locavore wolf cliche high life
							echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi
							before they sold out farm-to-table VHS viral locavore cosby
							sweater. Lomo wolf viral, mustache readymade keffiyeh craft.</p>
					</div>
				</div>
				<!-- custom tab-content div end -->
			</div>
			<!-- end card-body -->
		</div>
		<!-- end card -->
	</div>
	<!-- end col -->
</div>
<!-- end row -->