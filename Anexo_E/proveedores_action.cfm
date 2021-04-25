<cfset Hoy = CreateODBCDateTime(Now())>
<cfquery name="consulta_anexos" datasource="etramites">
	Select * from proveedores
	where id_registroae=#form.id_user#
</cfquery>
<cfif consulta_anexos.recordcount gt 0>
	<cfquery name="nuevo_registro" datasource="etramites">
		update proveedores set  
		nombre_proveedor='#form.denominacion#',
		justificacion='#form.justificacion#',
		aclaracion='#form.aclaracion#',
		solicitudes='#form.solicitudes#', 
		fecha_registro=#hoy#
		where id_registroae = #form.id_user#		
	</cfquery>
	<cflocation url="documentos.cfm?id_user=#form.id_user#">
<cfelse>
	<cfquery name="nuevo_registro" datasource="etramites">
		Insert into proveedores (id_registroae, nombre_proveedor, justificacion, aclaracion,solicitudes, fecha_registro)
		Values ('#form.id_user#','#form.denominacion#', '#form.justificacion#', '#form.aclaracion#', '#form.solicitudes#', #hoy#)
	</cfquery>
	<cflocation url="documentos.cfm?id_user=#form.id_user#">	
</cfif>

