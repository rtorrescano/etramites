<CFOUTPUT>
<cfset Hoy = CreateODBCDateTime(Now())>
<cfquery name="consulta" datasource="etramites">
	select * from avance_entregables
	where id_registro = #form.id_user#
</cfquery>
<cfif consulta.recordcount lt 0>
	
	<cfloop list="#IDUA#" INDEX="i" DELIMITERS=",">
		<cfset clave1 = "claveae" & contador> 
		<cfset rubro1 = "rubroae" & contador>
		<cfset concepto1 = "conceptoae" & contador>
		<cfset entregable1 = "entregableae" & contador>
		<cfquery datasource="SAS2" name="CambiaStatus">
			Insert into avance_entregables (id_registro,clave,rubro,concepto,entregable, fecha_registro)
			Values (#form.id_user#, '#evaluate(form.claveae)#', '#evaluate(form.rubroae)#', '#evaluate(form.conceptoae)#', '#evaluate(form.entregableae)#', #hoy#)
		</cfquery>		
		<cfset Contador = contador +1>
	</cfloop>	
	
	
	
	<cfquery name="nuevo_registro" datasource="etramites">
		Insert into avance_entregables (id_registro,clave,rubro,concepto,entregable, fecha_registro)
		Values (#form.id_user#, '#form.claveae#', '#form.rubroae#', '#form.conceptoae#', '#form.entregableae#', #hoy#)
	</cfquery>
	<cfquery name="registro" datasource="etramites">
		select registro_id from registro
		where rfc = '#rfc#'
		and folio_proyecto = '#form.folio#'
	</cfquery>
	<cflocation url="entregables.cfm?id_user=#registro.registro_id#">	
<cfelse>
	<cfloop list="#IDUA#" INDEX="i" DELIMITERS=",">
		<cfset clave1 = "claveae" & contador> 
		<cfset rubro1 = "rubroae" & contador>
		<cfset concepto1 = "conceptoae" & contador>
		<cfset entregable1 = "entregableae" & contador>
		<cfquery datasource="SAS2" name="CambiaStatus">
			Insert into avance_entregables (id_registro,clave,rubro,concepto,entregable, fecha_registro)
			Values (#form.id_user#, '#evaluate(form.claveae)#', '#evaluate(form.rubroae)#', '#evaluate(form.conceptoae)#', '#evaluate(form.entregableae)#', #hoy#)
		</cfquery>		
		<cfset Contador = contador +1>
	</cfloop>

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

</cfoutput>