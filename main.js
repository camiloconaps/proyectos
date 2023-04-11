$(document).ready(function() {
    $('#mainHeader').load('app/pages/dashboard.html');
    $('#tablero1').load('app/pages/contenido/tablero1.html');
    $('#tablero2').load('app/pages/contenido/tablero2.html');
});
function loadContendt(option){
    $.ajax({
		url     : "app/controller/ctr_data.php",
		type    : "post",
		data    : {'optCampo': option},
		success : (function (data) {
            console.log(data);
            $('#mainContent').load('app/pages/contenido/listFull.html');
		})
	});
    
}