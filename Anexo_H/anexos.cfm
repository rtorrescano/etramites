<!DOCTYPE html>
<cfoutput>
<cfquery name="consulta" datasource="etramites">
	select * from anexos
	where id_registro = #url.id_user#
</cfquery>
<cfif consulta.recordcount gt 0>
	<cfset archivo1='#consulta.avance_entregables#'>
	<cfset archivo2='#consulta.indicadores_impacto#'>
	<cfset archivo3='#consulta.comprobantes_egresos#'>
	<cfset archivo4='#consulta.formato#'>
	<cfset boton=1>
<cfelse>
	<cfset archivo1=''>
	<cfset archivo2=''>
	<cfset archivo3=''>
	<cfset archivo4=''>
	<cfset boton=''>
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
	  				<div class="col-md-8"><h2>Reporte de avance y/o final del apoyo del programa para el desarrollo de la industria de software (PROSOFT) y la innovaci&oacute;n</h2></div>
				</div> 
				<div class="row" ng-init="stage01 = true; section01 = true">
					<div class="col-sm-12">
						<ul class="wizard-steps">
							<li class="completed"><h5>Paso 1</h5><span>Generales</span></li>
							<li class="completed"><h5>Paso 2</h5><span>Entregables</span></li>
							<li class="completed"><h5>Paso 3</h5><span>Total de inversi&oacute;n</span></li>
							<li><h5>Paso 4</h5><span>Documentos</span></li>
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
						<div class="alert alert-success" style="text-align: center">
							<a href="pdf.cfm?id_user=#url.id_user#">Clic aqu&iacute; para descargar el reporte</a>				
						</div>
					</div>
				</div>
				<div class="row">
			        <div class="col-sm-12">
              			<form name="registro" action="anexos_action.cfm" method="post" enctype="multipart/form-data" role="form">
              				<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h2>Anexo relaci&oacute;n descriptiva de entregables</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label">Avance de entregables<span class="form-text">*</span>:</label>
										<input class="form-control ng-scope" id="archivo1" name="archivo1" type="file" accept="application/pdf,application/zip" <cfif #consulta.avance_entregables# gt 0> <cfelse>required</cfif>>
										<div class="help-block with-errors"></div>
										<cfif #consulta.avance_entregables# gt 0>
                    						<a href="#consulta.ruta_documentos#/#consulta.avance_entregables#">Consulta documento adjunto aqu&iacute;</a>
                  						</cfif>
									</div>
								</div>	
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label">Avance de indicadores de impacto <span class="form-text">*</span>:</label>
										<input class="form-control ng-scope" id="archivo2" name="archivo2" type="file" accept="application/pdf,application/zip" <cfif #consulta.indicadores_impacto# gt 0> <cfelse>required</cfif>>
										<div class="help-block with-errors"></div>
										<cfif #consulta.indicadores_impacto# gt 0>
                    						<a href="#consulta.ruta_documentos#/#consulta.indicadores_impacto#">Consulta documento adjunto aqu&iacute;</a>
                  						</cfif>
									</div>
								</div>	
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label">Comprobante de egresos (l&iacute;quidos)<span class="form-text">*</span>:</label>
										<input class="form-control ng-scope" id="archivo3" name="archivo3" type="file" accept="application/pdf,application/zip" <cfif #consulta.comprobantes_egresos# gt 0> <cfelse>required</cfif>>
										<div class="help-block with-errors"></div>
										<cfif #consulta.comprobantes_egresos# gt 0>
                    						<a href="#consulta.ruta_documentos#/#consulta.comprobantes_egresos#">Consulta documento adjunto aqu&iacute;</a>
                  						</cfif>
									</div>
								</div>	
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label">Documento impreso  <span class="form-text">*</span>:</label>
										<input class="form-control ng-scope" id="archivo4" name="archivo4" type="file" accept="application/pdf,application/zip" <cfif #consulta.formato# gt 0> <cfelse>required</cfif>>
										<div class="help-block with-errors"></div>
										<cfif #consulta.formato# gt 0>
                    						<a href="#consulta.ruta_documentos#/#consulta.formato#">Consulta documento adjunto aqu&iacute;</a>
                  						</cfif>
									</div>
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
										<!---cfif boton eq 1--->
											<cfoutput><div class="col-sm-3"><a href="inversion.cfm?id_user=#url.id_user#" class="btn btn-default pull-right">Regresar</a></div></cfoutput>
											<div class="col-sm-9"><button class="btn btn-primary pull-right" type="submit" name="siguiente">Enviar reporte</button></div>
											<!---div class="col-sm-5"><a href="folio.cfm?id_user=#url.id_user#" class="btn btn-default pull-right">Enviar reporte</a></div>
										<cfelse>
											<cfoutput><div class="col-sm-3"><a href="inversion.cfm?id_user=#url.id_user#" class="btn btn-default pull-right">Regresar</a></div></cfoutput>
											<div class="col-sm-6"><button class="btn btn-primary pull-right" type="submit" name="siguiente">Siguiente</button></div>										
										</cfif--->
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