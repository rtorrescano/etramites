function productos(){
	var tbody = $('#lista_productos tbody');
	var fila_contenido = tbody.find('tr').first().html();
	//Agregar fila nueva.
	$('#lista_productos .button_agregar_producto').click(function(){
		var fila_nueva = $('<tr></tr>');
		fila_nueva.append(fila_contenido);
		tbody.append(fila_nueva);
	});
	//Eliminar fila.
	$('#lista_productos').on('click', '.button_eliminar_producto', function(){		
		$(this).parents('tr').eq(0).remove();
	});
}

function productos1(){
	var tbody = $('#lista_productos1 tbody');
	var fila_contenido = tbody.find('tr').first().html();
	//Agregar fila nueva.
	$('#lista_productos1 .button_agregar_producto').click(function(){
		var fila_nueva = $('<tr></tr>');
		fila_nueva.append(fila_contenido);
		tbody.append(fila_nueva);
	});
	//Eliminar fila.
	$('#lista_productos1').on('click', '.button_eliminar_producto', function(){		
		$(this).parents('tr').eq(0).remove();
	});
}

function productos2(){
	var tbody = $('#lista_productos2 tbody');
	var fila_contenido = tbody.find('tr').first().html();
	//Agregar fila nueva.
	$('#lista_productos2 .button_agregar_producto').click(function(){
		var fila_nueva = $('<tr></tr>');
		fila_nueva.append(fila_contenido);
		tbody.append(fila_nueva);
	});
	//Eliminar fila.
	$('#lista_productos2').on('click', '.button_eliminar_producto', function(){		
		$(this).parents('tr').eq(0).remove();
	});
}

function productos3(){
	var tbody = $('#lista_productos3 tbody');
	var fila_contenido = tbody.find('tr').first().html();
	//Agregar fila nueva.
	$('#lista_productos3 .button_agregar_producto').click(function(){
		var fila_nueva = $('<tr></tr>');
		fila_nueva.append(fila_contenido);
		tbody.append(fila_nueva);
	});
	//Eliminar fila.
	$('#lista_productos3').on('click', '.button_eliminar_producto', function(){		
		$(this).parents('tr').eq(0).remove();
	});
}

function productos4(){
	var tbody = $('#lista_productos4 tbody');
	var fila_contenido = tbody.find('tr').first().html();
	//Agregar fila nueva.
	$('#lista_productos4 .button_agregar_producto').click(function(){
		var fila_nueva = $('<tr></tr>');
		fila_nueva.append(fila_contenido);
		tbody.append(fila_nueva);
	});
	//Eliminar fila.
	$('#lista_productos4').on('click', '.button_eliminar_producto', function(){		
		$(this).parents('tr').eq(0).remove();
	});
}
