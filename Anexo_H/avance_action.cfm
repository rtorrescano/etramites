<cfset Hoy = CreateODBCDateTime(Now())>
<cfif IsDefined("url.borrar")>
	<cfquery datasource="etramites" name="borra">
		delete from avance_entregables 
		where id_avanceent=#url.registro#
		and id_registro = #url.id_user#
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#url.id_user#">
<cfelse>

	<cfquery datasource="etramites" name="inserta">
		Insert into avance_entregables (id_registro,clave,valor_objetivo,actual,porcentaje_ponderacion, fecha_registro)
		Values (#form.id_user#, '#form.clave02#', '#form.valorObjetivo02#', '#form.actual02#', '#form.ponderacion02#',  #hoy#)
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">	

</cfif>