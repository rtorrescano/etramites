<!DOCTYPE html>
<cfoutput>
	<cfif Isdefined("URL.id_user")> 
		<CFQUERY name="registro" datasource="etramites">
			Select * from registro_ae
			WHERE registroae_id = #url.id_user#
		</CFQUERY>	
		<cfset rz='#registro.razon_social#'>
		<cfset nombre='#registro.nombre#'>
		<cfset ap_pat='#registro.ap_paterno#'>
		<cfset ap_mat='#registro.ap_materno#'>
		<cfset rfc='#registro.rfc#'>
		<cfset folio='#registro.folio_proyecto#'>
		<cfset fconvenio='#LSDateFormat(registro.fecha_convenio, "mm/dd/yyyy")#'>
		<cfset nombrep='#registro.nombre_proyecto#'>
		<cfset num_elec='#registro.numero_electronico#'>
		<cfset correo='#registro.correo#'>
		<cfset lada1='#registro.lada1#'>
		<cfset tf='#registro.telefono_fijo#'>
		<cfset lada2='#registro.lada2#'>
		<cfset tm='#registro.telefono_movil#'>
		<cfset ms='#registro.mod_sol#'>
		<cfset jus='#registro.justificacion#'>
		<cfset fcierre='#LSDateFormat(registro.fecha_cierre, "mm/dd/yyyy")#'>
		<cfset foriginal='#LSDateFormat(registro.fecha_original, "mm/dd/yyyy")#'>
		<cfset fpropuesta='#LSDateFormat(registro.fecha_propuesta, "mm/dd/yyyy")#'>
		<cfset np='#registro.num_prorrogas#'>
		<cfset finadic='#registro.finalidades_adicionales#'>
	<CFELSE>
		<cfset rz=''>
		<cfset nombre=''>
		<cfset ap_pat=''>
		<cfset ap_mat=''>
		<cfset rfc=''>
		<cfset folio=''>
		<cfset fconvenio=''>
		<cfset nombrep=''>
		<cfset num_elec=''>
		<cfset correo=''>
		<cfset lada1=''>
		<cfset tf=''>
		<cfset lada2=''>
		<cfset tm=''>
		<cfset ms=''>
		<cfset jus=''>
		<cfset fcierre=''>
		<cfset foriginal=''>
		<cfset fpropuesta=''>
		<cfset np=''>
		<cfset finadic=''>
	</CFIF>
	


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
							<li><h5>Paso 2</h5><span>Entregables</span></li>
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
              			<form name="registro" action="registro_action.cfm" method="post" enctype="multipart/form-data" role="form">
              				<cfif Isdefined("URL.id_user")>
              					<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#id_user#">
              				<cfelse>
              					<input type="hidden" id="id_user" class="form-control"  name="id_user" value="0">
              				</cfif>
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h2>Datos generales</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">
			          			<div class="col-sm-8">
			              			<div class="form-group">
			              				<label for="secondName11">Raz&oacute;n social <span class="form-text">*</span>:</label>
										<input type="text" id="denominacion" class="form-control"  name="denominacion" placeholder="Ingresa Denominaci&oacute;n o raz&oacute;n social" value="#rz#" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
			            	<div class="row">
			          			<div class="col-sm-12">Nombre de la persona representante legal o apoderado (a) legal:</div>
			          		</div>
							<div class="row"><br>
			          			<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Nombre(s) <span class="form-text">*</span>:</label>
										<input type="text" id="nombre" class="form-control"  name="nombre" placeholder="Ingresa los nombres" value="#nombre#" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Primer apellido <span class="form-text">*</span>:</label>
										<input type="text" id="paterno" class="form-control"  name="paterno" required value="#ap_pat#" placeholder="Ingresa el primer apellido">     					          
										<div class="help-block with-errors"></div>				   
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Segundo apellido <span class="form-text">*</span>:</label>
										<input type="text" id="materno" class="form-control"  name="materno" value="#ap_mat#" required placeholder="Ingresa el segundo apellido">     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
							<div class="row">
								<div class="col-sm-4">
			            			<label class="control-label" for="calendario">Fecha de firma del convenio de asignaci&oacute;n <span class="form-text">*</span>:</label>
	                    			<div class="form-group datepicker-group">	                      				
	                      				<input type="text" class="form-control datepicker" id="calendar1" value="#fconvenio#" placeholder="Ingresa fecha de firma del convenio" name="calendar1" required>
	                      				<div class="help-block with-errors"></div>
	                      				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                    			</div>
	                  			</div>		
								<div class="col-sm-4"><br>
			              			<div class="form-group">
			              				<label for="secondName11">Folio del proyecto <span class="form-text">*</span>:</label>
			              				<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Corresponde al número de tramite."></span>
										<input type="text" id="folio" class="form-control"  name="folio" value="#folio#" required placeholder="Folio asignado al tr&aacute;mite">     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            		<div class="col-sm-4"><br>
			              			<div class="form-group">
			              				<label for="secondName11">Nombre del proyecto <span class="form-text">*</span>:</label>
										<input type="text" id="proyecto" class="form-control"  name="proyecto" value="#nombrep#" placeholder="Ingresa el nombre del proyecto" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
							<div class="row">
								<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Registro Federal de Contribuyentes <span class="form-text">*</span>: </label> <span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="RFC"></span>
										<input type="text" id="rfc" class="form-control"  name="rfc" maxlength="13" value ="#RFC#"required placeholder="Ingresa el RFC">     					          
										<div class="help-block with-errors"></div>				   
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">N&uacute;mero de identificaci&oacute;n electr&oacute;nico (antes usuario) <span class="form-text">*</span>: <span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Corresponde al número que se utilizó para enviar la SA."></span></label>			              				
										<input type="text" id="num_id" class="form-control"  name="num_id" value="#num_elec#" required placeholder="Ingresa el n&uacute;mero de identificaci&oacute;n electr&oacute;nico">     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
							<div class="row">
			          			<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Correo electr&oacute;nico <span class="form-text">*</span>: <span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="El correo que capture será al cual se le envíen notificaciones para cualquier asunto relacionado con el proyecto."></span></label>
										<input type="text" id="correo" value="#correo#" class="form-control" pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$" name="correo" placeholder="ejemplo@dominio.com" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            		<div class="col-sm-1">
			              			<div class="form-group">
			              				<label for="secondName11">Lada <span class="form-text">*</span>:</label>
										<input type="text" id="lada" value="#lada1#" class="form-control" pattern="[0-9]{3}" name="lada" placeholder="Clave lada"	>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            		<div class="col-sm-3">
			              			<div class="form-group">
			              				<label for="secondName11">Tel&eacute;fono fijo <span class="form-text">*</span>:</label>
										<input type="text" id="fijo" value="#tf#" class="form-control" pattern="[0-9]{10}" name="fijo"required placeholder="N&uacute;mero fijo" required>     					          
										<div class="help-block with-errors"></div>				   
			              			</div>
			            		</div>
			            		<div class="col-sm-1">
			              			<div class="form-group">
			              				<label for="secondName11">Ext. <span class="form-text">*</span>:</label>
										<input type="text" id="ext" value="#lada2#" class="form-control" pattern="[0-9]{5}" name="ext" placeholder="Clave extensi&oacute;n">     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            		<div class="col-sm-3">
			              			<div class="form-group">
			              				<label for="secondName11">Tel&eacute;fono movil <span class="form-text">*</span>:</label>
										<input type="text" id="movil" value="#tm#" class="form-control" pattern="[0-9]{10}" name="movil"required placeholder="N&uacute;mero movil" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
							<div class="row">
								<div class="col-sm-12">
									<h2>Informaci&oacute;n del tr&aacute;mite</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">
			          			<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Modificaci&oacute;n solicitada <span class="form-text">*</span>:</label>
										<input type="text" id="modificacion" value="#ms#" name="modificacion" class="form-control" placeholder="Modificaci&oacute;n" required>     					          
										<div class="help-block with-errors"></div>				   
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Justificaci&oacute;n <span class="form-text">*</span>:</label>
										<input type="text" id="justi" value="#jus#" class="form-control" name="justi"required placeholder="Justificaci&oacute;n" required>     					          
										<div class="help-block with-errors"></div>				   
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			            			<label class="control-label" for="calendario">Fecha del cierre (pr&oacute;rroga) <span class="form-text">*</span>:</label>	                    			
	                    			<div class="form-group datepicker-group">	                      				
	                      				<input type="text" class="form-control datepicker" id="calendar2" placeholder="Fecha de cierre" name="calendar2" required value="#fcierre#">
	                      				<div class="help-block with-errors"></div>
	                      				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                    			</div>
	                  			</div>
	                  		</div>
	                  		<div class="row">			            		
			            		<div class="col-sm-4">
			            			<label class="control-label" for="calendario">Fecha original <span class="form-text">*</span>:</label>	                    			
			            			<div class="form-group datepicker-group">	                      				
	                      				<input type="text" class="form-control datepicker" id="calendar3" placeholder="Fecha original" name="calendar3" required value="#foriginal#">
	                      				<div class="help-block with-errors"></div>
	                      				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                    			</div>
	                  			</div>	
			            		<div class="col-sm-4">
			            			<label class="control-label" for="calendario">Fecha propuesta para cierre <span class="form-text">*</span>:</label>
	                    			
	                    			<div class="form-group datepicker-group">	                      				
	                      				<input type="text" class="form-control datepicker" id="calendar4" placeholder="Fecha propuesta" name="calendar4" required value="#fpropuesta#">
	                      				<div class="help-block with-errors"></div>
	                      				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                    			</div>
	                  			</div>			            		
			            		<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">N&uacute;mero de pr&oacute;rrogas recibidas <span class="form-text">*</span>:</label>
										<input type="text" id="npro" value="#np#" class="form-control"  name="npro"required placeholder="N&uacute;mero de pr&oacute;rrogas" required>     					          
										<div class="help-block with-errors"></div>				   
			              			</div>
			            		</div>
			            	</div>			            	
							<div class="row">
								<div class="col-md-12">
									<h2>Finalidades adicionales al tratamiento de tus datos personales</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<p style="text-align: justify">De conformidad con el aviso de privacidad de la Secretar&iacute;a de Econom&iacute;a:</p>
									<p style="text-align: justify">De manera adicional, los datos personales que se recaben, podr&aacute;n ser utilizados en actividades complementarias necesarias para la realizaci&oacute;n de las finalidades que se se&ntilde;alan; el tratamiento de datos personales ser&aacute; el que resulte necesario, adecuado y relevante en relaci&oacute;n con las finalidades previstas en este Aviso de Privacidad, as&iacute; como con los fines distintos que resulten compatibles o complementarios relacionados con los tr&aacute;mites o servicios que se proporcionan.</p>
									<p style="text-align: justify">Si no deseas que tus datos personales se utilicen para estas finalidades adicionales, al momento de tu registro deber&aacute;s manifestar tu voluntad en sentido contrario. Esto no ser&aacute; motivo ni condicionante para resolver sobre el tr&aacute;mite o servicio que se est&aacute; solicitando.</p>
								</div>
								<div class="col-md-4">
									<div class="form-group radio-group">
										<label for="radioAceptoCompartirDatos" class="radio-inline"><input type="radio" id="radioSi" name="acepto" value="Si" ng-checked="true" class="ng-pristine ng-untouched ng-valid ng-empty" checked="checked"> Si acepto</label>
										<label for="radioAceptoCompartirDatos" class="radio-inline"><input type="radio" id="radioNo" name="acepto" value="No" class="ng-pristine ng-untouched ng-valid ng-empty"> No acepto</label>
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