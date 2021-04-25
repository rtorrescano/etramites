<cfset Hoy = CreateODBCDateTime(Now())>
<cfif IsDefined("url.borrar")>
	<cfquery datasource="etramites" name="borra">
		delete from comprobante_egresos 
		where id_comprobante=#url.registro#
		and id_registro = #url.id_user#
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#url.id_user#">
<cfelse>

	<cfquery datasource="etramites" name="inserta">
		Insert into comprobante_egresos (id_registro, clave, concepto, num_comprobantes, rfc, monto_factura, monto_prosoft, fecha_registro)
		Values (#form.id_user#, '#form.clave05#', '#form.concepto05#', '#form.comprobante05#', '#form.rfc05#', '#form.montoFactura05#','#form.montoPagado05#', #hoy#)
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#form.id_user#">	

</cfif>