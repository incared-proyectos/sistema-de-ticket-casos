<style>
          .direct-chat .card-body {
              overflow-x: hidden;
              padding: 0;
              position: relative;
            }
            
             .caja-message{
                padding: 10px;
                width: 100%;
                height: 300px;
                background-color: rgba(162, 138, 138, 0.03);                
                border-radius:10px;
                box-shadow: 0 0 1px rgba(0,0,0,.125),0 1px 3px rgba(0,0,0,.2);

             }
             .content-messages{
                background: white;
                width: 100%;
                height: 100px;
             }

            .direct-chat.chat-pane-open .direct-chat-contacts {
              -webkit-transform: translate(0, 0);
              transform: translate(0, 0);
            }

            .direct-chat.timestamp-light .direct-chat-timestamp {
              color: #30465f;
            }

            .direct-chat.timestamp-dark .direct-chat-timestamp {
              color: #cccccc;
            }

            .direct-chat-messages {
              -webkit-transform: translate(0, 0);
              transform: translate(0, 0);
              height: 250px;
              overflow: auto;
              padding: 10px;
            }

            .direct-chat-msg,
            .direct-chat-text {
              display: block;
            }

            .direct-chat-msg {
              margin-bottom: 10px;
            }

            .direct-chat-msg::after {
              display: block;
              clear: both;
              content: "";
            }

            .direct-chat-messages,
            .direct-chat-contacts {
              transition: -webkit-transform .5s ease-in-out;
              transition: transform .5s ease-in-out;
              transition: transform .5s ease-in-out, -webkit-transform .5s ease-in-out;
            }

            .direct-chat-text {
              border-radius: 0.3rem;
              background: #d2d6de;
              border: 1px solid #d2d6de;
              color: #444;
              margin: 5px 0 0 50px;
              padding: 5px 10px;
              position: relative;
            }

            .direct-chat-text::after, .direct-chat-text::before {
              border: solid transparent;
              border-right-color: #d2d6de;
              content: ' ';
              height: 0;
              pointer-events: none;
              position: absolute;
              right: 100%;
              top: 15px;
              width: 0;
            }

            .direct-chat-text::after {
              border-width: 5px;
              margin-top: -5px;
            }

            .direct-chat-text::before {
              border-width: 6px;
              margin-top: -6px;
            }

            .right .direct-chat-text {
              margin-left: 0;
              margin-right: 50px;
            }

            .right .direct-chat-text::after, .right .direct-chat-text::before {
              border-left-color: #d2d6de;
              border-right-color: transparent;
              left: 100%;
              right: auto;
            }

            .direct-chat-img {
              border-radius: 50%;
              float: left;
              height: 40px;
              width: 40px;
            }

            .right .direct-chat-img {
              float: right;
            }

            .direct-chat-infos {
              display: block;
              font-size: 0.875rem;
              margin-bottom: 2px;
            }

            .direct-chat-name {
              font-weight: 600;
            }

            .direct-chat-timestamp {
              color: #697582;
            }

            .direct-chat-contacts-open .direct-chat-contacts {
              -webkit-transform: translate(0, 0);
              transform: translate(0, 0);
            }

            .direct-chat-contacts {
              -webkit-transform: translate(101%, 0);
              transform: translate(101%, 0);
              background: #343a40;
              bottom: 0;
              color: #ffffff;
              height: 250px;
              overflow: auto;
              position: absolute;
              top: 0;
              width: 100%;
            }

            .direct-chat-contacts-light {
              background: #f8f9fa;
            }

            .direct-chat-contacts-light .contacts-list-name {
              color: #495057;
            }

            .direct-chat-contacts-light .contacts-list-date {
              color: #6c757d;
            }

            .direct-chat-contacts-light .contacts-list-msg {
              color: #545b62;
            }
</style>
 <div class="content-wrapper">
    <!-- Main content -->
    <div class="content mt-2">
      <div class="container-fluid">
        <div class="row">
        <div class="caja-message">
        <div class="content-messages">
            @foreach($mensajes as $item)
            <div  class="direct-chat-msg {{ $item->escribe_active ? 'right': '' }}">
                <div class="direct-chat-infos clearfix">
                  <span class=" {{$item->escribe_active ? 'float-right' : 'float-left' }} ">{{$item->from_user->name}}</span>
                  <span class=" {{$item->escribe_active ? 'float-left' : 'float-right' }}">{{$item->created_at}}</span>
                </div>
                <!-- /.direct-chat-infos -->
                <img class="direct-chat-img" src=" {{ $item->from_user->img_src !== null  ? asset('storage/profile/'.$item->from_user->id.'/'.$item->from_user->img_src.'') : asset('img/avatar5.png')}}" alt="message user image" >
                <!-- /.direct-chat-img -->
                <div class="direct-chat-text">
                  @if(!empty($item->notice_message))
                    <p  class="alert alert-warning mb-0"> <i class="fas fa-info-circle"></i> {{$item->mensaje}}</p>
                  @else
                    <p class="mb-0">{{$item->mensaje}}</p>

                  @endif
                  @if(!empty($item->img_src) OR  !empty($item->file_src))
                      <hr class="mt-0 mb-0">
                      <div class="row justify-content-center p-2" >
                        <div class="col-7">
                          @if(!empty($item->img_src))
                          <img src="asset('storage/ticket/'.$ticket->id.'/'.$item->img_src.')" alt="" class="img-thumbnail" width="100px">
                          @endif
                          <a href="asset('storage/ticket/'.$ticket->id.'/'.$item->file_src.')" id="url_file" class="box-link-ticket"><i class="fas fa-paperclip"></i> {{$item->file_src}}</a>
                        </div>
                      </div>
                  @endif
                </div>
                <!-- /.direct-chat-text -->
                 <hr>
              </div>
              @endforeach
        </div>
    </div>
       </div>
      </div>
    </div>
  </div>

