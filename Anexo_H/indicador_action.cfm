<cfset Hoy = CreateODBCDateTime(Now())>
<cfif IsDefined("url.borrar")>
	<cfquery datasource="etramites" name="borra">
		delete from indicadores_impacto 
		where id_indicadores=#url.registro#
		and id_registro = #url.id_user#
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#url.id_user#">
<cfelse>
	<cfquery datasource="etramites" name="inserta">
		Insert into indicadores_impacto (id_registro,clave,indicador,valor, fecha_registro)
		Values (#form.id_user#, '#form.clave03#', '#form.indicador03#', '#form.valor03#', #hoy#)
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">	

</cfif>