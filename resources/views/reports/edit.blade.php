@extends('layouts.app')

@section('content')
 <div class="content-wrapper">
    <edit-report :empresas="{{$empresas}}" :empresa="{{$report->empresa}}" :report="{{$report}}" :reportslines="{{$reportLines}}" ></edit-report>
</div>
@endsection
@section('scripts_before_init')
    <!--script src="{{ asset('assets/views/report.js') }}" defer></script-->
@endsection