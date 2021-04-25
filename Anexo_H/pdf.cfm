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
<cfelse>
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
</cfif>
<cfquery datasource="etramites" name="consulta01">
	select * from listado_entregables
	where id_registro =#url.id_user#
</cfquery>
<cfquery datasource="etramites" name="consulta02">
	select * from avance_entregables
	where id_registro =#url.id_user#
</cfquery>
<cfquery datasource="etramites" name="consulta03">
	select * from indicadores_impacto
	where id_registro =#url.id_user#
</cfquery>
<cfquery datasource="etramites" name="consulta04">
	select * from avance_indicadores
	where id_registro =#url.id_user#
</cfquery>
<cfquery datasource="etramites" name="consulta05">
	select * from comprobante_egresos
	where id_registro =#url.id_user#
</cfquery>
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
	<cfset resumenentregable1=''>
	<cfset resumenentregable3=''>
</cfif>

<cfcontent type="application/pdf">
<cfheader name="Content-Disposition" value="attachment;filename=SE-FO-06-018.pdf">
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
				<td align="center" style="font-family: times, serif; font-size:20pt;" colspan="15" cellpadding="15">Anexo H: Reporte de avance y/o final del Apoyo del Programa para el Desarrollo de la Industria del Software (PROSOFT) y la Innovaci&oacute;n</td>				
			</tr>
		</table>
		<table cellspacing="0" border="1" style="width:100%">			
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="40%" cellpadding="15">Homoclave del formato</td>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="60%" cellpadding="15">* Fecha de publicaci&oacute;n del formato en el DOF</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:18pt;" cellpadding="15" width="40%">SE-FO-06-018</td>
				<td align="center" style="font-family: times, serif; font-size:18pt;" width="60%" cellpadding="15">  |  |    </td>
			</tr>
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="40%">Folio del proyecto <font style="font-family: times, serif; font-size:10pt;">(Uso exclusivo de la SE)</font></td>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:18pt;" width="60%">Fecha de solicitud del tr&aacute;mite</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:18pt;" cellpadding="15" width="40%">#folio#</td>
				<td  align="center" style="font-family: times, serif; font-size:18pt;" cellpadding="15" width="60%">#fconvenio#<br><font style="font-family: times, serif; font-size:10pt;">DD | MM | AAAA</font></td>
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
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Nombre de la persona representante legal o apoderado(a) legal:</td></tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" width="25%">Nombre(s):  #nombre#</td>
				<td style="font-family: times, serif; font-size:16pt;" width="35%" colspan="2">Primer apellido:  #ap_pat#</td>
				<td style="font-family: times, serif; font-size:16pt;" width="30%">Segundo_apellido:  #ap_mat#</td>
			</tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">R.F.C. con homoclave:  #rfc#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Entidad Federativa:  #entidad#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Responsables de seguimiento:  #responsable#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Fecha de firma del convenio de asignaci&oacute;n: #fconvenio#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Folio del proyecto:  #folio#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">Nombre del proyecto:  #nombrep#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="4">N&uacute;mero de identificaci&oacute;n Electr&oacute;nico (antes usuario):  #num_elec#</td></tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">Lada: #lada1#</td>
				<td style="font-family: times, serif; font-size:16pt;">Tel&eacute;fono fijo:  #tf#</td>
				<td style="font-family: times, serif; font-size:16pt;" width="15%">Extensi&oacute;n:  #lada2#</td>
				<td style="font-family: times, serif; font-size:16pt;">Tel&eacute;fono movil:  #tm#</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" colspan="2">Correo electr&oacute;nico:  #correo#</td>
				<td style="font-family: times, serif; font-size:16pt;" colspan="2">P&aacute;gina web (opcional):  #web#</td>
			</tr>
			<tr><td style="font-family: times, serif; font-size:12pt; font-style:italic" cellpadding="15" colspan="4"><img src="img/paloma.jpg"><b>Le&iacute; el aviso de privacidad que se encuentra en la secci&oacute;n de T&eacute;rminos y Condiciones de este formato.</b></td></tr>
			<tr><td style="font-family: times, serif; font-size:10pt; font-style:italic" cellpadding="15" colspan="4" align="center">De conformidad con los art&iacute;culos 4 de la Ley Federal de Procedimiento Administrativo y 46 fracci&oacute;n VII de la Ley General de Mejora Regulatoria, los formatos para solicitar tr&aacute;mites y servicios deber&aacute;n publicarse en el Diario Oficial de la Federaci&oacute;n (DOF).</td></tr>
    	</table>
    	<br>
    	<table cellspacing="0" style="width:100%">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;">II. Tipo de reporte</td>
			</tr>		
		</table>
		<br>
		<table cellspacing="0" border="1" style="width:100%" cellpadding="10">			
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="2">Periodo que reporta:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">Del:  #pinicio#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">Al:  #pfin#</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">Tipo del reporte: </td>
				<td style="font-family: times, serif; font-size:16pt;">Avance:  <cfif #treporte# eq '1erSem'><img src="img/seleccion.jpg"></cfif></td>
				<td style="font-family: times, serif; font-size:16pt;">2&deg;. Avance:  <cfif #treporte# eq '2doSem'><img src="img/seleccion.jpg"></cfif></td>
				<td style="font-family: times, serif; font-size:16pt;">Final:  <cfif #treporte# eq 'Final'><img src="img/seleccion.jpg"></cfif></td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" colspan="4">Historial de resoluciones sobre el reporte (sistema):  #res#</td>				
			</tr>			
    	</table>
    	<br>
		<table cellspacing="0" border="1" style="width:100%" cellpadding="10">			
			<tr>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">Beneficiario:  #beneficiario#</td>
								
			</tr>			
    	</table>
    	<br>
    	<table cellspacing="0" style="width:100%">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;">III. Informaci&oacute;n ejecutiva del proyecto</td>
			</tr>		
		</table>
		<br>
		<table cellspacing="0" border="1" style="width:100%" cellpadding="10">			
			<tr><td style="font-family: times, serif; font-size:16pt;" colspan="4">Objetivo general:  #obgral#</td></tr>
			<tr><td style="font-family: times, serif; font-size:16pt;" colspan="4">Objetivo espec&iacute;fico:  #obesp#</td></tr>			
    	</table>
    	<br>
    	<table cellspacing="0" border="1" style="width:100%" cellpadding="10">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="6">IV. Entregables</td>
			</tr>
			<cfif consulta01.recordcount gt 0>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="6">Listado de Entregables</td>
				</tr>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2"> Rubro </td>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2"> Concepto </td>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2"> Entregable </td>
				</tr>
				<cfloop query="consulta01">
					<tr>
						<td align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">#rubro#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">#concepto#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">#entregable#</td>
					</tr>
				</cfloop>
				</tr>
			</cfif>		
			
			<cfif consulta02.recordcount gt 0>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="6">Avance de Entregables</td>
				</tr>
				<tr>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> Valor objetivo </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> Actual </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> % de avance actual </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> % de ponderaci&oacute;n </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> % Sobre meta total (%avance * % de ponderaci&oacute;n) </td>					
				</tr>
				<cfloop query="consulta02">
					<tr>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#valor_objetivo#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#actual#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;"><cfset avance=#valor_objetivo#/#actual#>#avance# %</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#porcentaje_ponderacion#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;"><cfset meta=#avance#*#porcentaje_ponderacion#>#meta# %</td>
					</tr>
				</cfloop>
			</cfif>
			
			<cfif consulta03.recordcount gt 0>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="6">Indicadores de impacto</td>
				</tr>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="3"> Indicador </td>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="3"> Valor </td>		
				</tr>
				<cfloop query="consulta03">
					<tr>
						<td align="center" style="font-family: times, serif; font-size:20pt;" colspan="3">#indicador#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;" colspan="3">#valor#</td>
					</tr>
				</cfloop>
			</cfif>											
			
			<cfif consulta04.recordcount gt 0>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="6">Avance de Indicadores de Impacto</td>
				</tr>
				<tr>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> Valor objetivo </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> Actual </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> % de avance actual </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> % de ponderaci&oacute;n </td>
					<td align="center" style="font-family: times, serif; font-size:20pt;"> % Sobre meta total (%avance * % de ponderaci&oacute;n) </td>					
				</tr>
				<cfloop query="consulta04">
					<tr>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#valor_objetivo#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#valor_actual#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;"><cfset avance=#valor_objetivo#/#valor_actual#>#avance# %</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#porcentaje_ponderacion#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;"><cfset meta=#avance#*#porcentaje_ponderacion#>#meta# %</td>
					</tr>
				</cfloop>
			</cfif>
			
		</table>
		<br>
		<table  cellspacing="0" border="1" style="width:100%" cellpadding="10">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="5">V. Comprobantes de Egresos (l&iacute;quidos)</td>
			</tr>	
			
			<cfif consulta05.recordcount gt 0>
				<tr>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;"> Concepto </td>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;"> N&uacute;mero de comprobante </td>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;"> R.F.C. con homoclave del emisor </td>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;"> Montos de facturas </td>
					<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;"> Monto pagado por chequera fondo PROSOFT </td>					
				</tr>
				<cfloop query="consulta05">
					<tr>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#concepto#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#num_comprobantes#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#RFC#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#monto_factura#</td>
						<td align="center" style="font-family: times, serif; font-size:20pt;">#monto_prosoft#</td>						
					</tr>
				</cfloop>
			</cfif>	
		</table>
		<br>
		
		

		<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="10">VI. Total de Inversi&oacute;n</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15" rowspan="2">Concepto:</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="3">Inversi&oacute;n l&iacute;quida:</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="3">Inversi&oacute;n no l&iacute;quida:</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15" colspan="3">Inversi&oacute;n Total:</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Monto ejercido</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Monto solicitud</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">% Ejercido</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Monto ejercido</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Monto solicitud</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">% Ejercido</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Monto ejercido</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Monto solicitud</td>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">% Ejercido</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Secretar&iacute;a de Econom&iacute;a:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#ejse1#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#solse1#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#porse1# %</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#ejse2#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#solse2#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#porse2# %</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#ejse3#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#solse3#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#porse3# %</td>
			</tr>
			<tr>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Iniciativa privada:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#ejip1#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#solip1#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#porip1# %</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#ejip2#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#solip2#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#porip2# %</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#ejip3#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#solip3#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#porip3# %</td>
			</tr>			
			<tr>
				<td align="center" style="font-family: times, serif; font-size:16pt;" cellpadding="15">Total:</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total1#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total2#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total3# %</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total4#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total5#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total6# %</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total7#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total8#</td>
				<td style="font-family: times, serif; font-size:16pt;" cellpadding="15">#total9# %</td>
			</tr>
    	</table>
    	<br>
    	<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">VII. Resumen de avances</td>
			</tr>		
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">Concepto: </td>
				<td style="font-family: times, serif; font-size:16pt;">Avance: </td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">Avance f&iacute;sico (entregables): </td>
				<td style="font-family: times, serif; font-size:16pt;"> #resumenentregable1# %</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">Avance financiero (egresos l&iacute;quidos y en especie): </td>
				<td style="font-family: times, serif; font-size:16pt;"> #total9# %</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">Avance de impacto (indicadores): </td>
				<td style="font-family: times, serif; font-size:16pt;"> #resumenentregable3# %</td>
			</tr>			
    	</table>
    	<br>
    	<table cellspacing="0" style="width:100%" border="1">
			<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">Instrucciones de llenados</td>
			</tr>		
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">
					
					1. Este formato se debe llenar directamente en el sistema inform&aacute;tico del programa en la liga <a href="https://www.gob.mx/se/es/acciones-yprogramas/industria-y-comercio" target="_blank">https://www.gob.mx/se/es/acciones-yprogramas/industria-y-comercio</a> y/o en <a href="https://prosoft.economia.gob.mx/" target="_blank">https://prosoft.economia.gob.mx/</a><br>
					2. Se env&iacute;a para revisi&oacute;n de la Instancia Ejecutora de la Secretar&iacute;a de Econom&iacute;a a trav&eacute;s del sistema inform&aacute;tico del programa.<br>
					3. Se deben respetar las &aacute;reas destinadas para uso exclusivo de la Secretar&iacute;a de Econom&iacute;a.<br>
					4. En caso de los partados IV y V se podr&aacute;n agregar tantas filas como sean necesarias.<br><br>
					
					<b>Tr&aacute;mite al que corresponde la forma:</b> Reporte de avance y/o final del apoyo del PROSOFT<br>
					<b>N&uacute;mero del Registro Federal de Tr&aacute;mites y Servicios:</b> SE-06-018<br>
					<b>Fecha de autorizaci&oacute;n de la forma por parte de la Oficial&iacute;a Mayor:</b> 22/02/2019<br>
					<b>Fecha de autorizaci&oacute;n de la forma por parte de la Comisi&oacute;n Federal de Mejora Regulatoria:</b><br><br>
					 
					<b>Fundamento jur&iacute;dico-administrativo:</b> Reglas de Operaci&oacute;n del Programa para el Desarrollo de la Industria de Software (PROSOFT) y la Innovaci&oacute;n para el Ejercicio Fiscal 2019.<br><br>
					<b>Documentos que deben anexarse al presente formato:</b><br>
						- La documentaci&oacute;n soporte debe estar de acuerdo a los requerimientos y formatos establecidos en las Reglas de Operaci&oacute;n y Criterios de Operaci&oacute;n del PROSOFT vigentes.
						- La documentaci&oacute;n comprobatoria de los reportes de avance y/o final debe adjuntarse en formato "PDF" y comprimidos en formato "ZIP".<br><br>

					No existe un horario establecido para el llenado y entrega del formato toda vez que &eacute;ste se realiza en l&iacute;nea. No obstante, debe apegarse a las fechas y plazos establecidos en las Reglas de Operaci&oacute;n del PROSOFT.<br><br>
					<b>Tiempo de respuesta:</b><br><br>
					45 d&iacute;as h&aacute;biles, en caso de no recibir respuesta en el plazo mencionado, debe considerarse como rechazada.<br>
					Para el plazo de prevenci&oacute;n de informaci&oacute;n faltante de la persona moral solicitante, la IE deber&aacute; requerirla dentro del primer tercio del plazo de respuesta (tiempo de respuesta).<br><br>
					<b>Tel&eacute;fonos y correos para quejas:</b><br><br>
					<ul>
						<li><b>&Oacute;rgano Interno de Control en la Secretar&iacute;a de Econom&iacute;a:</b> 56-29-95-52 (Directo) o 56-29-95-00 Ext. 21200, 21214, 21233 y 21247. Con horario de atenci&oacute;n de lunes a viernes de 9:00 a 18:00 horas. Correo electr&oacute;nico <a href="mailto:quejas.denuncias@economia.gob.mx">quejas.denuncias@economia.gob.mx</a>.</li>
						<li><b>Centro de Atenci&oacute;n de Quejas y Denuncias de la Secretar&iacute;a de la Funci&oacute;n P&uacute;blica:</b> 2000-3000. Ext. 2164, 2000-2000 y/o 018001128700. Correo electr&oacute;nico:  <a href="mailto:contactociudadano@funcionpublica.gob.mx">contactociudadano@funcionpublica.gob.mx</a></li>
					</ul>
					<br><br>
					
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
				</td>
			</tr>	
		</table>
    	<br>
    	<table cellspacing="0" style="width:100%" border="1">
    		<tr>
				<td bgcolor="##DDDDDD" align="center" style="font-family: times, serif; font-size:20pt;" colspan="2">T&eacute;rminos y condiciones</td>
			</tr>
			<tr>
				<td style="font-family: times, serif; font-size:16pt;">
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