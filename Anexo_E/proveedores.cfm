<!DOCTYPE html>
<cfoutput>
	<cfif Isdefined("URL.id_user")> 
		<CFQUERY name="registro" datasource="etramites">
			Select * from proveedores
			WHERE id_registroae = #url.id_user#
		</CFQUERY>	
		<cfset np='#registro.nombre_proveedor#'>
		<cfset justi='#registro.justificacion#'>
		<cfset aclara='#registro.aclaracion#'>
		<cfset soli='#registro.solicitudes#'>		
	<cfelse>
		<cfset np=''>
		<cfset justi=''>
		<cfset aclara=''>
		<cfset soli=''>	
	</cfif>
	


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
							<li><h5>Paso 3</h5><span>Proveedor</span></li>
							<li><h5>Paso 4</h5><span>Documentos entregables</span></li>
							<li><i class="glyphicon glyphicon-ok-circle"></i></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="alert alert-info" style="text-align: left">
							Para continuar con el proceso deber&aacute;s:
							<ol>
								<li>Dar click en el bot&oacute;n "Siguiente"</li>
								<li>Descargar e imprimir el reporte de avance y/o final.</li>
								<li>Anexar el reporte de avance junto con la dem&aacute;s documentaci&oacute;n.</li>
								<li>La documentaci&oacute;n requerida solo ser&aacute; aceptada en formatos <strong>(.pdf)</strong> o bien <strong>(.zip)</strong></li>
							</ol>
						</div>
					</div>
				</div>
				<div class="row">
			        <div class="col-sm-12">
              			<form name="registro" action="proveedores_action.cfm" method="post" enctype="multipart/form-data" role="form">
              				<cfif Isdefined("URL.id_user")>
              					<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#id_user#">
              				<cfelse>
              					<input type="hidden" id="id_user" class="form-control"  name="id_user" value="0">
              				</cfif>
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h2>Proveedores</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">
			          			<div class="col-sm-8">
			              			<div class="form-group">
			              				<label for="secondName11">Nombre completo del proveedor <span class="form-text">*</span>:</label>
										<input type="text" id="denominacion" class="form-control"  name="denominacion" placeholder="Nombre completo del proveedor" value="#np#" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
			            	<div class="row">
			          			<div class="col-sm-8">
			              			<div class="form-group">
			              				<label for="secondName11">Justificaci&oacute;n del cambio <span class="form-text">*</span>:</label>
										<input type="text" id="justificacion" class="form-control"  name="justificacion" placeholder="Justificaci&oacute;n del cambio" value="#justi#" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
			            	<div class="row">			          					            		
			            		<div class="col-sm-8">
			            			<label class="control-label" for="calendario">Aclaraci&oacute;n, detallar justificaci&oacute;n y/o motivos de dicha(s) aclaraci&oacute;n(es) :</label>
			            			<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Escribe la aclaraci&oacute;n"></span>
			            			<textarea name="aclaracion" class="form-control" rows="3" cols="25">#aclara#</textarea>	                    			     					          
									<div class="help-block with-errors"></div>
	                  			</div>	
			            	</div>
			            	<div class="row">			          					            		
			            		<div class="col-sm-8">
			            			<label class="control-label" for="calendario">Otras solicitudes, detallar justificaci&oacute;n y/o motivos de dicha(s) solicitud(es) : </label>
			            			<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Escribe otras solicitudes"></span>
			            			<textarea name="solicitudes" class="form-control" rows="3" cols="25" required>#soli#</textarea>	                    			     					          
									<div class="help-block with-errors"></div>
	                  			</div>	
			            	</div>
			            	<div class="row">
								<div class="col-sd-12">
									<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-2d-12 bottom-buffer">
									<div class="pull-left text-muted text-vertical-align-button">* Campos obligatorios</div>
									<div class="pull-right">
										<cfoutput><div class="col-sm-3"><a href="entregables.cfm?id_user=#url.id_user#" class="btn btn-default pull-right">Regresar</a></div></cfoutput>
										<button class="btn btn-primary pull-right" type="submit" name="siguiente">Siguiente</button>										
									</div>
								</div>
							</div>
						</form>
					</div>
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
			        $( "##calendar4" ).datepicker();
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