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
	<cfset fc='#LSDateFormat(registro.fecha_cierre, "mm/dd/yyyy")#'>
	<cfset fo='#LSDateFormat(registro.fecha_original, "mm/dd/yyyy")#'>
	<cfset fp='#LSDateFormat(registro.fecha_propuesta, "mm/dd/yyyy")#'>
	<cfset np='#registro.num_prorrogas#'>
	<cfset finadic='#registro.finalidades_adicionales#'>
	
	<cfquery name="proveedor" datasource="etramites">
		select * from proveedores
		where id_registroae = #url.id_user#
	</cfquery>
	<cfset nompro='#proveedor.nombre_proveedor#'>
	<cfset juspro='#proveedor.justificacion#'>
	<cfset aclapro='#proveedor.aclaracion#'>
	<cfset solpro='#proveedor.solicitudes#'>
	
	<cfquery name="docto" datasource="etramites">
		select * from documentosae
		where id_registroae = #url.id_user#
	</cfquery>	
	<cfset curricula='#docto.curricula#'>
	<cfset ruta='#docto.ruta#'>
	
<cfelse>
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
	<cfset fc=''>
	<cfset fo=''>
	<cfset fp=''>
	<cfset np=''>
	<cfset finadic=''>		
	<cfset nompro=''>
	<cfset juspro=''>
	<cfset aclapro=''>
	<cfset solpro=''>
	<cfset curricula=''>
	<cfset ruta=''>
</cfif>
<cfquery datasource="etramites" name="consulta01">
	select * from entregables_ae
	where id_registroae =#url.id_user#
</cfquery>


<cfcontent type="application/pdf">
<cfheader name="Content-Disposition" value="attachment;filename=SE-FO-06-027.pdf">
<cfdocument format="pdf">
<cfdocumentitem type="footer"> 
	<cfoutput>P&aacute;gina #cfdocument.currentpagenumber# de #cfdocument.totalpagecount#</cfoutput> 
