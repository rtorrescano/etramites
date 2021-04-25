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
											<th> Clave </th>
											<th> Rubro </th>
											<th> Concepto </th>
											<th> Entregable </th>
											<th> <button type="button" class="btn btn-default" data-toggle="modal" data-target="##myModal"> Agregar registro </button></th>
										</tr>
									</thead>
									<!-- Modal -->
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<form name="listado" action="listado_action.cfm" method="post" enctype="multipart/form-data" role="form">
												<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
										    	<div class="modal-content">
										      		<div class="modal-header">
										        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        		<h4 class="modal-title" id="myModalLabel">Listado de entregables</h4>
										      		</div>
										      		<div class="modal-body">
										        		<div class="row">
															<div class="col-md-4">
																<label class="control-label" for="clave">Clave:</label>
																<input id="clave01" name="clave01" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="arreglo01.clave01" placeholder="Ejemplo: 1, 2, 3..." capitalize="">
															</div>
															<div class="col-md-4">
																<label class="control-label" for="rubro">Rubro:</label>
																<input id="rubro01" name="rubro01" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="arreglo01.rubro01" placeholder="Descripci&oacute;n de rubro" capitalize="">
															</div>
															<div class="col-md-4">
																<label class="control-label" for="concepto">Concepto:</label>
																<input id="concepto01" name="concepto01" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="arreglo01.concepto01" placeholder="Descripci&oacute;n de concepto" capitalize="">
															</div>
														</div>
														<div class="row">
															<div class="col-md-8">
																<label class="control-label" for="entregable">Entregable:</label>
																<input id="entregable01" name="entregable01" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="arreglo01.entregable01" placeholder="Descripci&oacute;n de entregable" capitalize="">
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
										select * from listado_entregables
										where id_registro =#url.id_user#
									</cfquery>
									<cfif consulta01.recordcount gt 0>
										<tbody>
											<cfloop query="consulta01">
											<tr>
												<td>#clave#</td>
												<td>#rubro#</td>
												<td>#concepto#</td>
												<td>#entregable#</td>
												<td><a href="listado_action.cfm?id_user=#url.id_user#&registro=#id_entregable#&borrar=1" class="btn btn-primary" name="borrar01">Borrar</a></td>
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
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h4>Avance de entregables </h4>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<table id="lista_productos1" class="table table-bordered">
									<thead>
										<tr>
											<th> Clave </th>
											<th> Valor objetivo </th>
											<th> Actual </th>
											<th> % de avance actual </th>
											<th> % de ponderaci&oacute;n </th>
											<th> % Sobre meta total (%avance * % de ponderaci&oacute;n) </th>
											<th> <button type="button" class="btn btn-default" data-toggle="modal" data-target="##myModal1"> Agregar registro </button> </th>
										</tr>
									</thead>
									<!-- Modal -->
									<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<form name="avance" action="avance_action.cfm" method="post" enctype="multipart/form-data" role="form">
												<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
										    	<div class="modal-content">
										      		<div class="modal-header">
										        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        		<h4 class="modal-title" id="myModalLabel">avance de entregables</h4>
										      		</div>
										      		<div class="modal-body">
										        		<div class="row">
														<div class="col-md-4">
															<label class="control-label" for="clave">Clave:</label>
															<input id="clave02" name="clave02" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Ejemplo: 1, 2, 3..." capitalize="">
														</div>
														<div class="col-md-4">
															<label class="control-label" for="valorObjetivo">Valor objetivo:</label>
															<input id="valorObjetivo02" name="valorObjetivo02" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Cantidad objetiva" onblur="totalf1()">
														</div>
														<div class="col-md-4">
															<label class="control-label" for="actual">Actual:</label>
															<input id="actual02" name="actual02" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Cantidad actual" onblur="totalf1()">
														</div>
													</div>
													<div class="row">
														<div class="col-md-4">
															<br><br><label class="control-label" for="avance">% De avance (actual/objetivo):</label>
															<input id="avance02" name="avance02" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="%" disabled="" onblur="totalf1()">
														</div>
														<div class="col-md-4">
															<br><br><label class="control-label" for="avanceEntregables">% De ponderaci&oacute;n:
															<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Este porcentaje lo tendr&aacute; que calcular el usuario.">
															</span></label>
															<input id="ponderacion02" name="ponderacion02" type="text" class="form-control ng-valid ng-touched ng-dirty ng-empty" placeholder="(1 / n)*100" onblur="totalf1()">
														</div>
														<div class="col-md-4">
															<label class="control-label" for="avanceEntregables">% Sobre meta total (%avance * % de ponderaci&oacute;n):</label>
															<input id="metaTotal02" name="metaTotal02" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="%" disabled="" onblur="totalf1()">
														</div>
													</div>
													<div class="row">
														<div class="col-md-8">
															<br><label class="control-label"><strong>n = N&uacute;mero de conceptos</strong></label>
														</div>
													</div>
										      		</div>
										      		<div class="modal-footer">
										        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
										        		<button class="btn btn-primary pull-right" type="submit" name="guardar02">Guardar</button>
										      		</div>
										    	</div>
									    	</form>
									  	</div>
									</div>
									<cfquery datasource="etramites" name="consulta02">
										select * from avance_entregables
										where id_registro =#url.id_user#
									</cfquery>
									<cfif consulta01.recordcount gt 0>
										<tbody>
											<cfloop query="consulta02">
											<tr>
												<td>#clave#</td>
												<td>#valor_objetivo#</td>
												<td>#actual#</td>
												<td><cfset avance=#valor_objetivo#/#actual#>#avance# %</td>
												<td>#porcentaje_ponderacion#</td>
												<td><cfset meta=#avance#*#porcentaje_ponderacion#>#meta# %</td>
												<td><a href="avance_action.cfm?id_user=#url.id_user#&registro=#id_avanceent#&borrar=1" class="btn btn-primary" name="borrar01">Borrar</a></td>
											</tr>
											</cfloop>
										</tbody>
									</cfif>
								</table>
							</div>
							<div class="row">
								<div class="col-sd-12">
									<hr>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h4>Indicadores de impacto</h4>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<table id="lista_productos2" class="table table-bordered">
									<thead>
										<tr>
											<th> Clave </th>
											<th> Indicador </th>
											<th> Valor </th>											
											<th> <button type="button" class="btn btn-default" data-toggle="modal" data-target="##myModal2"> Agregar registro </button> </th>
										</tr>
									</thead>
									<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<form name="listado" action="indicador_action.cfm" method="post" enctype="multipart/form-data" role="form">
												<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
										    	<div class="modal-content">
										      		<div class="modal-header">
										        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        		<h4 class="modal-title" id="myModalLabel">Indicadores de impacto</h4>
										      		</div>
										      		<div class="modal-body">
										        		<div class="row">
															<div class="col-md-4">
																<label class="control-label" for="clave">Clave:</label>
																<input id="clave03" name="clave03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="arreglo01.clave01" placeholder="Ejemplo: 1, 2, 3..." capitalize="">
															</div>
															<div class="col-md-4">
																<label class="control-label" for="rubro">Indicador:</label>
																<input id="indicador03" name="indicador03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="arreglo01.rubro01" placeholder="Descripci&oacute;n de rubro" capitalize="">
															</div>
															<div class="col-md-4">
																<label class="control-label" for="concepto">Valor:</label>
																<input id="valor03" name="valor03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="arreglo01.concepto01" placeholder="Descripci&oacute;n de concepto" capitalize="">
															</div>
														</div>														
										      		</div>
										      		<div class="modal-footer">
										        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
										        		<button class="btn btn-primary pull-right" type="submit" name="guardar03">Guardar</button>
										      		</div>
										    	</div>
									    	</form>
									  	</div>
									</div>
									<cfquery datasource="etramites" name="consulta03">
										select * from indicadores_impacto
										where id_registro =#url.id_user#
									</cfquery>
									<cfif consulta03.recordcount gt 0>
										<tbody>
											<cfloop query="consulta03">
											<tr>
												<td>#clave#</td>
												<td>#indicador#</td>
												<td>#valor#</td>
												<td><a href="indicador_action.cfm?id_user=#url.id_user#&registro=#id_indicadores#&borrar=1" class="btn btn-primary" name="borrar01">Borrar</a></td>
											</tr>
											</cfloop>
										</tbody>
									</cfif>									
								</table>
							</div>
							<div class="row">
								<div class="col-sd-12">
									<hr>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h4>Avance de indicadores de impacto </h4>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<table id="lista_productos3" class="table table-bordered">
									<thead>
										<tr>
											<th> Clave </th>
											<th> Valor objetivo </th>
											<th> Actual </th>
											<th> % de avance actual </th>
											<th> % de ponderaci&oacute;n </th>
											<th> % Sobre meta total (%avance * % de ponderaci&oacute;n) </th>
											<th> <button type="button" class="btn btn-default" data-toggle="modal" data-target="##myModal3"> Agregar registro </button> </th>
										</tr>
									</thead>
									<!-- Modal -->
									<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<form name="avance2" action="impacto_action.cfm" method="post" enctype="multipart/form-data" role="form">
												<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
										    	<div class="modal-content">
										      		<div class="modal-header">
										        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        		<h4 class="modal-title" id="myModalLabel">Avance de indicadores de impacto</h4>
										      		</div>
										      		<div class="modal-body">
										        		<div class="row">
														<div class="col-md-4">
															<label class="control-label" for="clave">Clave:</label>
															<input id="clave04" name="clave04" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Ejemplo: 1, 2, 3..." capitalize="">
														</div>
														<div class="col-md-4">
															<label class="control-label" for="valorObjetivo">Valor objetivo:</label>
															<input id="valorObjetivo04" name="valorObjetivo04" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Cantidad objetiva" onblur="totalf2()">
														</div>
														<div class="col-md-4">
															<label class="control-label" for="actual">Actual:</label>
															<input id="actual04" name="actual04" type="text" class="form-control ng-valid ng-dirty ng-touched ng-empty" placeholder="Cantidad actual" onblur="totalf2()">
														</div>
													</div>
													<div class="row">
														<div class="col-md-4">
															<br><br><label class="control-label" for="avance">% De avance (actual/objetivo):</label>
															<input id="avance04" name="avance04" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="%" disabled="" onblur="totalf2()">
														</div>
														<div class="col-md-4">
															<br><br><label class="control-label" for="avanceEntregables">% De ponderaci&oacute;n:
															<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Este porcentaje lo tendr&aacute; que calcular el usuario.">
															</span></label>
															<input id="ponderacion04" name="ponderacion04" type="text" class="form-control ng-valid ng-touched ng-dirty ng-empty" placeholder="(1 / n)*100" onblur="totalf2()">
														</div>
														<div class="col-md-4">
															<label class="control-label" for="avanceEntregables">% Sobre meta total (%avance * % de ponderaci&oacute;n):</label>
															<input id="metaTotal04" name="metaTotal04" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="%" disabled="" onblur="totalf2()">
														</div>
													</div>
													<div class="row">
														<div class="col-md-8">
															<br><label class="control-label"><strong>n = N&uacute;mero de conceptos</strong></label>
														</div>
													</div>
										      		</div>
										      		<div class="modal-footer">
										        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
										        		<button class="btn btn-primary pull-right" type="submit" name="guardar04">Guardar</button>
										      		</div>
										    	</div>
									    	</form>
									  	</div>
									</div>
									<cfquery datasource="etramites" name="consulta04">
										select * from avance_indicadores
										where id_registro =#url.id_user#
									</cfquery>
									<cfif consulta01.recordcount gt 0>
										<tbody>
											<cfloop query="consulta04">
											<tr>
												<td>#clave#</td>
												<td>#valor_objetivo#</td>
												<td>#valor_actual#</td>
												<td><cfset avance=#valor_objetivo#/#valor_actual#>#avance# %</td>
												<td>#porcentaje_ponderacion#</td>
												<td><cfset meta=#avance#*#porcentaje_ponderacion#>#meta# %</td>
												<td><a href="impacto_action.cfm?id_user=#url.id_user#&registro=#id_avance_ind#&borrar=1" class="btn btn-primary" name="borrar01">Borrar</a></td>
											</tr>
											</cfloop>
										</tbody>
									</cfif>
								</table>
							</div>
							<div class="row">
								<div class="col-sd-12">
									<hr>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h4>Comprobante de egresos (l&iacute;quidos) </h4>
									<hr class="red">
								</div>
							</div>
							<div class="row">
								<table id="lista_productos4" class="table table-responsive">
									<thead>
										<tr>
											<th> Clave </th>
											<th> Concepto </th>
											<th> N&uacute;mero de comprobantes </th>
											<th> RFC del emisor </th>
											<th> Monto de facturas </th>
											<th> Monto pagado por chequera fondo PROSOFT: </th>
											<th> <button type="button" class="btn btn-default" data-toggle="modal" data-target="##myModal4"> Agregar registro </button> </th>
										</tr>
									</thead>
									<!-- Modal -->
									<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<form name="avance3" action="egresos_action.cfm" method="post" enctype="multipart/form-data" role="form">
												<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
										    	<div class="modal-content">
										      		<div class="modal-header">
										        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        		<h4 class="modal-title" id="myModalLabel">Comprobante de egresos</h4>
										      		</div>
										      		<div class="modal-body">
														<div class="form-group">
															<div class="row">
																<div class="col-md-4">
																	<br><label class="control-label" for="clave">Clave:</label>
																	<input id="clave05" name="clave05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ejemplo: 1, 2, 3..." capitalize="">
																</div>
																<div class="col-md-4">
																	<br><label class="control-label" for="valorObjetivo">Concepto:</label>
																	<input id="concepto05" name="concepto05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="Descripci&oacute;n" capitalize="">
																</div>
																<div class="col-md-4">
																	<label class="control-label" for="actual">N&uacute;mero de comprobante:</label>
																	<input id="comprobante05" name="comprobante05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ejemplo: 1, 2, 3..." capitalize="">
																</div>
															</div>
															<div class="row">
																<div class="col-md-4">
																	<br><br><br><label class="control-label" for="avance">RFC del emisor:</label>
																	<input id="rfc05" name="rfc05" type="text" class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-maxlength" placeholder="RFC del emisor" maxlength="13" required="" capitalize="">
																</div>
																<div class="col-md-4">
																	<br><br><label class="control-label" for="avanceEntregables">Monto de facturas:
																	<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Agregar solo el monto de la cantidad sin signos, ni comas, solo decimales.">
																	</span></label>
																	<input id="montoFactura05" name="montoFactura05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="$" capitalize="">
																</div>
																<div class="col-md-4">
																	<label class="control-label" for="avanceEntregables">Monto pagado por chequera fondo PROSOFT:
																	<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Agregar solo el monto de la cantidad sin signos, ni comas, solo decimales.">
																	</span></label>
																	<input id="montoPagado05" name="montoPagado05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="$" capitalize="">
																</div>
															</div>
														</div>
													</div>
										      		<div class="modal-footer">
										        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
										        		<button class="btn btn-primary pull-right" type="submit" name="guardar05">Guardar</button>
										      		</div>
										    	</div>
									    	</form>
									  	</div>
									</div>
									<cfquery datasource="etramites" name="consulta04">
										select * from comprobante_egresos
										where id_registro =#url.id_user#
									</cfquery>
									<cfif consulta01.recordcount gt 0>
										<tbody>
											<cfloop query="consulta04">
											<tr>
												<td>#clave#</td>
												<td>#concepto#</td>
												<td>#num_comprobantes#</td>
												<td>#RFC#</td>
												<td>#monto_factura#</td>
												<td>#monto_prosoft#</td>
												<td><a href="egresos_action.cfm?id_user=#url.id_user#&registro=#id_comprobante#&borrar=1" class="btn btn-primary" name="borrar01">Borrar</a></td>
											</tr>
											</cfloop>
										</tbody>
									</cfif>
								</table>
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
										<div class="col-sm-10"><a href="inversion.cfm?id_user=#url.id_user#" class="btn btn-primary pull-right">Siguiente</a></div>																			
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