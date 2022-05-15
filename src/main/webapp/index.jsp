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
            <div class="col-sm-4 border rounded m-1 ml-4 pt-2">
                <div class="container">
                    
                    <form id="frmInterruptions" name="frmStudent">
                       
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
                        
                         <div class="form-group" align="right">
                             <input type="button" id="btnSave" value="Save" class="btn btn-info" />
                             <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
                             
                        </div>  
                        
                        
						
                    </form>      
                </div>     
            </div>
            
            <div class="col-sm-7 border rounded m-1">
            	<form id="frmFindInterruptions" name="frmStudent">
            	<div class="row ">
            	
            		<div class="col-2 t">
						<div id="alertErrorfind" class="alert alert-danger"></div>
					</div>
			 		<div class="col-4 bg-light rounded-left">
					 	<!-- Area ID -->
						<div class="input-group input-group-m mb-3 m-3">
							<div class="input-group-prepend">
					 			<span class="input-group-text" id="lblArea">Area ID: </span>
							</div>
							<input type="text" id="InterruptinAreafind" name="InterruptinAreafind">
						</div>
					</div>
					
				 	<div class="col-3 bg-light"> 
					 	<!-- Date -->
						<div class="input-group input-group-m mb-3 m-3">
							<div class="input-group-prepend">
					 			<span class="input-group-text" id="lblDatee">Date: </span>
							</div>
							<input type="date" id="InterruptionDatefind" name="InterruptionDatefind">
						</div>
					</div>
					
					<div class="col-3 bg-light rounded-right">
						<input type="button" id="btnfind" value="find" class="btn btn-primary m-3">
					</div>
					
				
				</div>
				</form>
                
                <div class="row" id="divItemsGrid">
                    
                </div>
            </div>
        </div>
		<div class="row d-flex justify-content-center">
						<div id="alertSuccess" class="alert alert-success"></div>
						<div id="alertError" class="alert alert-danger"></div>
			
		</div>






	
	

</body>
</html>
				
				
					
				
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
							