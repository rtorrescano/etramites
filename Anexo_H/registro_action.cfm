<cfset Hoy = CreateODBCDateTime(Now())>
<cfif #form.id_user# eq 0>
	<cfquery name="nuevo_registro" datasource="etramites">
		Insert into registro (razon_social, nombre, ap_paterno, ap_materno, rfc, entidad, folio_proyecto, responsable_seguimiento, fecha_convenio, nombre_proyecto, numero_electronico,
							correo, lada1, telefono_fijo, lada2, telefono_movil, pagina_web, periodo_inicio, periodo_fin, tipo_reporte, resoluciones, beneficiario, objetivo_general,
							objetivo_especifico, finalidades_adicionales, fecha_registro)
		Values ('#form.denominacion#', '#form.nombre#', '#form.paterno#', '#form.materno#', '#form.rfc#', #form.entidad#, '#form.folio#', '#form.responsables#', '#LSDateFormat(form.calendar1, "yyyy/mm/dd")#', 
				'#form.proyecto#', '#form.num_id#', '#form.correo#', '#form.lada#', '#form.fijo#', '#form.ext#', '#form.movil#', '#form.web#', 
				'#LSDateFormat(form.calendar2, "yyyy/mm/dd")#', '#LSDateFormat(form.calendar3, "yyyy/mm/dd")#', '#form.radio1#', '#form.historial#', '#form.beneficiario#', '#form.general#', '#form.especifico#', '#form.acepto#', #hoy#)
	</cfquery>
	<cfquery name="registro" datasource="etramites">
		select registro_id from registro
		where rfc = '#rfc#'
		and folio_proyecto = '#form.folio#'
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#registro.registro_id#">	
<cfelse>
	<cfquery name="nuevo_registro" datasource="etramites">
		update registro set  
		razon_social='#form.denominacion#', 
		nombre='#form.nombre#', 
		ap_paterno='#form.paterno#', 
		ap_materno='#form.materno#', 
		rfc='#form.rfc#', 
		entidad=#form.entidad#, 
		folio_proyecto='#form.folio#', 
		responsable_seguimiento='#form.responsables#', 
		fecha_convenio='#LSDateFormat(form.calendar1, "yyyy/mm/dd")#', 
		nombre_proyecto='#form.proyecto#', 
		numero_electronico='#form.num_id#',
		correo='#form.correo#', 
		lada1='#form.lada#', 
		telefono_fijo='#form.fijo#', 
		lada2='#form.ext#', 
		telefono_movil='#form.movil#', 
		pagina_web='#form.web#', 
		periodo_inicio='#LSDateFormat(form.calendar2, "yyyy/mm/dd")#', 
		periodo_fin='#LSDateFormat(form.calendar3, "yyyy/mm/dd")#', 
		tipo_reporte='#form.radio1#', 
		resoluciones='#form.historial#', 
		beneficiario='#form.beneficiario#', 
		objetivo_general='#form.general#',
		objetivo_especifico='#form.especifico#', 
		finalidades_adicionales='#form.acepto#', 
		fecha_registro=#hoy#
		where registro_id = #form.id_user#		
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">
</cfif>

