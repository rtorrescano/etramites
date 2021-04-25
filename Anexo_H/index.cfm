<!DOCTYPE html>
<cfoutput>
	<cfif Isdefined("URL.id_user")> 
		<CFQUERY name="registro" datasource="etramites">
			Select * from registro
			WHERE registro_id = #url.id_user#
		</CFQUERY>	
		<cfset rz='#registro.razon_social#'>
		<cfset nombre='#registro.nombre#'>
		<cfset ap_pat='#registro.ap_paterno#'>
		<cfset ap_mat='#registro.ap_materno#'>
		<cfset rfc='#registro.rfc#'>
		<cfset entidad='#registro.entidad#'>
		<cfset folio='#registro.folio_proyecto#'>
		<cfset responsable='#registro.responsable_seguimiento#'>
		<cfset fconvenio='#LSDateFormat(registro.fecha_convenio, "mm/dd/yyyy")#'>
		<cfset nombrep='#registro.nombre_proyecto#'>
		<cfset num_elec='#registro.numero_electronico#'>
		<cfset correo='#registro.correo#'>
		<cfset lada1='#registro.lada1#'>
		<cfset tf='#registro.telefono_fijo#'>
		<cfset lada2='#registro.lada2#'>
		<cfset tm='#registro.telefono_movil#'>
		<cfset web='#registro.pagina_web#'>
		<cfset pinicio='#LSDateFormat(registro.periodo_inicio, "mm/dd/yyyy")#'>
		<cfset pfin='#LSDateFormat(registro.periodo_fin, "mm/dd/yyyy")#'>
		<cfset treporte='#registro.tipo_reporte#'>
		<cfset res='#registro.resoluciones#'>
		<cfset beneficiario='#registro.beneficiario#'>
		<cfset obgral='#registro.objetivo_general#'>
		<cfset obesp='#registro.objetivo_especifico#'>
		<cfset finadic='#registro.finalidades_adicionales#'>
	<CFELSE>
		<cfset rz=''>
		<cfset nombre=''>
		<cfset ap_pat=''>
		<cfset ap_mat=''>
		<cfset rfc=''>
		<cfset entidad=''>
		<cfset folio=''>
		<cfset responsable=''>
		<cfset fconvenio=''>
		<cfset nombrep=''>
		<cfset num_elec=''>
		<cfset correo=''>
		<cfset lada1=''>
		<cfset tf=''>
		<cfset lada2=''>
		<cfset tm=''>
		<cfset pinicio=''>
		<cfset pfin=''>
		<cfset treporte=''>
		<cfset res=''>
		<cfset beneficiario=''>
		<cfset obgral=''>
		<cfset obesp=''>
		<cfset finadic=''>	
		<cfset web=''>		
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
	  				<div class="col-md-8"><h2>Reporte de avance y/o final del apoyo del programa para el desarrollo de la industria de software (PROSOFT) y la innovaci&oacute;n</h2></div>
				</div> 
				<div class="row" ng-init="stage01 = true; section01 = true">
					<div class="col-sm-12">
						<ul class="wizard-steps">
							<li class="completed"><h5>Paso 1</h5><span>Generales</span></li>
							<li><h5>Paso 2</h5><span>Entregables</span></li>
							<li><h5>Paso 3</h5><span>Total de inversi&oacute;n</span></li>
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
			              				<label for="secondName11">Denominaci&oacute;n o raz&oacute;n social <span class="form-text">*</span>:</label>
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
			              			<div class="form-group">
			              				<label for="secondName11">Registro Federal de Contribuyente <span class="form-text">*</span>: </label> <span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="RFC"></span>
										<input type="text" id="rfc" class="form-control"  name="rfc" maxlength="13" value ="#RFC#"required placeholder="Ingresa el RFC">     					          
										<div class="help-block with-errors"></div>				   
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			              			<div class="form-group">
										<label for="secondName11">Entidad federativa <span class="form-text">*</span>:</label>
									   	<select class="form-control" name="entidad" value="" id="entidad" required>  
									   		<option value="" class="" selected="selected">-- Selecciona una entidad federativa --</option>
									   		<option label="Aguascalientes" value="1" <cfif #entidad# eq 1>selected</cfif>>Aguascalientes</option>
									   		<option label="Baja California" value="2" <cfif #entidad# eq 2>selected</cfif>>Baja California</option>
									   		<option label="Baja California Sur" value="3" <cfif #entidad# eq 3>selected</cfif>>Baja California Sur</option>
									   		<option label="Campeche" value="4" <cfif #entidad# eq 4>selected</cfif>>Campeche</option>
									   		<option label="Ciudad de M&eacute;xico" value="5" <cfif #entidad# eq 5>selected</cfif>>Ciudad de M&eacute;xico</option>
									   		<option label="Coahuila de Zaragoza" value="6" <cfif #entidad# eq 6>selected</cfif>>Coahuila de Zaragoza</option>
									   		<option label="Colima" value="7" <cfif #entidad# eq 7>selected</cfif>>Colima</option>
									   		<option label="Chiapas" value="8" <cfif #entidad# eq 8>selected</cfif>>Chiapas</option>
									   		<option label="Chihuahua" value="9" <cfif #entidad# eq 9>selected</cfif>>Chihuahua</option>
									   		<option label="Durango" value="10" <cfif #entidad# eq 10>selected</cfif>>Durango</option>
									   		<option label="Guanajuato" value="11" <cfif #entidad# eq 11>selected</cfif>>Guanajuato</option>
									   		<option label="Guerrero" value="12" <cfif #entidad# eq 12>selected</cfif>>Guerrero</option>
									   		<option label="Hidalgo" value="13" <cfif #entidad# eq 13>selected</cfif>>Hidalgo</option>
									   		<option label="Jalisco" value="14" <cfif #entidad# eq 14>selected</cfif>>Jalisco</option>
									   		<option label="M&eacute;xico" value="15" <cfif #entidad# eq 15>selected</cfif>>M&eacute;xico</option>
									   		<option label="Michoac&aacute;n de Ocampo" value="16" <cfif #entidad# eq 16>selected</cfif>>Michoac&aacute;n de Ocampo</option>
									   		<option label="Morelos" value="17" <cfif #entidad# eq 17>selected</cfif>>Morelos</option>
									   		<option label="Nayarit" value="18" <cfif #entidad# eq 18>selected</cfif>>Nayarit</option>
									   		<option label="Nuevo Le&oacute;n" value="19" <cfif #entidad# eq 19>selected</cfif>>Nuevo Le&oacute;n</option>
									   		<option label="Oaxaca" value="20" <cfif #entidad# eq 20>selected</cfif>>Oaxaca</option>
									   		<option label="Puebla" value="21" <cfif #entidad# eq 21>selected</cfif>>Puebla</option>
									   		<option label="Quer&eacute;taro" value="22" <cfif #entidad# eq 22>selected</cfif>>Quer&eacute;taro</option>
									   		<option label="Quintana Roo" value="23" <cfif #entidad# eq 23>selected</cfif>>Quintana Roo</option>
									   		<option label="San Luis Potos&iacute;" value="24" <cfif #entidad# eq 24>selected</cfif>>San Luis Potos&iacute;</option>
									   		<option label="Sinaloa" value="25" <cfif #entidad# eq 25>selected</cfif>>Sinaloa</option>
									   		<option label="Sonora" value="26" <cfif #entidad# eq 26>selected</cfif>>Sonora</option>
									   		<option label="Tabasco" value="27" <cfif #entidad# eq 27>selected</cfif>>Tabasco</option>
									   		<option label="Tamaulipas" value="28" <cfif #entidad# eq 28>selected</cfif>>Tamaulipas</option>
									   		<option label="Tlaxcala" value="29" <cfif #entidad# eq 29>selected</cfif>>Tlaxcala</option>
									   		<option label="Veracruz de Ignacio de la Llave" value="30" <cfif #entidad# eq 30>selected</cfif>>Veracruz de Ignacio de la Llave</option>
									   		<option label="Yucat&aacute;n" value="31" <cfif #entidad# eq 31>selected</cfif>>Yucat&aacute;n</option>
									   		<option label="Zacatecas" value="32" <cfif #entidad# eq 32>selected</cfif>>Zacatecas</option>		                            
							            </select>   
									    <div class="help-block with-errors"></div>  
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			              			<div class="form-group">
			              				<label for="secondName11">Folio del proyecto <span class="form-text">*</span>:</label>
			              				<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Corresponde al número de tramite."></span>
										<input type="text" id="folio" class="form-control"  name="folio" value="#folio#" required placeholder="Folio asignado al tr&aacute;mite">     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
							<div class="row">
			          			<div class="col-sm-8"><br>
			              			<div class="form-group">
			              				<label for="secondName11">Responsables de seguimiento <span class="form-text">*</span>:</label>
										<input type="text" id="responsables" class="form-control"  name="responsables" value="#responsable#" placeholder="Responsables de seguimiento" required>     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            		<div class="col-sm-4">
			            			<label class="control-label" for="calendario">Fecha de firma del convenio de asignaci&oacute;n <span class="form-text">*</span>:</label>
	                    			<div class="form-group datepicker-group">	                      				
	                      				<input type="text" class="form-control datepicker" id="calendar1" value="#fconvenio#" placeholder="Ingresa fecha de firma del convenio" name="calendar1" required>
	                      				<div class="help-block with-errors"></div>
	                      				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                    			</div>
	                  			</div>			            		
			            		
			            	</div>
							<div class="row">
			          			<div class="col-sm-8"><br>
			              			<div class="form-group">
			              				<label for="secondName11">Nombre del proyecto <span class="form-text">*</span>:</label>
										<input type="text" id="proyecto" class="form-control"  name="proyecto" value="#nombrep#" placeholder="Ingresa el nombre del proyecto" required>     					          
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
			          			<div class="col-sm-8">
			              			<div class="form-group">
			              				<label for="secondName11">P&aacute;gina web:</label>
										<input type="text" id="web" value="#web#" class="form-control"  name="web" placeholder="Ingrese la direcci&oacute;n del sitio web">     					          
										<div class="help-block with-errors"></div>				  
			              			</div>
			            		</div>
			            	</div>
			            	<div class="row">
								<div class="col-md-12">
									<p align="justify"><strong><i>*De conformidad con los art&iacute;culos 4 de la Ley Federal de Procedimiento Administrativo y 46, fracci&oacute;n VII de la Ley General de Mejora Regulatoria, los formatos para solicitar tramites y servicios deber&aacute;n publicarse en el Diario Oficial de la Federaci&oacute;n (DOF).</i></strong></p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h2>Tipo de reporte</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">
			          			<div class="col-sm-4">
			            			<label class="control-label" for="calendario">Per&iacute;odo que se reporta<span class="form-text"> *</span>:</label>
			            		</div>
			            		<div class="col-sm-4">
	                    			<div class="form-group datepicker-group">	                      				
	                      				<input type="text" class="form-control datepicker" id="calendar2" placeholder="Del d&iacute;a:" name="calendar2" required value="#pinicio#">
	                      				<div class="help-block with-errors"></div>
	                      				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                    			</div>
	                  			</div>			            		
			            		<div class="col-sm-4">
			            			<div class="form-group datepicker-group">	                      				
	                      				<input type="text" class="form-control datepicker" id="calendar3" placeholder="Al d&iacute;a:" name="calendar3" required value="#pfin#">
	                      				<div class="help-block with-errors"></div>
	                      				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                    			</div>
	                  			</div>	
			            	</div>
							<div class="row">
            					<div class="col-md-4"><br><br>
									<label for="tipoReporte" class="control-label">Tipo de reporte<span class="form-text"> *</span>:</label>
								</div>
								<div class="col-md-4"><br><br>
									<div class="form-group radio-group">
										<label><input type="radio" id="radio1" name="radio1" value="1erSem" <cfif #treporte# eq '1erSem'>checked</cfif> class="ng-pristine ng-untouched ng-valid ng-empty" required> Avance</label>&nbsp;&nbsp;
										<label><input type="radio" id="radio1" name="radio1" value="2doSem" <cfif #treporte# eq '2doSem'>checked</cfif> class="ng-pristine ng-untouched ng-valid ng-empty" required> 2° avance</label>&nbsp;&nbsp;
										<label><input type="radio" id="radio1" name="radio1" value="Final" <cfif #treporte# eq 'Final'>checked</cfif>class="ng-pristine ng-untouched ng-valid ng-empty" required> Final</label>&nbsp;&nbsp;
									</div>
            					</div>
            					<div class="col-sm-4">
			            			<label class="control-label" for="calendario">Historial de resoluciones sobre el reporte (sistema): <span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Corresponde al historial de reportes del sistema, en caso de que no aplique ingresar N/A."></span></label>
	                    			<input type="text" id="historial" class="form-control"  name="historial" value="#res#" placeholder="Historial de reportes del sistema">     					          
									<div class="help-block with-errors"></div>				  
	                  			</div>	
							</div>
							<div class="row">			          					            		
			            		<div class="col-sm-4"><br><br>
			            			<label class="control-label" for="calendario">Beneficiario<span class="form-text"></span>:</label>
			            		</div>
			            		<div class="col-sm-8">
			            			<textarea name="beneficiario" class="form-control" rows="3" cols="25" placeholder="Beneficiario" >#beneficiario#</textarea>	                    			     					          
									<div class="help-block with-errors"></div>
	                  			</div>	
			            	</div>
							<div class="row">
								<div class="col-sm-12">
									<h2>Informaci&oacute;n ejecutiva del proyecto</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">			          					            		
			            		<div class="col-sm-8">
			            			<label class="control-label" for="calendario">Objetivo general :</label>
			            			<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Escribe brevemente el objetivo general"></span>
			            			<textarea name="general" class="form-control" rows="3" cols="25" placeholder="Ingresa el objetivo general del proyecto">#obgral#</textarea>	                    			     					          
									<div class="help-block with-errors"></div>
	                  			</div>	
			            	</div>
			            	<div class="row">			          					            		
			            		<div class="col-sm-8">
			            			<label class="control-label" for="calendario">Objetivo espec&iacute;fico :</label>
			            			<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Escribe brevemente el objetivo específico"></span>
			            			<textarea name="especifico" class="form-control" rows="3" cols="25" required placeholder="Ingresa el objetivo específico del proyecto">#obesp#</textarea>	                    			     					          
									<div class="help-block with-errors"></div>
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