<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
    <title>Nuevo ticket Abierto </title>
</head>
<body>
    <p>Hola!  {{ (isset($from)) ? 'Usted ha asignado un nuevo ticket ' : 'Se ha asignado un nuevo ticket a tu cuenta'}} . Codigo : {{$data->ticket_codigo}}</p>
    <p>Estos son los datos del ticket:</p>
    <br>
    <b>titulo:</b>
    <p>{{$data->titulo}}</p>

    <b>Descripcion:</b>
    <p>{{$data->mensaje}}</p>
    <ul>
    </ul>
</body>
</html>