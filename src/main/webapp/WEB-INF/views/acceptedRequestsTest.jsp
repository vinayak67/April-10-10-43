<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Doctor | Appointments</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
  </head>
  <body>

   <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Doctor</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.servletContext.contextPath}/doctor/doctorhome">Dashboard</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/doctor/viewDoctorRequests">Requests</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/service/listServicesDoctor">Medical Services</a></li>
            <li class="active"><a href="${pageContext.servletContext.contextPath}/doctor/viewAcceptedRequests">Appointments</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/doctor/viewReports">Reports
            </a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Welcome ${username}</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/logout">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Appointments   <small>Manage Appointments</small></h1>
          </div>
          <div class="col-md-2">
            <div class="dropdown create">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Create Content
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a type="button" data-toggle="modal" data-target="#addPage">Add Page</a></li>
                <li><a href="#">Add Post</a></li>
                <li><a href="#">Add User</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>

    <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="${pageContext.servletContext.contextPath}/doctor/doctorhome">Dashboard</a></li>
          <li class="active">Appointments</li>
        </ol>
      </div>
    </section>

    <section id="main">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="list-group">
             <a href="${pageContext.servletContext.contextPath}/doctor/doctorhome" class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
              </a>

              <a href="${pageContext.servletContext.contextPath}/doctor/viewDoctorRequests" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Requests <span class="badge">12</span></a>

              <a href="${pageContext.servletContext.contextPath}/service/listServicesDoctor" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Medical Services <span class="badge">33</span></a>

              <a href="${pageContext.servletContext.contextPath}/doctor/viewAcceptedRequests" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Appointments <span class="badge">203</span></a>

              <a href="${pageContext.servletContext.contextPath}/doctor/viewReports" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Reports <span class="badge">203</span></a>
            </div>

            <div class="well">
              <h4>Disk Space Used</h4>
              <div class="progress">
                  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                      60%
              </div>
            </div>
            <h4>Bandwidth Used </h4>
            <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                    40%
            </div>
          </div>
            </div>
          </div>
          <div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Pages</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                      <div class="col-md-12">
                          <input class="form-control" type="text" placeholder="Filter Pages...">
                      </div>
                </div>
                <br>
                <table class="table table-striped table-hover">
                      <tr>
                        <th>Customer ID</th>
                        <th>Date</th>
                        <th>Medicare Service ID</th>
                        <th>Status</th>
                        <th>Update Report</th>
                      </tr>

                      <c:forEach var ="temp" items = "${requests}">
<%--                           <c:url var = "viewLink" value="/request/updateResult"> --%>
<%--                           <c:param name="serviceId" value="${tempservice.medicare_service_id}"></c:param> --%>
<%--                           </c:url>  --%>
                           <c:url var = "updateLink" value="/request/updateResult">
                          <c:param name="id" value="${temp.id}"></c:param>
                          </c:url>

                      <tr>
                        <td>${temp.cid}</td>
                        <td>${temp.date}</td>
                        <td>${temp.serviceID}</td>
                        <td>${temp.status}</td>
<%--                         <td><a class="btn btn-default" href="${viewLink}" data-toggle="modal" data-target="#addPage">View</a></td> --%>
                        <td><a class="btn btn-danger" href="${updateLink}" data-toggle="modal" data-target="#UpdateReports">Update</a></td>
                      </tr>
                      </c:forEach>
                    </table>
              </div>
              </div>

          </div>
        </div>
      </div>
    </section>

    <footer id="footer">
      <p>About US!!</p>
    </footer>

<!--     Modals -->

<!--     Add Page -->
    <div class="modal fade" id="UpdateReports" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Report Update</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>ID</label>
          <input type="text" class="form-control" placeholder="ID" value="${result.id}" name="id" required type="hidden">
        </div>
         <input id=customerId type="hidden" value="${result.cid}" name="cid" required> 
    
    <input id=doctorId type="hidden" value="${result.did}" name="did" required> 
    
    <input id=serviceId type="hidden" value="${result.serviceID}" name="serviceID" required> 
    
 	<input id=resultDateId type="hidden" value="${result.result_date}" name="result_date" required>
 	
 	<input id=statusId type="hidden" value="${result.status}" name="status" required>
 	
 	<input id=serviceDateId type="hidden" value="${result.date}" name="service_date" required>
        <div class="form-group">
          <label>Diag 1 Actual Value</label>
          <input type="text" class="form-control" placeholder="Enter D1 Actual Value" value="${result.d1_actual}" name="d1_actual"  required >
        </div>
       <div class="form-group">
          <label>Diag 1 Normal Range</label>
          <input type="text" class="form-control" placeholder="Enter D1 Normal Range" value="${result.d1_normal}" name="d1_normal"  required >
        </div>
        <div class="form-group">
          <label>Diag 2 Actual Value</label>
          <input type="text" class="form-control" placeholder="Enter D2 Actual Value" value="${result.d2_actual}" name="d2_actual"  required >
        </div>
        <div class="form-group">
          <label>Diag 2 Normal Range</label>
          <input type="text" class="form-control" placeholder="Enter D2 Normal Range" value="${result.d2_normal}" name="d2_normal"  required>
        </div>
        <div class="form-group">
          <label>Comments</label>
          <input type="text" class="form-control" placeholder="Enter Comments" value="${doctor.comment}" name="comment"  required>
        </div>
        <div class="form-group">
          <label>Other Info.</label>
          <input type="text" class="form-control"  placeholder="Enter Any other information" value="${doctor.other_info}" name="other_info"  required  >
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save Report</button>
      </div>
    </form>
    </div>
  </div>
</div>



 <div class="modal fade" id="#addPage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Service Description</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>Shivam</label>
          <input type="text" class="form-control" placeholder="ID" value="${Description.medicare_service_id}">
        </div>
        <div class="form-group">
          <label>Medicare Service</label>
          <input type="text" class="form-control" placeholder="Service Name" value="${Description.medicare_service}">
        </div>
       <div class="form-group">
          <label>Medicare Service</label>
          <input type="text" class="form-control" placeholder="Service Name" value="${Description.medicare_service}">
        </div>
        <div class="form-group">
          <label>Medicare Service Description</label>
          <textarea name="message" rows="5" cols="40" class="form-control" required readonly>${Description.service_description}</textarea>
        </div>
        <div class="form-group">
          <label>Amount</label>
          <input type="text" class="form-control" placeholder="INR" value="${Description.amount}">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </form>
    </div>
  </div>
</div>



  <script>
     CKEDITOR.replace( 'editor1' );
 </script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
