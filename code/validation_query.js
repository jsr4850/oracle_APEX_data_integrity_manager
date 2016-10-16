<script type="text/javascript"> 
	function set_validation_query() {		
        //alert(document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value);
        //alert($v("P14_CONSTRAINT_VALIDATION_QRY"));
		//if 	:P14_CONSTRAINT_VALIDATION_QRY is null
		if (document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value == "") {
			//then suggest a validation query
			var valQuery = "SELECT COUNT(*)\n" +
				"FROM " + document.getElementById("P14_OWNER").value + "." + document.getElementById("P14_TABLE_NAME").value + "\n" +
				"WHERE\n" +
				"   NOT( \n" +
				"   " + document.getElementById("P14_CONSTRAINT_CHECK_CONDITION").value + "\n" +
				"   )\n";
			document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value = valQuery.toUpperCase();
			//alert(document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value);
		}		
	}   
</script> 


<script type="text/javascript"> 
	function set_validation_query() {		
        //alert(document.getElementById("P14_CONSTRAINT_VALIDATION_QRY").value);
        //alert($v("P9_CONSTRAINT_VALIDATION_QRY"));
		//if 	:P9_CONSTRAINT_VALIDATION_QRY is null
		if (document.getElementById("P9_CONSTRAINT_VALIDATION_QRY").value == "") {
			//then suggest a validation query
			var valQuery = "SELECT COUNT(*)\n" +
				"FROM " + document.getElementById("P9_OWNER").value + "." + document.getElementById("P9_TABLE_NAME").value + "\n" +
				"WHERE\n" +
				"   NOT( \n" +
				"   " + document.getElementById("P9_CONSTRAINT_CHECK_CONDITION").value + "\n" +
				"   )\n";
			document.getElementById("P9_CONSTRAINT_VALIDATION_QRY").value = valQuery.toUpperCase();
			//alert(document.getElementById("P9_CONSTRAINT_VALIDATION_QRY").value);
		}		
	}   
</script> 

<script type="text/javascript"> 
	function set_validation_query() {		
        //alert(document.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value);
        //alert($v("P5_CONSTRAINT_VALIDATION_QRY"));
		//if 	:P5_CONSTRAINT_VALIDATION_QRY is null
		if (document.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value == "") {
			//then suggest a validation query
			var valQuery = "SELECT COUNT(*)\n" +
				"FROM (\n" + 
				"   SELECT ...\n" +
				"   FROM " + document.getElementById("P5_OWNER").value + "." + document.getElementById("P5_TABLE_NAME").value + "\n" +
				"   WHERE ...\n" +
				"   )\n";
			document.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value = valQuery.toUpperCase();
			//alert(document.getElementById("P5_CONSTRAINT_VALIDATION_QRY").value);
		}		
	}   
</script> 

<script type="text/javascript"> 
	function set_validation_query() {		
		// loop to construct the tables in the P6_ITREF_TABLE select list
		var p6_itreftables = document.getElementById("P6_ITREF_TABLE");
		var reftables = "";
		var i;
		for(i=0; i < p6_itreftables.length; i++) { 
			//alert("hello");
			// if table is selected
			if(p6_itreftables.options[i].selected == true) {
				//alert (p6_itreftables.options[i].value);
				reftables = reftables + " ," + document.getElementById("P6_OWNER").value + "." + p6_itreftables.options[i].value;
			}
		}	
		
		if (document.getElementById("P6_CONSTRAINT_VALIDATION_QRY").value == "") {
			//then suggest a validation query
			var valQuery = "SELECT COUNT(*)\n" +
				"FROM (\n" + 
				"   SELECT ...\n" +
				"   FROM " + 
					document.getElementById("P6_OWNER").value + "." + 
					document.getElementById("P6_TABLE_NAME").value 
					+ //" , " + 
					/*
					document.getElementById("P6_ITREF_OWNER").value + 
					"." + 
					document.getElementById("P6_ITREF_TABLE").value +
					*/
					reftables +
					"\n" +
				"   WHERE ...\n" +
				"   )\n";
			document.getElementById("P6_CONSTRAINT_VALIDATION_QRY").value = valQuery.toUpperCase();
			//alert(document.getElementById("P6_CONSTRAINT_VALIDATION_QRY").value);
		}		
/*		
		var p6_itreftables = document.getElementById("P6_ITREF_TABLE");
		alert(p6_itreftables.options[p6_itreftables.selectedIndex].selected );
		alert(p6_itreftables.length); 
		var i;
		for(i=0; i < p6_itreftables.length; i++) {
			//alert("hello");
			if(p6_itreftables.options[i].selected == true ) {
				alert (p6_itreftables.options[i].value);
			}
		}
*/		
	}   
</script> 