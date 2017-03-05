<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
	<title>Todo</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">	
	<%-- <link rel="stylesheet" href="https://bootswatch.com/paper/bootstrap.min.css"> --%>
</head>
<body>
<div class="container">

	<!-- Page Header -->
	<div class="page-header">
		<h2>
		Link's
		</h2>
	</div>

	<form action="ListController" method="post">
		<div class="row">
			<div class="col-xs-9 col-sm-10">
		<div class="form-group">	    
	   		 <input type="text"  class="form-control" id="title" name="title" placeholder="Enter Title">
	    	 <input type="text"  class="form-control" id="url" name="url" placeholder="Enter Url">
	   		
	  </div>	
				<c:if test="${not empty error}">
					<center><p class="well-sm bg-danger">${error}</p></center>
				</c:if>
			</div>
			<div class="col-xs-3 col-sm-2">
				<button type="submit" class="btn btn-success btn-block">Add Linked</button>
			</div>
		</div>
	</form>
	<c:if test="${empty link}">
	<div> 
		<center><h1>Uh-Oh!</h1><small>Unfortunatly no item's in the store</small></center>
	</div>
	</c:if>
	
<c:if test="${not empty linkeList}">
	<table class="table table-hover table-striped table-bordered">
		<thead>
			<tr>
				<th><span id="total">${fn:length(link)}</span> </th>
				<th>Title</th>
				<th>Link</th>
				<th>UpVote</th>
				<th>DownVote</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${linkedList}" var="item">
				<tr>
					<td>
					${item.id}
					</td>					
					<td>
					${item.title}
					</td>
					<td>
								<a class="btn btn-warning btn-xs" href="UpvoteController?id=${linked.id}">Up Vote</a>

								<a class="btn btn-danger btn-xs" href="DeleteItem?id=${linked.id}">Down Vote</a>
								<
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>

</div>

</body>
</html>