   <html>
        <head>
        <meta charset="UTF-8">
            <style>

                body {font-family: sans-serif;
                 font-size: 10pt;
                 color:#444444;
             }
             p {    margin: 0pt; }
             table.items {
                 border: 0.1mm solid #000000;
             }
             td { vertical-align: top; }
             .items td {
                 border-left: 0.1mm solid #000000;
                 border-right: 0.1mm solid #000000;
             }
             table thead td { background-color: #acacac;
                 text-align: center;
                 border: 0.1mm solid #000000;
                 font-variant: small-caps;
             }
             .items td.blanktotal {
                 background-color: #acacac;
                 border: 0.1mm solid #000000;
                 background-color: #FFFFFF;
                 border: 0mm none #000000;
                 border-top: 0.1mm solid #000000;
                 border-right: 0.1mm solid #000000;
             }
             .items td.totals {
                 text-align: right;
                 border: 0.1mm solid #000000;

             }
             .items td.cost {
                 text-align: "." center;
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
             .container-info{
                border: 1.7px solid #4a4a4a;  width: 100%; height:80px;margin-top: 6px;
            }
            .caja-one{
                float: left;  width:69%;   height: 80px; 
            }
            .caja-two{
                float:right; width: 30.6%;border-left:1.7px solid #4a4a4a;  height: 80px;
            }
            .cont-header { *display: inline-block; }
            * html .cont-header { height: 1%; }
            .cont-header:after { content: "."; display: block; height: 0; clear: both; visibility: hidden; font-size: 0; }

            .direct-chat .card-body {
              overflow-x: hidden;
              padding: 0;
              position: relative;
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

            .right  {
              float: right; margin-top: 7px;
            }
            .float-right{
              float: right: 
            }
            .float-left{
              float: left: 
            }
            .direct-chat-infos-right {
              width: 100%;
              font-size: 0.875rem;
              display: flex;
              justify-content: center;
              text-align: right ;
            }
            .direct-chat-infos {
              width: 100%;
              font-size: 0.875rem;
              display: flex;
              justify-content: center;
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
        </head>
        <body>
            <!--mpdf
            <htmlpageheader name="myheader">

            <div class="cont-header">


             <div class="caja-info" style="float:left; width:67%;  height:115px;">
              <div class="my-img" >
              
         

        </div>


        </div> 
        <div class="caja-info" style="float:right; width:30%; border:2.5px solid  #E61812 ; height:105px;  text-align: center;border-radius:5px;">
           <h4 style="line-height: 10px;"><code>Ticket: {{$ticket->codigo}}</code></h4>
 	
        </div>
        </div>
        <br>
        </htmlpageheader>
        <htmlpagefooter name="myfooter">

        </htmlpagefooter>


        <sethtmlpageheader name="myheader" value="on" show-this-page="1" />
        <sethtmlpagefooter name="myfooter" value="on" />
        mpdf-->

        <!--este es el contenedor donde se encuentra toda la informacion
        correspondiente del cliente-->
        <div class="container-info">
        	<div class="caja-one" >
        		<table  style="font-family: serif;" cellpadding="1" border="0" style="font-size: 8pt; border-collapse: collapse; " cellpadding="2">
        				<tr>
        					<td style="line-height: 0px;"><b>Apertura</b></td>
        					<td style="line-height: 0px; "><b>:</b> {{$ticket->apertura}} </td>
        				</tr>
        				<tr>
        					<td style="line-height: 0px;"><b>Titulo</b></td>
        					<td style="line-height: 0px;"><b>:</b> {{$ticket->titulo}}</td>
        				</tr>
        				<tr>
        					<td style="line-height: 0px;"><b>Fecha creacion</b></td>
        					<td style="line-height: 0px;"><b>:</b> {{$ticket->created_at}}</td>
        				</tr>
        				<tr>
        					<td style="line-height: 0px;"><b>Estatus</b></td>
        					<td style="line-height: 0px;"><b>:</b> {{$ticket->status}}</td>
        				</tr>
        			</table>
        	</div>
        	<div class="caja-two" >
        		<table  style="font-family: serif;" cellpadding="1" border="0" style="font-size: 8pt; border-collapse: collapse; " cellpadding="2">
    				<tr>
    					<td style="line-height: 0px;"><b>Usuario ticket</b></td>
    					<td style="line-height: 0px; "><b>: {{$user->name}}</b></td>
    				</tr>
    				<tr>
    					<td style="line-height: 0px;"><b>Email</b></td>
    					<td style="line-height: 0px;"><b>:</b> {{$user->email}}</td>
    				</tr>
        	   </table>
        	</div>	
        </div>




        <!--#####################Fin de la caja de informacion del cliente###################################-->
        <br />
        <div class="caja-message">
            <div class="content-messages">
                @foreach($mensajes as $item)
                <div  class="direct-chat-msg {{ $item->escribe_active ? 'right': '' }} ">
                    <div class="{{$item->escribe_active ? 'direct-chat-infos-right' : 'direct-chat-infos' }}">
                      <span class=" {{$item->escribe_active ? 'float-right' : 'float-left' }} " style="text-align:right; width: 100%; ">{{$item->from_user->name}}</span>
                      <span class=" {{$item->escribe_active ? 'float-left' : 'float-right' }}" style="display: block;">{{$item->created_at}}</span>
                    </div>
                    <!-- /.direct-chat-infos -->
                    <img class="direct-chat-img {{ $item->escribe_active ? 'right': '' }}"    src=" {{ $item->from_user->img_src !== null  ? asset('storage/profile/'.$item->from_user->id.'/'.$item->from_user->img_src.'') : asset('img/avatar5.png')}}" alt="message user image" >
                    <!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      @if(!empty($item->notice_message))
                        <p  class="alert alert-warning mb-0"> <i class="fas fa-info-circle"></i> <?php echo strip_tags($item->mensaje); ?></p>
                      @else
                        <p class="mb-0"> <?php echo strip_tags($item->mensaje); ?></p>
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
        <div style="text-align: center; font-style: italic;"></div>
        </body>
        </html>
        