</cfdocumentitem> 
	<cfoutput>		
		<table cellspacing="0">
			<tr>
				<td colspan="15" bgcolor="##393C3E"><img src="img/titulo.jpg" width="1150pt"></td>
			</tr>
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="15">Secretar&iacute;a de Econom&iacute;a <br> Direcci&oacute;n General de Innovaci&oacute;n, Servicios y Comercio Interior</td>				
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:20pt;" colspan="15" cellpadding="15">Anexo E: Solicitud de modificaciones a los proyectos aprobados por el programa para el desarrollo de la industria de software (PROSOFT) y la innovaci&oacute;n para el ejercicio fiscal 2019</td>				
			</tr>
		</table>
		<table cellspacing="0" border="1" style="width:100%">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="40%" cellpadding="15">Homoclave del formato</td>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="60%" cellpadding="15">* Fecha de publicaci&oacute;n del formato en el DOF</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:18pt;" cellpadding="15" width="40%">SE-FO-06-027</td>
				<td align="center" style="font-family: times, serif; font-size:18pt;" width="60%" cellpadding="15">  |  |    </td>
			</tr>
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="40%">Folio del proyecto <font style="font-family: times, serif; font-size:10pt;">(Uso exclusivo de la SE)</font></td>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="60%">Fecha de solicitud del tr&aacute;mite</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:18pt;" cellpadding="15" width="40%"></td>
				<td  align="center" style="font-family: times, serif; font-size:18pt;" cellpadding="15" width="60%"><br><font style="font-family: times, serif; font-size:10pt;">DD | MM | AAAA</font></td>
			</tr>
    	</table>
    	<br>
    	<table cellspacing="0" style="width:100%">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;">I. Datos generales</td>
			</tr>		
		</table>
		<br>
		<table cellspacing="0" border="1" style="width:100%" cellpadding="10">			
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Raz&oacute;n Social: #rz#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Nombre(s) de la persona representante(s) o apoderada(s) legal(es):</td></tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" width="25%">Nombre(s):  #nombre#</td>
				<td style="font-family: times, serif; font-size:16pt;" width="35%" colspan="2">Primer apellido:  #ap_pat#</td>
				<td style="font-family: times, serif; font-size:16pt;" width="30%">Segundo_apellido:  #ap_mat#</td>
			</tr>			
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Fecha de firma del convenio de asignaci&oacute;n: #fconvenio#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Folio del proyecto:  #folio#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Nombre del proyecto:  #nombrep#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">R.F.C. con homoclave:  #rfc#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">N&uacute;mero de identificaci&oacute;n Electr&oacute;nico (N° de registro en el sistema):  #num_elec#</td></tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">Lada: #lada1#</td>
				<td style="font-family: times, serif; font-size:16pt;" colspan="2">Tel&eacute;fono fijo:  #tf#</td>
				<td style="font-family: times, serif; font-size:16pt;" width="15%">Extensi&oacute;n:  #lada2#</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" colspan="2">Tel&eacute;fono movil:  #tm#</td>
				<td style="font-family: times, serif; font-size:16pt;" colspan="2">Correo electr&oacute;nico:  #correo#</td>			
			</tr>
		</table>
    	<br>
    	<table cellspacing="0" style="width:100%">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;">II. Informaci&oacute;n del tr&aacute;mite</td>
			</tr>		
		</table>
		<br>
		<table cellspacing="0" border="1" style="width:100%" cellpadding="10">			
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Modificaci&oacute;n solicitada:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">#ms#</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Justificaci&oacute;n:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">#jus#</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Fecha del cierre original:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">#fc#</td>
			</tr>	
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Fecha propuesta para cierre (Pr&oacute;rroga):</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">#fp#</td>
			</tr>	
			<tr><td style="font-family: times, serif; font-size:12pt; font-style:italic" cellpadding="15" colspan="4"><img src="img/paloma.jpg"><b>Le&iacute; el aviso de privacidad que se encuentra en la secci&oacute;n de T&eacute;rminos y Condiciones de este formato.</b></td></tr>
			<tr><td style="font-family: times, serif; font-size:10pt; font-style:italic" cellpadding="15" colspan="4" align="center">De conformidad con los art&iacute;culos 4 de la Ley Federal de Procedimiento Administrativo y 46 fracci&oacute;n VII de la Ley General de Mejora Regulatoria, los formatos para solicitar tr&aacute;mites y servicios deber&aacute;n publicarse en el Diario Oficial de la Federaci&oacute;n (DOF).</td></tr>
    	</table>
    	<br>
		<table cellspacing="0" border="1" style="width:100%" cellpadding="10">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="6">III. Entregables</td>
			</tr>
			<cfif #consulta01.recordcount# gt 0>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="6">Avance de Entregables</td>
				</tr>
				<tr>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> a) Concepto entregable </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> b) Entregable original </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> c) Entregable modificado </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> d) Costo entregable original </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> e) Costo entregable modificado </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> f) Justificaci&oacute;n de la modificaci&oacute;n </td>					
				</tr>
				<cfloop query="consulta01">
					<tr>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#con_entregable#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#ent_original#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#ent_modificado#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#costo_original#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#costo_modificado#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#justificacion#</td>
					</tr>
				</cfloop>
			</cfif>			
		</table>
		<br>
		<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="10">IV. Proveedor</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Nombre del nuevo proveedor:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">#nompro#</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Curr&iacute;cula del proveedor:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2"><a href="#ruta#/#curricula#">Consulta documento adjunto aqu&iacute;</a></td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Justificaci&oacute;n del cambio:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">#juspro#</td>
			</tr>	
			
    	</table>
    	<br>
    	<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">V. Aclaraci&oacute;n, detallar justificaci&oacute;n y/o motivos de dicha(s) aclaraci&oacute;n(es)</td>
			</tr>		
			<tr>
				<td style="font-family: times, serif; font-size:16pt;"> #proveedor.aclaracion# </td>
			</tr>					
    	</table>
    	<br>
    	<br>
    	<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">VI. Otras solicitudes, detallar justificaci&oacute;n y/o motivos de dicha(s) solicitud(es)</td>
			</tr>		
			<tr>
				<td style="font-family: times, serif; font-size:16pt;"> #proveedor.solicitudes# </td>
			</tr>					
    	</table>
    	<br>
    	<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">Instrucciones de llenado</td>
			</tr>		
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">
					
					1. Este formato se debe llenar directamente en el sistema inform&aacute;tico del programa en la liga <a href="https://www.gob.mx/se/es/acciones-yprogramas/industria-y-comercio" target="_blank">https://www.gob.mx/se/es/acciones-yprogramas/industria-y-comercio</a> y/o en <a href="https://prosoft.economia.gob.mx/" target="_blank">https://prosoft.economia.gob.mx/</a><br>
					2. Se env&iacute;a para revisi&oacute;n de la Instancia Ejecutora de la Secretar&iacute;a de Econom&iacute;a a trav&eacute;s del sistema inform&aacute;tico del programa.<br>
					3. Se deben respetar las &aacute;reas destinadas para uso exclusivo de la Secretar&iacute;a de Econom&iacute;a.<br>
					4. En el M&oacute;dulo II. "Informaci&oacute;n del tr&aacute;mite", se deben requisitar todos los  campos de acuerdo con el tipo de informaci&oacute;n solicitada.<br><br>
					
					<b>Tr&aacute;mite al que corresponde la forma:</b> Solicitud de modificaci&oacute;n a los proyectos aprobados del PROSOFT<br>
					<b>N&uacute;mero del Registro Federal de Tr&aacute;mites y Servicios:</b> SE-06-027<br>
					<b>Fecha de autorizaci&oacute;n de la forma por parte de la Oficial&iacute;a Mayor:</b> 22/02/2019<br>
					<b>Fecha de autorizaci&oacute;n de la forma por parte de la Comisi&oacute;n Federal de Mejora Regulatoria:</b><br><br>
					 
					<b>Fundamento jur&iacute;dico-administrativo:</b> Reglas de Operaci&oacute;n del Programa para el Desarrollo de la Industria de Software (PROSOFT) y la Innovaci&oacute;n para el Ejercicio Fiscal 2019.<br><br>
					<b>Documentos que deben anexarse al presente formato:</b><br>
						a) Para el caso de una modificaci&oacute;n a la fecha de cierre del proyecto; Una vez que la persona moral beneficiaria complete su "Solicitud de modificaciones a los proyectos aprobados por el Programa para el Desarrollo de la Industria de Software (PROSOFT) y la Innovaci&oacute;n para el ejercicio fiscal 2019", en el portal de registro del sistema inform&aacute;tico del PROSOFT, deber&aacute; descargarla y adjuntarla (en formato digital) en el sistema inform&aacute;tico refereido.  
						b) Para el caso de una solicitud de modifcaci&oacute;n a los entregables comprometidos; La documentaci&oacute;n soporte (anexos) debe presentarse conforme a lo establecido en los Criterios de Operaci&oacute;n del PROSOFT vigentes. Una vez que la persona moral beneficiaria complete su "Solicitud de modificaciones a los proyectos aprobadospor el Programa para el Desarrollo de la Industria de Software (PROSOFT) y la Innovaci&oacute;n para el ejercicio fiscal 2019", en el portal de registro del sistema inform&aacute;tico del PROSOFT, deber&aacute; dscargarla y adjuntarla (en formato digital) en el sistema inform&acute;tico refereido.<br><br>

					<b>Tiempo de respuesta:</b><br><br>
					45 d&iacute;as h&aacute;biles, en caso de no recibir respuesta en el plazo mencionado, debe considerarse como rechazada.<br>
					Para el plazo de prevenci&oacute;n de informaci&oacute;n faltante de la persona moral solicitante, la IE deber&aacute; requerirla dentro del primer tercio del plazo de respuesta (tiempo de respuesta).<br><br>
					<b>Tel&eacute;fonos y correos para quejas:</b><br><br>
					<ul>
						<li><b>&Oacute;rgano Interno de Control en la Secretar&iacute;a de Econom&iacute;a:</b> 56-29-95-52 (Directo) o 56-29-95-00 Ext. 21200, 21214, 21233 y 21247. Con horario de atenci&oacute;n de lunes a viernes de 9:00 a 18:00 horas. Correo electr&oacute;nico <a href="mailto:quejas.denuncias@economia.gob.mx">quejas.denuncias@economia.gob.mx</a>.</li>
						<li><b>Centro de Atenci&oacute;n de Quejas y Denuncias de la Secretar&iacute;a de la Funci&oacute;n P&uacute;blica:</b> 2000-3000. Ext. 2164, 2000-2000 y/o 018001128700. Correo electr&oacute;nico:  <a href="mailto:contactociudadano@funcionpublica.gob.mx">contactociudadano@funcionpublica.gob.mx</a></li>
					</ul>
					<br><br>
				</td>
			</tr>
		</table>	
		<br>
    	<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">T&eacute;rminos y Condiciones</td>
			</tr>		
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">					
					<b>Aviso de Privacidad:</b><br><br>
					La Secretar&iacute;a de Econom&iacute;a (SE), a trav&eacute;s sus unidades Administrativas, es la responsable del uso,
					tratamiento y preotecci&oacute;n de los datos personales recabados a trav&eacute;s de los tr&aacute;mites o servicios que usted realice por medio f&iacute;sicos o eletr&oacute;nicos, observando
					integramente  para ello lo previsto en la Ley General  de Protecci&oacute;n de Datos Personales en Posesi&oacute;n de Sujetos
					Obligados (LGPDPPSO) y dem&aacute;s normativa que resulte aplicable.<br><br>

					<b>&iquest;Qu&eacute; datos personales se recaban y con qu&eacute; finalidad?</b><br><br>
					Los datos personales que se recaben ser&aacute;n utilizados para las siguientes finalidades:<br><br>
						<ul>
							<li>Verificar y confirmar su identidad, as&iacute; como la autenticidad de la informaci&oacute;n que nos proporciona, para contar con un registro que permita identificar con precisi&oacute;n a quien solicita el tr&aacute;mite o servicio.</li>
							<li>Acreditar los requisitos necesarios para proveer los tr&aacute;mites o servicios que ofrece la SE.</li>
							<li>Realizar todos los movimientos con motivo del tr&aacute;mite o servicio que solicita desde su ingreso hasta su baja.</li>
							<li>Integrar expedientes y bases de datos necesarias para el otorgamiento y operaci&oacute;n de los servicios que se contraten, as&iacute; como las obligaciones que se deriven de los mismos.</li>
							<li>Mantener una base hist&oacute;rica con fines estad&iacute;sticos.</li>
						</ul>
					De conformidad con el tr&aacute;mite o servicio que se solicita, se utilizar&aacute;n de manera enunciativa m&aacute;s no limitativa los siguientes datos personales:<br><br>
						<ul>
							<li>Datos de identificaci&oacute;n personal: nombre completo, denominaci&oacute;n o raz&oacute;n social, domicilio, tel&eacute;fono (fijo y m&oacute;vil), correo
								electr&oacute;nico, firma aut&oacute;grafa, clave del Registro Federal de Contribuyentes (RFC); Clave &Uacute;nica de Registro de Poblaci&oacute;n
								(CURP), Registro &Uacute;nico de Personas Acreditadas (RUPA), certificado de firma electr&oacute;nica, estado civil, r&eacute;gimen
								matrimonial, edad, fecha de nacimiento, nacionalidad.</li>
							<li>Informaci&oacute;n profesional y laboral.</li>
							<li>Informaci&oacute;n financiera y patrimonial.</li>
						</ul>
					De manera adicional, los datos personales que se recaben, podr&aacute;n ser utilizados en actividades complementarias necesarias
					para la realizaci&oacute;n de las finalidades que se se&ntilde;alan; el tratamiento de datos personales ser&aacute; el que resulte necesario, adecuado
					y relevante en relaci&oacute;n con las finalidades previstas en este Aviso de Privacidad, as&iacute; como con los fines distintos que resulten
					compatibles o complementarios relacionados con los tr&aacute;mites o servicios que se proporcionan.<br><br>
					Si no desea que sus datos personales se utilicen para estas finalidades adicionales, al momento de su registro deber&aacute; manifestar
					su voluntad en sentido contrario. Esto no ser&aacute; motivo ni condicionante para resolver sobre el tr&aacute;mite o servicio que se est&aacute;
					solicitando.<br><br>
					<u>Se informa que no se solicitar&aacute;n datos personales sensibles.</u><br><br>
					Fundamento para el tratamiento de los datos personales.<br>
					La Secretar&iacute;a de Econom&iacute;a dar&aacute; el trato a los datos personales que se recaben a trav&eacute;s del sistema con fundamento en los
					art&iacute;culos 16, 18, 21, 22, 25, 26 y 65 de la Ley General de Protecci&oacute;n de Datos Personales en Posesi&oacute;n de Sujetos Obligados.
					<br><br>
					Transferencia de datos personales.<br>
					Sus datos personales no ser&aacute;n transferidos, difundidos, ni distribuidos, salvo lo se&ntilde;alado en el art&iacute;culo 22 de la Ley General de
					Protecci&oacute;n de Datos Personales en Posesi&oacute;n de Sujetos Obligados o en el caso que exista consentimiento expreso de su parte
					por medio escrito o por un medio de autenticaci&oacute;n similar. S&oacute;lo tendr&aacute;n acceso a esta informaci&oacute;n el titular de los datos, sus
					representantes legales y los servidores p&uacute;blicos facultados para ello.<br><br>
					
					&iquest;D&oacute;nde puedo ejercer mis derechos ARCO?<br><br>
					
					Usted podr&aacute; ejercer los derechos de acceso, correcci&oacute;n/rectificaci&oacute;n, cancelaci&oacute;n u oposici&oacute;n (Derechos ARCO), al tratamiento
					de sus datos personales, mediante un escrito libre dirigido a la Unidad de Transparencia de la Secretar&iacute;a de Econom&iacute;a con
					domicilio en Pachuca 189, Col. Condesa, Demarcaci&oacute;n territorial Cuauht&eacute;moc,Ciudad de M&eacute;xico C.P. 06140, Tel&eacute;fono 57299100, extensi&oacute;n 11362, 
					correo electr&oacute;nico <a href="mailto:unidaddetransparenciase@economia.gob.mx">unidaddetransparenciase@economia.gob.mx</a><br><br>
					
					<b>&iquest;D&oacute;nde puedo consultar el Aviso de privacidad integral de datos personales de la Secretar&iacute;a de Econom&iacute;a?</b><br><br>
					
					Para conocer mayor informaci&oacute;n sobre los t&eacute;rminos y condiciones en que ser&aacute;n tratados sus datos personales, y la forma en que
					deber&aacute; ejercer sus Derechos ARCO, puede consultar el Aviso de Privacidad Integral en la p&aacute;gina: <a href="http://www.gob.mx/se/accionesy-
					programas/del-aviso-de-privacidad-integral-de-la-secretaria-de-economia?state=published" target="_blank">http://www.gob.mx/se/accionesy-
					programas/del-aviso-de-privacidad-integral-de-la-secretaria-de-economia?state=published</a>
				 </td>
			</tr>				
    	</table>
    	<br>
	</cfoutput>
</cfdocument>