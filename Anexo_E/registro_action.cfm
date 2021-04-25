<cfset Hoy = CreateODBCDateTime(Now())>
<cfif #form.id_user# eq 0>
	<cfquery name="nuevo_registro" datasource="etramites">
		Insert into registro_ae (razon_social, nombre, ap_paterno, ap_materno, rfc,  folio_proyecto, fecha_convenio, nombre_proyecto, numero_electronico,
							correo, lada1, telefono_fijo, lada2, telefono_movil, mod_sol, justificacion,fecha_cierre, fecha_original, fecha_propuesta,
							num_prorrogas, finalidades_adicionales, fecha_registro)
		Values ('#form.denominacion#', '#form.nombre#', '#form.paterno#', '#form.materno#', '#form.rfc#', '#form.folio#', '#LSDateFormat(form.calendar1, "yyyy/mm/dd")#', 
				'#form.proyecto#', '#form.num_id#', '#form.correo#', '#form.lada#', '#form.fijo#', '#form.ext#', '#form.movil#', 
				 '#form.modificacion#','#form.justi#','#LSDateFormat(form.calendar2, "yyyy/mm/dd")#', '#LSDateFormat(form.calendar3, "yyyy/mm/dd")#', '#LSDateFormat(form.calendar4, "yyyy/mm/dd")#', 
				 '#form.npro#','#form.acepto#', #hoy#)
	</cfquery>
	<cfquery name="registro" datasource="etramites">
		select registroae_id from registro_ae
		where rfc = '#rfc#'
		and folio_proyecto = '#form.folio#'
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#registro.registroae_id#">	
<cfelse>
	<cfquery name="nuevo_registro" datasource="etramites">
		update registro_ae set  
		razon_social='#form.denominacion#', 
		nombre='#form.nombre#', 
		ap_paterno='#form.paterno#', 
		ap_materno='#form.materno#', 
		rfc='#form.rfc#',  
		folio_proyecto='#form.folio#', 
		fecha_convenio='#LSDateFormat(form.calendar1, "yyyy/mm/dd")#', 
		nombre_proyecto='#form.proyecto#', 
		numero_electronico='#form.num_id#',
		correo='#form.correo#', 
		lada1='#form.lada#', 
		telefono_fijo='#form.fijo#', 
		lada2='#form.ext#', 
		telefono_movil='#form.movil#', 
		mod_sol='#form.modificacion#',
		justificacion='#form.justi#',
		fecha_cierre='#LSDateFormat(form.calendar2, "yyyy/mm/dd")#', 
		fecha_original='#LSDateFormat(form.calendar3, "yyyy/mm/dd")#',
		fecha_propuesta='#LSDateFormat(form.calendar4, "yyyy/mm/dd")#', 
		num_prorrogas='#form.npro#', 
		finalidades_adicionales='#form.acepto#', 
		fecha_registro=#hoy#
		where registroae_id = #form.id_user#		
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">
</cfif>

