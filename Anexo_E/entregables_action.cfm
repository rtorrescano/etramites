<cfset Hoy = CreateODBCDateTime(Now())>
<cfif IsDefined("url.borrar")>
	<cfquery datasource="etramites" name="inserta">
		delete from entregables_ae 
		where id_entregableae=#url.registro#
		and id_registroae = #url.id_user#
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#url.id_user#">
<cfelse>
	<cfquery datasource="etramites" name="inserta">
		Insert into entregables_ae (id_registroae,con_entregable,ent_original,ent_modificado,costo_original, costo_modificado,justificacion, fecha_registro)
		Values (#form.id_user#, '#form.conceptoEntregable#', '#form.entregableOriginal#', '#form.entregableModificado#', '#form.costoentregableOriginal#', '#form.costoEntregableModificado#','#form.justificacionModificacion#',  #hoy#)
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">	

</cfif>