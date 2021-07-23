@extends('layouts.app')

@section('content')
 <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Inicio</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Inicio</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
            <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>{{$user_c}}</h3>

                <p>Usuarios registrados</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">-</a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>{{$ticket}}</h3>

                <p>Total de tickets</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">-</a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>{{$resueltos}}</h3>

                <p>Tickets resueltos</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="#" class="small-box-footer">-</a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>{{$activos}}</h3>

                <p>Tickets activos</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">-</a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        	      <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<b>BIENVENIDO A NUESTRO SISTEMA  CREADO EN LARAVEL, UTILIZAMOS VUE-JS PARA ALGUNAS MODULOS</b>
			     	   </div>
		              <div class="card-body">

		                <p class="card-text">
		                  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Inventore esse hic iusto aliquid non iste unde quam ipsum et alias recusandae harum facilis saepe delectus ipsam amet id, cum repudiandae!
		                </p>

		              </div>
		            </div>

		     	</div>
		    </div>
		    <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
@endsection
