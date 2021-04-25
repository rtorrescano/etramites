<cfset Hoy = CreateODBCDateTime(Now())>
<cfquery name="consulta" datasource="etramites">
	select * from resumen_avances
	where id_registro = #form.id_user#
</cfquery>
<cfif #montoEjercido01# eq ''>
	<cfset montoe1=0>
<cfelse>
	<cfset montoe1=#montoEjercido01#>
</cfif>
<cfif #montoEjercido02# eq ''>
	<cfset montoe2=0>
<cfelse>
	<cfset montoe2=#montoEjercido02#>
</cfif>
<cfif #montoSolicitud01# eq ''>
	<cfset montos1=0>
<cfelse>
	<cfset montos1=#montoSolicitud01#>
</cfif>
<cfif #montoSolicitud02# eq ''>
	<cfset montos2=0>
<cfelse>
	<cfset montos2=#montoSolicitud02#>
</cfif>
<cfif #montoEjercido07# eq ''>
	<cfset montoe7=0>
<cfelse>
	<cfset montoe7=#montoEjercido07#>
</cfif>
<cfif #montoEjercido08# eq ''>
	<cfset montoe8=0>
<cfelse>
	<cfset montoe8=#montoEjercido08#>
</cfif>
<cfif #montoSolicitud07# eq ''>
	<cfset montos7=0>
<cfelse>
	<cfset montos7=#montoSolicitud07#>
</cfif>
<cfif #montoSolicitud08# eq ''>
	<cfset montos8=0>
<cfelse>
	<cfset montos8=#montoSolicitud08#>
</cfif>


<cfif #consulta.recordcount# gt 0>
	<cfquery name="nuevo_registro" datasource="etramites">
		update inversion set  
		monto_ejercido_se1='#montoe1#',
		monto_ejercido_se2='#montoe2#', 
		monto_solicitud_se1='#montos1#',
		monto_solicitud_se2='#montos2#',
		monto_ejercido_ef1='#0#',
		monto_ejercido_ef2='#0#', 
		monto_solicitud_ef1='#0#',
		monto_solicitud_ef2='#0#',
		monto_ejercido_ip1='#montoe7#',
		monto_ejercido_ip2='#montoe8#', 
		monto_solicitud_ip1='#montos7#',
		monto_solicitud_ip2='#montos8#',
		monto_ejercido_a1='#0#',
		monto_ejercido_a2='#0#', 
		monto_solicitud_a1='#0#',
		monto_solicitud_a2='#0#',
		fecha_registro=#hoy#
		where id_registro = #form.id_user#		
	</cfquery>
	<cfquery name="actualiza_registro" datasource="etramites">
		update resumen_avances set  
		avance_fisico='#montoe1#',
		avance_impacto='#montoe2#',
		fecha_registro=#hoy#
		where id_registro = #form.id_user#		
	</cfquery>
	<cflocation url="anexos.cfm?id_user=#form.id_user#">
<cfelse>
	<cfquery name="nuevo_registro" datasource="etramites">
		Insert into inversion (id_registro, monto_ejercido_se1,monto_ejercido_se2, monto_solicitud_se1,monto_solicitud_se2,
		monto_ejercido_ef1,monto_ejercido_ef2, monto_solicitud_ef1,monto_solicitud_ef2,
		monto_ejercido_ip1,monto_ejercido_ip2, monto_solicitud_ip1,monto_solicitud_ip2,
		monto_ejercido_a1,monto_ejercido_a2, monto_solicitud_a1,monto_solicitud_a2,fecha_registro)
		Values ('#form.id_user#', '#montoe1#','#montos1#','#montoe2#','#montos2#','#0#','#0#','#0#',
				'#0#','#montoe7#','#montos7#','#montoe8#','#montos8#','#0#','#0#','#0#',
				'#0#',#hoy#)
	</cfquery>	
	<cfquery name="nuevo_registro1" datasource="etramites">
		Insert into resumen_avances (id_registro, avance_fisico, avance_impacto, fecha_registro)
		Values('#form.id_user#','#form.resumenEntregable01#','#form.resumenEntregable03#',#hoy#)
	</cfquery>
	<cflocation url="anexos.cfm?id_user=#form.id_user#">
</cfif>

