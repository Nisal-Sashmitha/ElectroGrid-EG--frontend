<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.css">
<script src="Components/jquery-3.6.0.js"></script>
<script src="Views/bootstrap.min.js"></script>
<script src="Views/bootstrap.bundle.min.js"></script>
<script src="Components/main.js"></script>

</head>
<body>
	<nav class="navbar navbar-dark bg-primary">
  		<h2 class="text-white">ElectroGrid</h2>
	</nav>
	<br/>
	<div class="row">
            <div class="col-sm-4">
                <div class="container">
                    
                    <form id="frmStudent" name="frmStudent">
                       
                        <div class="form-group" align="left">
                            <label>Area ID</label>
                            <input type="text" id="InterruptinArea" name="InterruptinArea" class="form-control" placeholder="Area ID" size="30px" required>
                        </div>
                        
                        <div class="form-group">
                            <label>Date of the interruption</label>
                            <input type="date" id="InterruptionDate" name="InterruptionDate" class="form-control" size="30px" required>
                        </div>
                        
                         <div class="form-group">
                            <label>Start Time</label>
                            <input type="time" id="InterruptionStartTime" name="InterruptionStartTime" class="form-control" size="30px" required>
                        </div>
                        
                        <div class="form-group">
                            <label>End Time</label>
                            <input type="time" id="InterruptionEndTime" name="InterruptionEndTime" class="form-control" placeholder="Fee" size="30px" required>
                        </div>
                        <div id="alertSuccess" class="alert alert-success"></div>
						<div id="alertError" class="alert alert-danger"></div>
                         <div class="form-group" align="right">
                             <input type="button" id="btnSave" value="Save" class="btn btn-info" />
                             <button type="button" class="btn btn-warning" id="reset" onclick="reSet()">Reset</button>
                        </div>  
                        
                        
						<>
                    </form>      
                </div>     
            </div>
            
            <div class="col-sm-8">
                
                <div class="panel-body">
                    <table id="tbl-student" class="table table-bordered" cellpadding="0" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>   
                        </thead>  
                    </table>  
                </div>
            </div>
        </div>







	<div class="container">
 		<div class="row">
 			<div class="col-12">
 				<h1 class="m-3">Student details</h1>
 					<form id="basicformInterruption">
 						<div class="container">
 							<div class="row">
 								<div class="col-4 bg-light rounded-left">
		 							<!-- Area ID -->
									<div class="input-group input-group-m mb-3 m-3">
										<div class="input-group-prepend">
		 									<span class="input-group-text" id="lblArea">Area ID: </span>
										</div>
										<input type="text" id="InterruptinArea" name="InterruptinArea">
									</div>
								</div>
								
	 							<div class="col-3 bg-light"> 
		 							<!-- Date -->
									<div class="input-group input-group-m mb-3 m-3">
										<div class="input-group-prepend">
		 									<span class="input-group-text" id="lblDatee">Date: </span>
										</div>
										<input type="date" id="InterruptionDate" name="InterruptionDate">
									</div>
								</div>
								
								<div class="col-2 bg-light rounded-right">
									<input type="button" id="btnfind" value="find" class="btn btn-primary m-3">
								</div>
								<div class="col-3 align-items-end" >
									<input type="button" id="btnAddnewinterruption" value="find" class="btn btn-primary m-3">
								</div>
							</div>
							<div class="row">
								<div class="col-12">
	 								<div id="alertSuccessfind" class="alert alert-success"></div>
	 							</div>
	 							<div class="col-12">
									<div id="alertErrorfind" class="alert alert-danger"></div>
								</div>	
							</div>
							
							
							
						</div>
						
 					</form>
 					<form id="formInterruption">
						
						<!-- Start time -->
						<div class="input-group input-group-m mb-3">
							<div class="input-group-prepend">
 								<span class="input-group-text" id="lblName">Start Time: </span>
							</div>
							<input type="time" id="InterruptionStartTime" name="InterruptionStartTime">
						</div>
						
						<!-- End time -->
						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
 								<span class="input-group-text" id="lblName">End Time: </span>
							</div>
							<input type="time" id="InterruptionEndTime" name="InterruptionEndTime">
						</div>
 						
 						<div id="alertSuccess" class="alert alert-success"></div>
						<div id="alertError" class="alert alert-danger"></div>
						<input type="button" id="btnSave" value="Save" class="btn btn-primary">
 					</form>
 					
 					
 			</div>	
 		</div>		

 			<br>
 		<div class="row">
 			<div class="col-12" id="colInterruption">

 			</div>
 		</div>
	</div>
	

</body>
</html>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
							