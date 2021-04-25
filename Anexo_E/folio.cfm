<!DOCTYPE html>
<cfoutput>
<html lang="es">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title></title>
	    <!-- CSS -->
	    <link href="/favicon.ico" rel="shortcut icon">
	    <link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
	    <!-- Respond.js soporte de media queries para Internet Explorer 8 -->
	    <!-- ie8.js EventTarget para cada nodo en Internet Explorer 8 -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	      <script src="https://cdnjs.cloudflare.com/ajax/libs/ie8/0.2.2/ie8.js"></script>
	    <![endif]-->
	</head>
  	<body>
    	<main class="page">
        	<div class="bottom-buffer"></div>
      		<div class="container">
  				<cfset Hoy = CreateODBCDateTime( Now())>          
    			<div class="row">
	  				<div class="col-md-8"><h2>Solicitud de modificaciones a los proyectos aprobados por el programa para el desarrollo de la industria de software (PROSOFT) y la innovaci&oacute;n</h2></div>
				</div> 
				<div class="row" ng-init="stage01 = true; section01 = true">
					<div class="col-sm-12">
						<ul class="wizard-steps">
							<li class="completed"><h5>Paso 1</h5><span>Generales</span></li>
							<li class="completed"><h5>Paso 2</h5><span>Entregables</span></li>
							<li class="completed"><h5>Paso 3</h5><span>Proveedor</span></li>
							<li class="completed"><h5>Paso 4</h5><span>Documentos entregables</span></li>
							<li><i class="glyphicon glyphicon-ok-circle"></i></li>
						</ul>
					</div>
				</div>
				<cfset Hoy = CreateODBCDateTime(Now())>
				<cfquery name="folio" datasource="etramites">
					select count(*) as total from folio_ae
				</cfquery>
				<cfset consecutivo=#folio.total#+1>
				<cfif #folio.total# lte 9>
					<cfset ceros='000000'>
				<cfelseif #folio.total# gte 10 and #folio.total# lte 99>
					<cfset ceros='00000'>
				<cfelseif #folio.total# gte 100 and #folio.total# lte 999>
					<cfset ceros='0000'>
				<cfelseif #folio.total# gte 1000 and #folio.total# lte 9999>
					<cfset ceros='000'>
				<cfelseif #folio.total# gte 10000 and #folio.total# lte 99999>
					<cfset ceros='00'>
				<cfelseif #folio.total# gte 100000 and #folio.total# lte 999999>
					<cfset ceros='0'>
				</cfif>
				<cfquery name="folio" datasource="etramites">
					insert into folio_ae( id_registroae, folio, fecha_registro)
					values('#url.id_user#','SE-FO-06-027-#ceros##consecutivo#', #hoy#)
				</cfquery>
				<CFQUERY name="registro" datasource="etramites">
					Select * from registro_ae
					WHERE registroae_id = #url.id_user#
				</CFQUERY>	
				<CFMAIL FROM="comunicados.prosoft@economia.gob.mx"		
					to="#registro.correo#"
					bcc="dalia.mendoza@economia.gob.mx;  dgisci.sharon@economia.gob.mx, comunicados.prosoft@economia.gob.mx; archivos.prosoft@economia.gob.mx; raul.torrescano@economia.gob.mx; veronica.gutierrez@economia.gob.mx"
					server="mail.economia.gob.mx"
					port="25"
					SUBJECT="Registro de Reporte de avance y/o final del apoyo del programa para el desarrollo de la industria de software (PROSOFT) y la innovaci&oacute;n"
					type="text/HTML">
					<body bgcolor="##F3F3F3">
						<section>
	          				<div class="row"></div>
	          				<div class="row">
	          					<div class="col-sm-2"></div>
	          					<div class="col-sm-8">
	          						<div class="row" bgcolor="##621132">
	                                             <img src = "http://www.desi.economia.gob.mx/Padce/images/gob.jpg" height="76">
	                                        </div>
	          						<div class="col-sm-1"></div>
	          						<div class="col-sm-5">
	          							<h3>Estimado Usuario:</h3>
	          							<p style="font-family:Arial; font-size:16px">El folio de seguimiento <strong>SE-FO-06-027-#ceros##consecutivo#</strong> se envi&oacute; correctamente</p>	          							
	          						</div>
	          						<div class="col-sm-1"></div>
	          						<div class="row" bgcolor="##621132">
	          							<img src = "http://www.desi.economia.gob.mx/Padce/images/gob_bn.jpg" height="76">
	          						</div>
	          					</div>
	          					<div class="col-sm-2"></div>
	          				</div>
	          			</section>	
	          			<script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
					</body>
				</CFMAIL>
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-success">
							<cfoutput><p>El folio de seguimiento <strong>SE-FO-06-027-#ceros##consecutivo#</strong> se envi&oacute; correctamente</p></cfoutput>
							<a class="btn btn-primary" href="index.cfm">Aceptar</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sd-12"><hr></div>
				</div>				
            </div>
      	</main>
      	<!-- JS -->
      	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	      <script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	      <script src="https://framework-gb.cdn.gob.mx/assets/scripts/jquery-ui-datepicker.js"></script>
	      <script src="js/validator.js"></script>
	      <script type="text/javascript">
			      $gmx(document).ready(function(){
			        $.datepicker.regional.es = {
			          closeText: 'Cerrar',
			          prevText: 'Ant',
			          nextText: 'Sig',
			          currentText: 'Hoy',
			          monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
			          monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
			          dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
			          dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
			          dayNamesMin: ['Dom','Lun','Mar','Mie','Jue','Vie','S&aacute;b'],
			          weekHeader: 'Sm',
			          dateFormat: 'dd/mm/yy',
			          firstDay: 1,
			          isRTL: false,
			          showMonthAfterYear: false,
			          yearSuffix: ''};
			        $.datepicker.setDefaults($.datepicker.regional.es);
			        $( "##calendar1" ).datepicker();
			        $( "##calendar2" ).datepicker();
			        $( "##calendar3" ).datepicker();
			        $('[data-toggle="tooltip"]').tooltip();
		
			        $('form').validator().off('focusout.bs.validator').off('input.bs.validator');
			        
			        validaCheckbox = function(){
			            var check1 = document.getElementById("radio1");
			            if(!check1.checked){
			              return;
			            }else if( $('div.checkbox-group.required :checkbox:checked').length >0){
			              $('input:checkbox').prop("required", "");
			            }else{
			              $('div.checkbox-group.required :checkbox').each(function(){
			                  $(this).prop("required", "required");
			              });
			            }
			            
			          };
			        
		
			      });
			</script>
  	</body>
  </html>
  </cfoutput>