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
             
            .cont-header { *display: inline-block; }
            * html .cont-header { height: 1%; }
            .cont-header:after { content: "."; display: block; height: 0; clear: both; visibility: hidden; font-size: 0; }
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
           <h4 style="line-height: 10px;"><code>RUC: </code></h4>
           <h3 style="line-height: 10px;"><b>CODIGO: {{$report->code}} </b></h3>
           <h4 style="line-height: 10px;"><code></code></h4>	
        </div>
        </div>
        <br>
        </htmlpageheader>
        <htmlpagefooter name="myfooter">
        <div>
         
        </div>
        <div style="border-top: 1px solid #000000; font-size: 9pt; text-align: center; padding-top: 3mm; ">

        <p style="text-align:right;">Pag {PAGENO} of {nb}</p>
        </div>
        </htmlpagefooter>
        <sethtmlpageheader name="myheader" value="on" show-this-page="1" />
        <sethtmlpagefooter name="myfooter" value="on" />
        mpdf-->

        <!--este es el contenedor donde se encuentra toda la informacion
        correspondiente del cliente-->
      




        <!--#####################Fin de la caja de informacion del cliente###################################-->
        <br />
        @foreach($reportLines as $line)
            <div>
                <h1 style="text-align:center;">{{$line->title}}</h1>
                <p>{{$line->description}}</p>
            </div>
         
        @endforeach
 
 
        <!-- END ITEMS HERE -->

 
     
        <div style="text-align: center; font-style: italic;"></div>
        </body>
        </html>