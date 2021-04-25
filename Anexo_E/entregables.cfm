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
              				<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h2>Anexo relaci&oacute;n descriptiva de entregables</h2>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h4>Listado de entregables</h4>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
								<table id="lista_productos" class="table table-bordered">
									<thead>
										<tr>
											<th> a) Concepto entregable </th>
											<th> b) Entregable original </th>
											<th> c) Entregable modificado </th>
											<th> d) Costo entregable original </th>
											<th> e) Costo entregable modificado </th>
											<th> f) Justificaci&oacute;n de la modificaci&oacute;n </th>
											<th> <button type="button" class="btn btn-default" data-toggle="modal" data-target="##myModal"> Agregar registro </button></th>
										</tr>
									</thead>
									<!-- Modal -->
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<form name="listado" action="entregables_action.cfm" method="post" enctype="multipart/form-data" role="form">
												<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
										    	<div class="modal-content">
										      		<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
														<h4 class="modal-title" id="tituloModal">Entregable</h4>
													</div>
													<div class="modal-body">
														<div class="form-group">
															<div class="row">
																<div class="col-md-4">
																	<label class="control-label" for="concepto">Concepto entregable:</label>
																	<input id="conceptoEntregable" name="conceptoEntregable" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Concepto del entregable">
																</div>
																<div class="col-md-4">
																	<label class="control-label" for="valorObjetivo">Entregable original:</label>
																	<input id="entregableOriginal" name="entregableOriginal" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Entregable original">
																</div>
																<div class="col-md-4">
																	<label class="control-label" for="actual">Entregable modificado:</label>
																	<input id="entregableModificado" name="entregableModificado" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Entregable modificado">
																</div>
															</div>
															<div class="row">
																<div class="col-md-4">
																	<br><label class="control-label" for="concepto">Costo entregable original:
																	<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Agregar solo el monto de la cantidad sin signos, ni comas, solo decimales.">
																	</span>
																	</label>
																	<input id="costoentregableOriginal" name="costoentregableOriginal" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Costo de entregable original">
																</div>
																<div class="col-md-4">
																	<br><label class="control-label" for="valorObjetivo">Costo entregable modificado:
																	<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Agregar solo el monto de la cantidad sin signos, ni comas, solo decimales.">
																	</span>
																	</label>
																	<input id="costoEntregableModificado" name="costoEntregableModificado" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Entregable modificado">
																</div>
																<div class="col-md-4">
																	<br><br><label class="control-label" for="actual">Justificación de la modificación:</label>
																	<input id="justificacionModificacion" name="justificacionModificacion" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Justificación de la modificación">
																</div>
															</div>
														</div>
													</div>					
										      		<div class="modal-footer">
										        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
										        		<button class="btn btn-primary pull-right" type="submit" name="guardar01">Guardar</button>
										      		</div>
										    	</div>
									    	</form>
									  	</div>
									</div>
									<cfquery datasource="etramites" name="consulta01">
										select * from entregables_ae
										where id_registroae =#url.id_user#
									</cfquery>
									<cfif consulta01.recordcount gt 0>
										<tbody>
											<cfloop query="consulta01">
											<tr>
												<td>#con_entregable#</td>
												<td>#ent_original#</td>
												<td>#ent_modificado#</td>
												<td>#costo_original#</td>
												<td>#costo_modificado#</td>
												<td>#justificacion#</td>
												<td><a href="entregables_action.cfm?id_user=#url.id_user#&registro=#id_entregableae#&borrar=1" class="btn btn-primary" name="borrar01">Borrar</a></td>
											</tr>
											</cfloop>
										</tbody>
									</cfif>
								</table>
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
										<div class="col-sm-2"><a href="index.cfm?id_user=#url.id_user#" class="btn btn-default pull-right">Regresar</a></div>
										<div class="col-sm-10"><a href="proveedores.cfm?id_user=#url.id_user#" class="btn btn-primary pull-right">Siguiente</a></div>																			
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>
      	</main>
      	<!-- JS -->
      	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	      <script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	      <script src="https://framework-gb.cdn.gob.mx/assets/scripts/jquery-ui-datepicker.js"></script>
	      <script src="js/validator.js"></script>
	      <script type="text/javascript" src="js/productos.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			productos();
			productos1();
			productos2();
			productos3();
			productos4();
		});
	</script>
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
			<script>
				function totalf1() {
				if((parseFloat(document.avance.actual02.value) >= 0) && (parseFloat(document.avance.valorObjetivo02.value) >= 0) && (parseFloat(document.avance.ponderacion02.value) >= 0)){
						suma1= parseFloat((parseFloat(document.avance.actual02.value) / parseFloat(document.avance.valorObjetivo02.value))).toFixed(2);											
						document.avance.avance02.value=suma1;	
						meta=parseFloat(document.avance.ponderacion02.value);
						resultado= suma1 * meta;
						document.avance.metaTotal02.value=resultado;			
					}
				}	
				
				function totalf2() {
				if((parseFloat(document.avance2.actual04.value) >= 0) && (parseFloat(document.avance2.valorObjetivo04.value) >= 0) && (parseFloat(document.avance2.ponderacion04.value) >= 0)){
						suma1= parseFloat((parseFloat(document.avance2.actual04.value) / parseFloat(document.avance2.valorObjetivo04.value))).toFixed(2);											
						document.avance2.avance04.value=suma1;	
						meta=parseFloat(document.avance2.ponderacion04.value);
						resultado= suma1 * meta;
						document.avance2.metaTotal04.value=resultado;			
					}
				}	
			</script>
  	</body>
  </html>
  </cfoutput>