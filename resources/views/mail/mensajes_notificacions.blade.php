<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
    <title>Nuevo mensaje en ticket codigo {{$data['codigo']}}</title>
</head>
<body>
    <p>Hola {{$data['to_name']}}! tienes un nuevo mensaje de {{$data['from_name']}} en el ticket {{$data['codigo']}} : </p>
    <br>
    <p>El mensaje es el siguiente:</p>
    <?php echo $data['mensaje']; ?>  
 
</body>
</html>