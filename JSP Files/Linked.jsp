<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
	<title>Link</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">	
	<%-- <link rel="stylesheet" href="https://bootswatch.com/paper/bootstrap.min.css"> --%>
</head>
<body>
<div class="container">

	<!-- Page Header -->
	<div class="page-header">
		<h2>
		Clone Reddit
		</h2>
	</div>

	<form action="AddLink" method="post">
		<div class="row">
			<div class="col-xs-9 col-sm-10">
		<div class="form-group">	    
	   		 <input type="text"  class="form-control" id="title" name="title" placeholder="Enter Title">
	    	 <input type="text"  class="form-control" id="url" name="url" placeholder="Enter URL">
	  </div>	
				<c:if test="${not empty error}">
					<center><p class="well-sm bg-danger">${error}</p></center>
				</c:if>
			</div>
			<div class="col-xs-3 col-sm-2">
				<button type="submit" class="btn btn-success btn-block">Add Link</button>
			</div>
		</div>
	</form>
	
<c:if test="${not empty items}">
	<table class="table table-hover table-striped table-bordered">
		<thead>
			<tr>
				
				<th>Point</th>
				<th>Title</th>
				<th>URL</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${items}" var="item">
				<tr>
					<td>
					${item.point}
					</td>
					<td>
					${item.title}
					</td>					
					<td>
					<div class="link"><span>
					<a href="${item.url}" target="_blank">${item.url}</a>
					</span>
					</div>
					</td>
					<td>
								<a class="btn btn-warning btn-xs" href="Upvote?id=${item.id}">Upvote</a>
								<%--<a class="btn btn-primary btn-xs" href="${updateUrl}">Update</a>--%>

								<a class="btn btn-danger btn-xs" href="Downvote?id=${item.id}">Downvote</a>
								<%--<a class="btn btn-danger btn-xs" href="${deleteItemUrl}">Delete</a>--%>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>

</div>
	<p></p>
</body>
</html>