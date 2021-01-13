<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
    <title>Nuevo ticket Abierto </title>
</head>
<body>
    <p>Hola! Acabas de  asignar un nuevo ticket. Codigo : {{$data['codigo']}}</p>
    <p>Estos son los datos del ticket:</p>
    <br>
    <b>Titulo:</b>
    <p>{{$data['titulo']}}</p>
    <b>Descripcion:</b>
    <p>{{$data['descripcion']}}</p>
    <ul>
    </ul>
</body>
</html>