<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
  <head><!--include-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"  rel="stylesheet" />
<link href="https://cdn.datatables.net/select/1.2.4/css/select.bootstrap4.min.css"  rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
	
				<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>			
			<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>		
			<script src="https://cdn.datatables.net/select/1.2.4/js/dataTables.select.min.js"></script>	
<link href="css/master.css" rel="stylesheet" />
    <title><%-- <tiles:getAsString name="title"/> --%></title>
    <tiles:insertAttribute name="header" />
  </head>
  <body>
          
          <tiles:insertAttribute name="body" />
			<div id="footer" align="center">
				  <hr>
					<small> &copy;Team4 Stockist &#169;
            2017<br />
            Contact
            25 Heng Mui Keng Terrace, 119615
            Singapore<br />
            Infolink:+65-162093<br />
            E-mail:  isstraining@nus.edu.sg
         </small> 
				</div>

  </body>
</html>