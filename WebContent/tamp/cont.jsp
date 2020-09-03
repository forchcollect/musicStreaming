<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/chart.css" />
<%@ include file="../chartNav/chartNav.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Twoplj</title>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=frm_cont]').submit(function() {
			if ($('#message').val() == '') {
				alert('문의글을 입력하세요');
				$('#message').focus();
				event.preventDefault();

			} else if ($('#id').val().length < 1) {
				alert('ID를 입력하세요');
				$('#id').focus();
				event.preventDefault();
			} else if (!$('#subject').val()) {
				alert('제목을 입력하세요');
				$('#subject').focus();
				event.preventDefault();
			}

		});
	});
</script>


<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
</head>
<style type="text/css">
.for {
	margin: 0 auto;
	margin-left: 50%;
}
</style>
<div class="for">
	<body>
		<!-- bradcam_area  -->
		<div class="bradcam_area breadcam_bg_2">
			<div class="container">

				<div class="row">
					<div class="col-xl-12">
						<div class="bradcam_text text-center">
							<h3>contact</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ bradcam_area  -->
		<!-- ================ contact section start ================= -->
		<section class="contact-section section_padding">
			<div class="container">
				<div class="d-none d-sm-block mb-5 pb-4">



					<div class="row">
						<div class="col-12">
							<h2 class="contact-title">개인 문의</h2>
						</div>
						<div class="col-lg-8">
							<form name="frm_cont" class="form-contact contact_form"
								action="write_ok.jsp" method="post" id="contactForm"
								novalidate="novalidate">
								<div class="row">
									<div class="col-12">
										<div class="form-group">

											<textarea class="form-control w-100" name="message"
												id="message" cols="30" rows="9"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Enter Message'"
												placeholder='Enter Message'></textarea>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<input class="form-control" name="id" id="id" type="text"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Enter your ID'"
												placeholder='Enter your ID'>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<input class="form-control" name="pwd" id="pwd"
												type="password" onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Enter your password'	"
												placeholder='Enter your password'>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<input class="form-control" name="subject" id="subject"
												type="text" onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Enter Subject'"
												placeholder='Enter Subject'>
										</div>
									</div>
								</div>
								<div class="form-group mt-3">
									<button type="submit"
										class="button button-contactForm btn_4 boxed-btn"
										id="bt_submit">문의등록</button>
									<a href="list.jsp" class="genric-btn danger radius"
										id="bt_gotohome">홈으로</a>
								</div>
							</form>
						</div>
						<div class="col-lg-4">
							<div class="media contact-info">
								<span class="contact-info__icon"><i class="ti-home"></i></span>
								<div class="media-body">
									<h3>서울특별시 강남구 ,</h3>
									<p>테헤란로 124 (역삼동, 삼원타워 ) 4F</p>
								</div>
							</div>
							<div class="media contact-info">
								<span class="contact-info__icon"><i class="ti-tablet"></i></span>
								<div class="media-body">
									<h3>+86 (000) 123 1234</h3>
									<p>Mon to Fri 10am to 7pm</p>
								</div>
							</div>
							<div class="media contact-info">
								<span class="contact-info__icon"><i class="ti-email"></i></span>
								<div class="media-body">
									<h3>help1 @ wearetplj.com</h3>
									<p>Send us your query anytime!</p>
								</div>

								<div class="media contact-info" style="margin-left: 15px;">
									<span class="contact-info__icon"><i class="ti-email"></i></span>
									<div class="media-body">
										<h3>help2 @ wearetplj.com</h3>
										<p>
											Send us your<br> query <br>anytime!
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</body>
</div>