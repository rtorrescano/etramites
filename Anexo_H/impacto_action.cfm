<cfset Hoy = CreateODBCDateTime(Now())>
<cfif IsDefined("url.borrar")>
	<cfquery datasource="etramites" name="borra">
		delete from avance_indicadores 
		where id_avanceent=#url.registro#
		and id_registro = #url.id_user#
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#url.id_user#">
<cfelse>

	<cfquery datasource="etramites" name="inserta">
		Insert into avance_indicadores (id_registro,clave,valor_objetivo,valor_actual,porcentaje_ponderacion, fecha_registro)
		Values (#form.id_user#, '#form.clave04#', '#form.valorObjetivo04#', '#form.actual04#', '#form.ponderacion04#',  #hoy#)
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">	

</cfif>