@extends('layouts.app')

@section('content')
 <div class="content-wrapper">
    <create-report></create-report>
</div>
@endsection
@section('scripts_before_init')
    <!--script src="{{ asset('assets/views/report.js') }}" defer></script-->
@endsection