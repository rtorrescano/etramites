<cfset Hoy = CreateODBCDateTime(Now())>
<cfif IsDefined("url.borrar")>
	<cfquery datasource="etramites" name="inserta">
		delete from listado_entregables 
		where id_entregable=#url.registro#
		and id_registro = #url.id_user#
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#url.id_user#">
<cfelse>
	<cfquery datasource="etramites" name="inserta">
		Insert into listado_entregables (id_registro,clave,rubro,concepto,entregable, fecha_registro)
		Values (#form.id_user#, '#form.clave01#', '#form.rubro01#', '#form.concepto01#', '#form.entregable01#', #hoy#)
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">	

</cfif>