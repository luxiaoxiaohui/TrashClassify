<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>垃圾识别</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css" />
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/bootstrap.js"></script>
<script src="<%=basePath%>js/layer/layer.js"></script>

<style type="text/css">
	.file {
	    position: relative;
	    display: inline-block;
	    background: #D0EEFF;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #1E88C7;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 20px;
	}
	.file input {
	    position: absolute;
	    font-size: 100px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	}
	.file:hover {
	    background: #AADFFD;
	    border-color: #78C3F3;
	    color: #004974;
	    text-decoration: none;
	}
</style>

</head>

<body>
	<!-- 垃圾分类查询 start -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="page-header" style="margin-bottom: 0px;">
					<h3>垃圾分类查询</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="form-group">
			<label class="control-label">垃圾名称：</label>
			<input type="text" id="kw" class="form-control" placeholder="请输入垃圾名称" style="width: 500px">
		</div>
		<div class="form-group">
			<button type="button" id="submit" class="btn btn-warning" >
				<i class="glyphicon glyphicon-search" ></i> 查询
			</button>
		</div>
		<div class="form-group">
			<div class="col-md-8  col-sm-10">
				<span class="result"><label class="control-label">垃圾名称：</label><b
					id="name" style="color: red"></b></span>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-8  col-sm-10">
				<span class="result"><label class="control-label">垃圾类型：</label><b
					id="category" style="color: red"></b></span>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-8  col-sm-10">
				<span class="result"><label class="control-label">建议：</label><b
					id="remark" style="color: red"></b></span>
			</div>
		</div>

	</div>
	<!-- 垃圾分类查询 end -->


	<!-- 图片识别 start -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="page-header" style="margin-bottom: 0px;">
					<h3>图片识别</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="form-group">
		<a href="javascript:;" class="file">&nbsp;&nbsp;上&nbsp;传&nbsp;图&nbsp;片&nbsp;&nbsp;
		    <input type="file" name="" id="img_upload">
		</a>
		<p id="img_area"></p>
		</div>
		<div class="form-group">
			<button type="button" id="img_submit" class="btn btn-warning">
				<i class="glyphicon glyphicon-search" ></i> 开始识别
			</button>
		</div>
		<div class="form-group">
			<div class="col-md-8  col-sm-10">
				<span class="result"><label class="control-label">垃圾名称：</label><b
					id="img_name" style="color: red"></b></span>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-8  col-sm-10">
				<span class="result"><label class="control-label">垃圾类型：</label>
				<b id="img_lajitype" style="color: red"></b></span>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-8  col-sm-10">
				<span class="result"><label class="control-label">建议：</label><b
					id="lajitip" style="color: red"></b></span>
			</div>
		</div>

	</div>
	<!-- 图片识别 end -->

	<!-- 垃圾分类查询 -->
	<script>
		$(document).ready(function() {
			$("#submit").click(function() {
				var kw = $("#kw").val();
				if(kw =="" || kw == null){
					alert0("输入不能为空！");
					return;
				}
				$.ajax({
					//请求方式
					type : "GET",
					//请求的媒体类型
					contentType : "application/json;charset=UTF-8",
					//请求地址
					url : "search?kw=" + kw,
					//数据，json字符串
					//data : JSON.stringify(list),
					//请求成功
					success : function(data) {
						//console.log(data);
						alert1("查询成功！");
						$("#name").html(data.name);
						$("#category").html(data.category);
						$("#remark").html(data.remark);
					},
					//请求失败，包含具体的错误信息
					error : function(e) {
						alert2("查询失败！");
						console.log(e.status);
						console.log(e.responseText);
					}
				});
			});
		});
		
		
		
	</script>


	<!-- 图片识别 -->
	<script>
		$(document).ready(function(){
		
			// 抓取上传图片，转换代码结果，显示图片的dom
			var img_upload = document.getElementById("img_upload");
			var base64_code;
			//var base64_code = document.getElementById("base64_code");
			var img_area = document.getElementById("img_area");
			
			// 添加功能出发监听事件
			img_upload.addEventListener('change', readFile, false);
		
			  $("#img_submit").click(function(){  
				$.post("http://api.tianapi.com/txapi/imglajifenlei/",
				{
				  key:"c25d6e467d034a226391f56838154944",
				  img:base64_code
				},
				function(data,status){
					console.log(data);  //向浏览器控制台写入返回数据
					//alert("天行数据状态码：" + data.code + "\n请求状态：" + status);
					if(data.code == 200){
						alert1("查询成功！");
						$("#img_name").html(data.newslist[0].name);
						
						$("#lajitip").html(data.newslist[0].lajitip);
						$("#img_lajitype").html(function() {
							if(data.newslist[0].lajitype == 0){
								return "可回收物";
							}
							if(data.newslist[0].lajitype == 1){
								return "有害垃圾";
							}
							if(data.newslist[0].lajitype == 2){
								return "湿垃圾";
							}
							if(data.newslist[0].lajitype == 3){
								return "干垃圾";
							}
						});
					} else {
						alert2("查询失败！");
					}
					
				});
			  });
		  
		  
				function readFile() {
					var file = this.files[0];//这里是抓取到上传的对象。
					if(!/image\/\w+/.test(file.type)) {
						alert("请确保文件为图像类型");
						return false;
					}
					reader = new FileReader();
					reader.readAsDataURL(file);
					reader.onload = function() {
						//base64_code.innerHTML = this.result;
						base64_code = this.result;
						//this.result里的这个result是FileReader.readAsDataURL()接口当中转换完图片输出的base64结果存放在result当中
						img_area.innerHTML = '<div>图片展示：</div><img src="' + this.result + '" alt=""/>';
					}
				}
				
		  
		});
		
		
		
		
</script>

<script type="text/javascript">

	 function alert0(msg) {
			layer.msg(msg, {
				icon : 0, 
				time : 2000
		});
	 }
			
	function alert1(msg) {
			layer.msg(msg, {
				icon : 1, 
				time : 2000
		});
	}
	function alert2(msg) {
			layer.msg(msg, {
				icon : 2, 
				time : 2000
		});
	}

</script>


</body>

</html>