@extends('layouts.app')

@section('content')
 <div class="content-wrapper">

    <!-- Main content -->
    <div class="content mt-2">
      <div class="container-fluid">

        <repository-index :user_id="{{auth()->user()->id}}"></repository-index>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->


</div>
<div id="response_edit"></div>
@include('rol.add')
@endsection

@section('scripts_before_init')
  <script>
    const base_url_http = "{{ url('datatables/rol')}}";
  </script>
@endsection