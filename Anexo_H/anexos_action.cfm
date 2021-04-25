<cfset Hoy = CreateODBCDateTime(Now())>
<cfset anio = (Year(hoy))>	
<cfoutput>
	<cfset testDirectory = "#expandPath("Archivos/#anio#/#form.id_user#")#"> 	
	<cfif directoryExists(testDirectory)>
		<cfset testDirectory = "#expandPath("Archivos/#anio#/#form.id_user#")#"> 	   
	<cfelse>
		<cfdirectory action="create" directory="#expandPath("Archivos/#anio#/#form.id_user#")#">
		<cfset testDirectory = "#expandPath("Archivos/#anio#/#form.id_user#")#">
	</cfif>	 
	
	<cfquery name="consulta_anexos" datasource="etramites">
		Select * from anexos
		where id_registro=#form.id_user#
	</cfquery>
	
	<cfif consulta_anexos.recordcount gt 0>
		<cfset archivo1 = "form.archivo1">
		<cfif #evaluate(archivo1)# gt ''>
			<cffile action = "upload"
			fileField = "archivo1"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "Overwrite"> 
			<cfset ae="#cffile.ClientFileName#.#cffile.ClientFileExt#">	
		<cfelse>
			<cfset ae="#consulta_anexos.avance_entregables#">
		</cfif>
		
		<cfset archivo2 = "form.archivo2">
		<cfif #evaluate(archivo2)# gt ''>
			<cffile action = "upload"
			fileField = "archivo2"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "overwrite"> 
			<cfset ii="#cffile.ClientFileName#.#cffile.ClientFileExt#">
		<cfelse>
			<cfset ii="#consulta_anexos.indicadores_impacto#">
		</cfif>
		
		<cfset archivo3 = "form.archivo3">
		<cfif #evaluate(archivo3)# gt ''>
			<cffile action = "upload"
			fileField = "archivo3"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "overwrite"> 
			<cfset ce="#cffile.ClientFileName#.#cffile.ClientFileExt#">
		<cfelse>
			<cfset ce="#consulta_anexos.comprobantes_egresos#">
		</cfif>
		
		<cfset archivo4 = "form.archivo4">
		<cfif #evaluate(archivo4)# gt ''>
			<cffile action = "upload"
			fileField = "archivo4"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "overwrite"> 
			<cfset f="#cffile.ClientFileName#.#cffile.ClientFileExt#">
		<cfelse>
			<cfset f="#consulta_anexos.formato#">
		</cfif>
		<cfquery name="nuevo_registro" datasource="etramites">
			Update anexos set 
			avance_entregables='#ae#', 
			indicadores_impacto='#ii#', 
			comprobantes_egresos='#ce#', 
			formato='#f#', 
			fecha_registro= #hoy#
			where id_registro = '#form.id_user#'
		</cfquery>	
	<cfelse>
		
		<cfset archivo1 = "form.archivo1">
		<cfif #evaluate(archivo1)# gt ''>
			<cffile action = "upload"
			fileField = "archivo1"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "MakeUnique"> 
			<cfset ae="#cffile.ClientFileName#.#cffile.ClientFileExt#">	
		</cfif>
		
		<cfset archivo2 = "form.archivo2">
		<cfif #evaluate(archivo2)# gt ''>
			<cffile action = "upload"
			fileField = "archivo2"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "overwrite"> 
			<cfset ii="#cffile.ClientFileName#.#cffile.ClientFileExt#">
		</cfif>
		
		<cfset archivo3 = "form.archivo3">
		<cfif #evaluate(archivo3)# gt ''>
			<cffile action = "upload"
			fileField = "archivo3"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "overwrite"> 
			<cfset ce="#cffile.ClientFileName#.#cffile.ClientFileExt#">
		</cfif>
		
		<cfset archivo4 = "form.archivo4">
		<cfif #evaluate(archivo4)# gt ''>
			<cffile action = "upload"
			fileField = "archivo4"
			destination = "#testDirectory#" 
			accept="application/pdf,application/zip"
			nameConflict = "overwrite"> 
			<cfset f="#cffile.ClientFileName#.#cffile.ClientFileExt#">
		</cfif>
		<cfquery name="nuevo_registro" datasource="etramites">
			Insert into anexos (id_registro, ruta_documentos, avance_entregables, indicadores_impacto, comprobantes_egresos, formato, fecha_registro)
			Values ('#form.id_user#', 'Archivos/#anio#/#form.id_user#', '#ae#', '#ii#','#ce#','#f#', #hoy#)
		</cfquery>	
	</cfif>
</cfoutput>
<cflocation url="folio.cfm">