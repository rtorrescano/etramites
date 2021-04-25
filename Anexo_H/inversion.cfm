<!DOCTYPE html>
<cfoutput>
<cfquery name="consulta" datasource="etramites">
	select * from inversion
	where id_registro = #url.id_user#
</cfquery>
<cfif consulta.recordcount gt 0>
	<cfset ejse1='#consulta.monto_ejercido_se1#'>
	<cfset solse1='#consulta.monto_solicitud_se1#'>
	<cfset porse1=(#ejse1#/#solse1#)*100>
	<cfset ejse2='#consulta.monto_ejercido_se2#'>
	<cfset solse2='#consulta.monto_solicitud_se2#'>
	<cfset porse2=(#ejse2#/#solse2#)*100>
	<cfset ejse3=#ejse1#+#ejse2#>
	<cfset solse3=#solse1#+#solse2#>
	<cfset porse3=(#ejse3#/#solse3#)*100>
	
	
	<cfset ejef1='#consulta.monto_ejercido_ef1#'>
	<cfset solef1='#consulta.monto_solicitud_ef1#'>
	<cfif #ejef1# gt 0 and #solef1# gt 0>		
		<cfset poref1=(#ejef1#/#solef1#)*100>
	<cfelse>
		<cfset poref1=0>
	</cfif>	
	<cfset ejef2='#consulta.monto_ejercido_ef2#'>
	<cfset solef2='#consulta.monto_solicitud_ef2#'>
	<cfif #ejef2# gt 0 and #solef2# gt 0>		
		<cfset poref2=(#ejef2#/#solef2#)*100>
	<cfelse>
		<cfset poref2=0>
	</cfif>	
	<cfset ejef1='#consulta.monto_ejercido_ip1#'>
	<cfset solef1='#consulta.monto_solicitud_ip1#'>
	<cfset ejef3=#ejef1#+#ejef2#>
	<cfset solef3=#solef1#+#solef2#>
	<cfif #ejef3# gt 0 and #solef3# gt 0>
		<cfset poref3=(#ejef3#/#solef3#)*100>
	<cfelse>
		<cfset poref3=0>
	</cfif>
	
	<cfset ejip1='#consulta.monto_ejercido_ip1#'>
	<cfset solip1='#consulta.monto_solicitud_ip1#'>
	<cfif #ejip1# gt 0 and #solip1# gt 0>		
		<cfset porip1=(#ejip1#/#solip1#)*100>
	<cfelse>
		<cfset porip1=0>
	</cfif>	
	<cfset ejip2='#consulta.monto_ejercido_ip2#'>
	<cfset solip2='#consulta.monto_solicitud_ip2#'>
	<cfif #ejip2# gt 0 and #solip2# gt 0>		
		<cfset porip2=(#ejip2#/#solip2#)*100>
	<cfelse>
		<cfset porip2=0>
	</cfif>	
	<cfset ejip3=#ejip1#+#ejip2#>
	<cfset solip3=#solip1#+#solip2#>
	<cfif #ejip3# gt 0 and #solip3# gt 0>
		<cfset porip3=(#ejip3#/#solip3#)*100>
	<cfelse>
		<cfset porip3=0>
	</cfif>
	
	<cfset eja1='#consulta.monto_ejercido_a1#'>
	<cfset sola1='#consulta.monto_solicitud_a1#'>
	<cfif #eja1# gt 0 and #sola1# gt 0>		
		<cfset pora1=(#eja1#/#sola1#)*100>
	<cfelse>
		<cfset pora1=0>
	</cfif>	
	<cfset eja2='#consulta.monto_ejercido_a2#'>
	<cfset sola2='#consulta.monto_solicitud_a2#'>
	<cfif #eja2# gt 0 and #sola2# gt 0>		
		<cfset pora2=(#eja2#/#sola2#)*100>
	<cfelse>
		<cfset pora2=0>
	</cfif>	
	<cfset eja3=#eja1#+#eja2#>
	<cfset sola3=#sola1#+#sola2#>
	<cfif #eja3# gt 0 and #sola3# gt 0>
		<cfset pora3=(#eja3#/#sola3#)*100>
	<cfelse>
		<cfset pora3=0>
	</cfif>
	
	<cfset total1=#ejse1#+#ejef1#+#ejip1#+#eja1#>
	<cfset total2=#solse1#+#solef1#+#ejip1#+#sola1#>
	<cfset total3=(#total1#/#total2#)*100>
	<cfset total4=#ejse2#+#ejef2#+#ejip2#+#eja2#>
	<cfset total5=#solse2#+#solef2#+#solip2#+#sola2#>
	<cfset total6=(#total4#/#total5#)*100>
	<cfset total7=#total1#+#total4#>
	<cfset total8=#total2#+#total5#>
	<cfset total9=(#total7#/#total8#)*100>
	
	<cfquery name="consulta1" datasource="etramites">
		select * from resumen_avances
		where id_registro = #url.id_user#
	</cfquery>
	
	
	<cfset resumenentregable1='#consulta1.avance_fisico#'>
	<cfset resumenentregable3='#consulta1.avance_impacto#'>
<cfelse>
	<cfset ejse1=''>
	<cfset solse1=''>
	<cfset porse1=''>
	<cfset ejse2=''>
	<cfset solse2=''>
	<cfset porse2=''>
	<cfset ejse3=''>
	<cfset solse3=''>
	<cfset porse2=''>
	<cfset porse3=''>
	
	<cfset ejip1=''>
	<cfset solip1=''>
	<cfset porip1=''>
	<cfset ejip2=''>
	<cfset solip2=''>
	<cfset porip2=''>
	<cfset ejip3=''>
	<cfset solip3=''>
	<cfset porip2=''>
	<cfset porip3=''>
	
	<cfset total1=''>
	<cfset total2=''>
	<cfset total3=''>
	<cfset total4=''>
	<cfset total5=''>
	<cfset total6=''>
	<cfset total7=''>
	<cfset total8=''>
	<cfset total9=''>
	<cfset resumenentregable1=''>
	<cfset resumenentregable3=''>
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
              			<form name="registro" action="inversion_action.cfm" method="post" enctype="multipart/form-data" role="form">
              				<input type="hidden" id="id_user" class="form-control"  name="id_user" value="#url.id_user#">
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h2>Total de inversi&oacute;n</h2>
									<hr class="red">
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<table name="tableUniversal" id="tableUniversal" class="" border="0" align="center">
										<tbody><tr>
											<td rowspan="2" align="center"><label class="control-label">Concepto:</label></td>
											<td colspan="3" align="center"><label class="control-label">Inversi&oacute;n l&iacute;quida:</label></td>
											<td colspan="3" align="center"><label class="control-label">Inversi&oacute;n no l&iacute;quida:</label></td>
											<td colspan="3" align="center"><label class="control-label">Inversi&oacute;n total:</label></td>
										</tr>
										<tr>
											<td align="center"><label class="control-label">Monto ejercido:</label></td>
											<td align="center"><label class="control-label">Monto solicitud:</label></td>
											<td align="center"><label class="control-label">% Ejercido:</label></td>
											<td align="center"><label class="control-label">Monto ejercido:</label></td>
											<td align="center"><label class="control-label">Monto solicitud:</label></td>
											<td align="center"><label class="control-label">% Ejercido:</label></td>
											<td align="center"><label class="control-label">Monto ejercido:</label></td>
											<td align="center"><label class="control-label">Monto solicitud:</label></td>
											<td align="center"><label class="control-label">% Ejercido:</label></td>
										</tr>
										<tr>
											<td align="center"><label class="control-label">Secretar&iacute;a de econom&iacute;a:</label></td>
											<td><input id="montoEjercido01" name="montoEjercido01" type="text" class="form-control ng-not-empty ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched" onblur="totalf1()" onKeyPress="return soloNumeros(event)" required value="#ejse1#"></td>
											<td><input id="montoSolicitud01" name="montoSolicitud01" type="text" class="form-control ng-not-empty ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched" onblur="totalf1()" onKeyPress="return soloNumeros(event)" required value="#ejse2#"></td>
											<td><input id="porcentajeEjercido01" name="porcentajeEjercido01" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#porse1#"></td>
											<td><input id="montoEjercido02" name="montoEjercido02" type="text" class="form-control ng-valid ng-not-empty ng-dirty ng-valid-parse ng-touched" onblur="totalf1()" onKeyPress="return soloNumeros(event)" required value="#solse1#"></td>
											<td><input id="montoSolicitud02" name="montoSolicitud02" type="text" class="form-control ng-valid ng-not-empty ng-dirty ng-valid-parse ng-touched" onblur="totalf1()" onKeyPress="return soloNumeros(event)" required value="#solse2#"></td>
											<td><input id="porcentajeEjercido02" name="porcentajeEjercido02" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#porse2#"></td>
											<td><input id="montoEjercido03" name="montoEjercido03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#ejse3#"></td>
											<td><input id="montoSolicitud03" name="montoSolicitud03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#solse3#"></td>
											<td><input id="porcentajeEjercido03" name="porcentajeEjercido03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#porse3#"></td>
										</tr>
										<!---tr>
											<td align="center"><label class="control-label">Entidad federativa:</label></td>
											<td><input id="montoEjercido04" name="montoEjercido04" type="text" class="form-control ng-pristine ng-valid ng-empty ng-touched" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#ejef1#"></td>
											<td><input id="montoSolicitud04" name="montoSolicitud04" type="text" class="form-control ng-pristine ng-valid ng-empty ng-touched" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#ejef2#"></td>
											<td><input id="porcentajeEjercido04" name="porcentajeEjercido04" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#poref1#"></td>
											<td><input id="montoEjercido05" name="montoEjercido05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#solef1#"></td>
											<td><input id="montoSolicitud05" name="montoSolicitud05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#solef2#"></td>
											<td><input id="porcentajeEjercido05" name="porcentajeEjercido05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#poref2#"></td>
											<td><input id="montoEjercido06" name="montoEjercido06" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#ejef3#"></td>
											<td><input id="montoSolicitud06" name="montoSolicitud06" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#solef3#"></td>
											<td><input id="porcentajeEjercido06" name="porcentajeEjercido06" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#poref3#"></td>
										</tr--->
										<tr>
											<td align="center"><label class="control-label" align="center">Iniciativa privada:</label></td>
											<td><input id="montoEjercido07" name="montoEjercido07" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#ejip1#"></td>
											<td><input id="montoSolicitud07" name="montoSolicitud07" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#ejip2#"></td>
											<td><input id="porcentajeEjercido07" name="porcentajeEjercido07" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#porip1#"></td>
											<td><input id="montoEjercido08" name="montoEjercido08" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#solip1#"></td>
											<td><input id="montoSolicitud08" name="montoSolicitud08" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)"  value="#solip2#"></td>
											<td><input id="porcentajeEjercido08" name="porcentajeEjercido08" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#porip2#"></td>
											<td><input id="montoEjercido09" name="montoEjercido09" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#ejip3#"></td>
											<td><input id="montoSolicitud09" name="montoSolicitud09" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#ejip3#"></td>
											<td><input id="porcentajeEjercido09" name="porcentajeEjercido09" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#porip3#"></td>
										</tr>
										<!---tr>
											<td align="center"><label class="control-label" align="center">Academia:</label></td>
											<td><input id="montoEjercido10" name="montoEjercido10" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)"  value="#eja1#"></td>
											<td><input id="montoSolicitud10" name="montoSolicitud10" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#eja2#"></td>
											<td><input id="porcentajeEjercido10" name="porcentajeEjercido10" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#pora1#"></td>
											<td><input id="montoEjercido11" name="montoEjercido11" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)"  value="#sola1#"></td>
											<td><input id="montoSolicitud11" name="montoSolicitud11" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" value="#sola2#"></td>
											<td><input id="porcentajeEjercido11" name="porcentajeEjercido11" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#pora2#"></td>
											<td><input id="montoEjercido12" name="montoEjercido12" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#eja3#"></td>
											<td><input id="montoSolicitud12" name="montoSolicitud12" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#sola3#"></td>
											<td><input id="porcentajeEjercido12" name="porcentajeEjercido12" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled="" value="#pora3#"></td>
										</tr--->
										<tr>
											<td><br></td>
										</tr>
										<tr>
											<td align="right"><label class="control-label">Total:</label></td>
											<td><input id="total01" name="total01" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total1#"></td>
											<td><input id="total02" name="total02" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total2#"></td>
											<td><input id="total03" name="total03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total3#"></td>
											<td><input id="total04" name="total04" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total4#"></td>
											<td><input id="total05" name="total05" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total5#"></td>
											<td><input id="total06" name="total06" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total6#"></td>
											<td><input id="total07" name="total07" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total7#"></td>
											<td><input id="total08" name="total08" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total8#"></td>
											<td><input id="total09" name="total09" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" onblur="totalf1()" disabled="" value="#total9#"></td>
										</tr>
									</tbody></table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h1 class="bottom-buffer"></h1>
									<h2>Resumen de avances</h2>
									<hr class="red">
								</div>
							</div>
							
							<div class="row">
								<div class="panel-collapse collapse in" id="panel-06">
									<div class="panel-body">
										<div class="form-group">
											<table class="table table-bordered" align="center">
												<tbody>
													<tr>
														<td align="center"><label class="control-label" for="concepto01">Concepto</label></td>
														<td align="center"><label class="control-label">Avance</label></td>
													</tr>
													<tr>
														<td align="center"><label class="control-label">Avance f&iacute;sico (entregables):</label>
															<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Formula para calcular el porcentaje = suma total del % Sobre meta total (panel 'Avance de entregables')"></span>
														</td>
														<td align="center"><input id="resumenEntregable01" name="resumenEntregable01" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="=total del % sobre meta total (avance de entregables)" value="#resumenentregable1#"></td>
													</tr>
													<tr>
														<td align="center"><label class="control-label">Avance financiero (egresos l&iacute;quidos y en especie):</label></td>
														<td align="center"><input id="resumenEntregable02" name="resumenEntregable02" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" placeholder="=total del % sobre meta total(avance de indicadores de impacto)" onblur="totalf1()" onKeyPress="return soloNumeros(event)" disabled=""  value="#total9#""></td>
													</tr>
													<tr>
														<td align="center"><label class="control-label">Avance de impacto (indicadores):</label>
															<span class="icon-infocircle" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="" data-original-title="Para calcular este valor tendr&aacute;s que sumar total del % Sobre meta total(panel 'Avance de indicadores de impacto')">
															</span>
														</td>
														<td align="center"><input id="resumenEntregable03" name="resumenEntregable03" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="=total del % sobre meta total(avance de indicadores de impacto)" value="#resumenentregable3#"></td>
													</tr>
												</tbody>
											</table>
										</div>
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
										<div class="col-sm-2"><a href="entregables.cfm?id_user=#url.id_user#" class="btn btn-default pull-right">Regresar</a></div>
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
			
			
			<script>  
				 function totalf1() {
					if(!isNaN(parseFloat(registro.montoEjercido01.value)) && !isNaN(parseFloat(registro.montoSolicitud01.value))) {
						porcentaje1= parseFloat((parseFloat(document.registro.montoEjercido01.value) / parseFloat(document.registro.montoSolicitud01.value)) * 100).toFixed(2);											
						document.registro.porcentajeEjercido01.value=porcentaje1;
						}
					if(!isNaN(parseFloat(registro.montoEjercido02.value)) && !isNaN(parseFloat(registro.montoSolicitud02.value))) {
						porcentaje2= parseFloat((parseFloat(document.registro.montoEjercido02.value) / parseFloat(document.registro.montoSolicitud02.value)) * 100).toFixed(2);											
						document.registro.porcentajeEjercido02.value=porcentaje2;
						}						
					if((parseFloat(document.registro.montoEjercido01.value) >= 0) && (parseFloat(document.registro.montoEjercido02.value) >= 0)){
						suma1= parseFloat((parseFloat(document.registro.montoEjercido01.value) + parseFloat(document.registro.montoEjercido02.value))).toFixed(2);											
						document.registro.montoEjercido03.value=suma1;
					}else if(parseFloat(document.registro.montoEjercido01.value) >= 0){
						suma1= parseFloat((parseFloat(document.registro.montoEjercido01.value))).toFixed(2);
						document.registro.montoEjercido03.value=suma1;					
					}else if(parseFloat(document.registro.montoEjercido02.value) >= 0){						
						suma1= parseFloat((parseFloat(document.registro.montoEjercido02.value))).toFixed(2);
						document.registro.montoEjercido03.value=suma1;						
					}						
					if((parseFloat(document.registro.montoSolicitud01.value) >= 0) && (parseFloat(document.registro.montoSolicitud02.value) > 0)){
						suma2= parseFloat((parseFloat(document.registro.montoSolicitud01.value) + parseFloat(document.registro.montoSolicitud02.value))).toFixed(2);											
						document.registro.montoSolicitud03.value=suma2;
					}else if(parseFloat(document.registro.montoSolicitud01.value) >= 0){
						suma2= parseFloat((parseFloat(document.registro.montoSolicitud01.value))).toFixed(2);
						document.registro.montoSolicitud03.value=suma2;					
					}else if(parseFloat(document.registro.montoSolicitud02.value) >= 0){						
						suma2= parseFloat((parseFloat(document.registro.montoSolicitud02.value))).toFixed(2);
						document.registro.montoSolicitud03.value=suma2;						
					}	
					if((parseFloat(document.registro.montoEjercido01.value) >= 0) && (parseFloat(document.registro.montoEjercido02.value) >= 0) && (parseFloat(document.registro.montoSolicitud01.value) >= 0) && (parseFloat(document.registro.montoSolicitud02.value) > 0)){
						porcentaje3= parseFloat((parseFloat(document.registro.montoEjercido03.value) / parseFloat(document.registro.montoSolicitud03.value)) * 100).toFixed(2);
						document.registro.porcentajeEjercido03.value=porcentaje3;
					}
					
							
					
				
					if(!isNaN(parseFloat(registro.montoEjercido07.value)) && !isNaN(parseFloat(registro.montoSolicitud07.value))) {
						porcentaje7= parseFloat((parseFloat(document.registro.montoEjercido07.value) / parseFloat(document.registro.montoSolicitud07.value)) * 100).toFixed(2);											
						document.registro.porcentajeEjercido07.value=porcentaje7;
						}
					if(!isNaN(parseFloat(registro.montoEjercido08.value)) && !isNaN(parseFloat(registro.montoSolicitud08.value))) {
						porcentaje8= parseFloat((parseFloat(document.registro.montoEjercido08.value) / parseFloat(document.registro.montoSolicitud08.value)) * 100).toFixed(2);											
						document.registro.porcentajeEjercido08.value=porcentaje8;
						}	
					if((parseFloat(document.registro.montoEjercido07.value) > 0) && (parseFloat(document.registro.montoEjercido08.value) > 0)){
						suma5= parseFloat((parseFloat(document.registro.montoEjercido07.value) + parseFloat(document.registro.montoEjercido08.value))).toFixed(2);											
						document.registro.montoEjercido09.value=suma5;
					}else if(parseFloat(document.registro.montoEjercido07.value) > 0){
						suma5= parseFloat((parseFloat(document.registro.montoEjercido07.value))).toFixed(2);
						document.registro.montoEjercido09.value=suma5;					
					}else if(parseFloat(document.registro.montoEjercido08.value) > 0){						
						suma5= parseFloat((parseFloat(document.registro.montoEjercido08.value))).toFixed(2);
						document.registro.montoEjercido09.value=suma5;						
					}						
					if((parseFloat(document.registro.montoSolicitud07.value) > 0) && (parseFloat(document.registro.montoSolicitud08.value) > 0)){
						suma6= parseFloat((parseFloat(document.registro.montoSolicitud07.value) + parseFloat(document.registro.montoSolicitud08.value))).toFixed(2);											
						document.registro.montoSolicitud09.value=suma6;
					}else if(parseFloat(document.registro.montoSolicitud07.value) > 0){
						suma6= parseFloat((parseFloat(document.registro.montoSolicitud07.value))).toFixed(2);
						document.registro.montoSolicitud09.value=suma6;					
					}else if(parseFloat(document.registro.montoSolicitud08.value) > 0){						
						suma6= parseFloat((parseFloat(document.registro.montoSolicitud08.value))).toFixed(2);
						document.registro.montoSolicitud09.value=suma6;						
					}
					if((parseFloat(document.registro.montoEjercido07.value) > 0) && (parseFloat(document.registro.montoEjercido08.value) > 0) && (parseFloat(document.registro.montoSolicitud07.value) > 0) && (parseFloat(document.registro.montoSolicitud08.value) > 0) ){
						porcentaje9= parseFloat((parseFloat(document.registro.montoEjercido09.value) / parseFloat(document.registro.montoSolicitud09.value)) * 100).toFixed(2);											
						document.registro.porcentajeEjercido09.value=porcentaje9;	
					}
					
					
				
						
				
					if((parseFloat(document.registro.montoEjercido01.value) > 0) && (parseFloat(document.registro.montoEjercido07.value) > 0) ){
						suma9= parseFloat((parseFloat(document.registro.montoEjercido01.value)+ parseFloat(document.registro.montoEjercido07.value))).toFixed(2);											
						document.registro.total01.value=suma9;
					}else if(parseFloat(document.registro.montoEjercido01.value) >= 0){						
						suma9= parseFloat((parseFloat(document.registro.montoEjercido01.value))).toFixed(2);
						document.registro.total01.value=suma9;
					}else if(parseFloat(document.registro.montoEjercido07.value) >= 0){						
						suma9= parseFloat((parseFloat(document.registro.montoEjercido07.value))).toFixed(2);
						document.registro.total01.value=suma9;
					}
					
					if((parseFloat(document.registro.montoEjercido02.value) >= 0) && (parseFloat(document.registro.montoEjercido08.value) >= 0) ){
						suma10= parseFloat((parseFloat(document.registro.montoEjercido02.value)+ parseFloat(document.registro.montoEjercido08.value))).toFixed(2);											
						document.registro.total04.value=suma10;
					}else if(parseFloat(document.registro.montoEjercido02.value) >= 0){						
						suma10= parseFloat((parseFloat(document.registro.montoEjercido02.value))).toFixed(2);
						document.registro.total04.value=suma10;
					}else if(parseFloat(document.registro.montoEjercido08.value) >= 0){						
						suma10= parseFloat((parseFloat(document.registro.montoEjercido08.value))).toFixed(2);
						document.registro.total04.value=suma10;
					}
					
					
					if((parseFloat(document.registro.montoEjercido03.value) >= 0) && (parseFloat(document.registro.montoEjercido09.value) >= 0) ){
						suma11= parseFloat((parseFloat(document.registro.montoEjercido03.value)+ parseFloat(document.registro.montoEjercido09.value))).toFixed(2);											
						document.registro.total07.value=suma11;
					}else if(parseFloat(document.registro.montoEjercido03.value) >= 0){						
						suma11= parseFloat((parseFloat(document.registro.montoEjercido03.value))).toFixed(2);
						document.registro.total07.value=suma11;
					}else if(parseFloat(document.registro.montoEjercido09.value) >= 0){						
						suma11= parseFloat((parseFloat(document.registro.montoEjercido09.value))).toFixed(2);
						document.registro.total07.value=suma11;
					}
					
					if((parseFloat(document.registro.montoSolicitud01.value) > 0) && (parseFloat(document.registro.montoSolicitud07.value) > 0) ){
						suma12= parseFloat((parseFloat(document.registro.montoSolicitud01.value)+ parseFloat(document.registro.montoSolicitud07.value))).toFixed(2);											
						document.registro.total02.value=suma12;
					}else if(parseFloat(document.registro.montoSolicitud01.value) >= 0){						
						suma12= parseFloat((parseFloat(document.registro.montoSolicitud01.value))).toFixed(2);
						document.registro.total02.value=suma12;
					}else if(parseFloat(document.registro.montoSolicitud07.value) >= 0){						
						suma12= parseFloat((parseFloat(document.registro.montoSolicitud07.value))).toFixed(2);
						document.registro.total02.value=suma12;
					}
					
					if((parseFloat(document.registro.montoSolicitud02.value) >= 0) && (parseFloat(document.registro.montoSolicitud08.value) >= 0) ){
						suma13= parseFloat((parseFloat(document.registro.montoSolicitud02.value)+ parseFloat(document.registro.montoSolicitud08.value))).toFixed(2);											
						document.registro.total05.value=suma13;
					}else if(parseFloat(document.registro.montoSolicitud02.value) >= 0){						
						suma13= parseFloat((parseFloat(document.registro.montoSolicitud02.value))).toFixed(2);
						document.registro.total05.value=suma13;
					}else if(parseFloat(document.registro.montoSolicitud08.value) >= 0){						
						suma13= parseFloat((parseFloat(document.registro.montoSolicitud08.value))).toFixed(2);
						document.registro.total05.value=suma13;
					}
					
					
					if((parseFloat(document.registro.montoSolicitud03.value) >= 0) && (parseFloat(document.registro.montoSolicitud09.value) >= 0) ){
						suma14= parseFloat((parseFloat(document.registro.montoSolicitud03.value)+ parseFloat(document.registro.montoSolicitud09.value))).toFixed(2);											
						document.registro.total08.value=suma14;
					}else if(parseFloat(document.registro.montoSolicitud03.value) >= 0){						
						suma14= parseFloat((parseFloat(document.registro.montoSolicitud03.value))).toFixed(2);
						document.registro.total08.value=suma14;
					}else if(parseFloat(document.registro.montoSolicitud09.value) >= 0){						
						suma14= parseFloat((parseFloat(document.registro.montoSolicitud09.value))).toFixed(2);
						document.registro.total08.value=suma14;
					}			
						
					porcentaje13= parseFloat((parseFloat(suma9) / parseFloat(suma12)) * 100).toFixed(2);											
					document.registro.total03.value=porcentaje13;
					
					porcentaje14= parseFloat((parseFloat(suma10) / parseFloat(suma13)) * 100).toFixed(2);											
					document.registro.total06.value=porcentaje14;
					
					porcentaje15= parseFloat((parseFloat(suma11) / parseFloat(suma14)) * 100).toFixed(2);											
					document.registro.total09.value=porcentaje15;
					
					porcentaje16= parseFloat((parseFloat(suma11) / parseFloat(suma14)) * 100).toFixed(2);											
					document.registro.resumenEntregable02.value=porcentaje16;
				}
				
				function soloNumeros(e){
					var key = window.Event ? e.which : e.keyCode
					return ((key >= 48 && key <= 57) || (key==8) || (key==46) )
				}
			 </script>
			
			
  	</body>
  </html>
  </cfoutput>