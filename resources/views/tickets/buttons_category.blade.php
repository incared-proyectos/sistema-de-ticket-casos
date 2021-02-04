  <a href="{{url('tickets')}}" class="btn btn-outline-primary text-capitalize" mt-2><i class="fas fa-ticket-alt"></i> All</a>

  @foreach($categorias as $c)
    @foreach($cat_user as $cc)
      @if($c->nombre == $cc->nombre)
        <a href="{{url('tickets_filter/'.$c->id)}}" class="btn btn-outline-primary text-capitalize" mt-2><i class="fas fa-ticket-alt"></i> {{$c->nombre}}</a> 
      @endif
    @endforeach
  @endforeach