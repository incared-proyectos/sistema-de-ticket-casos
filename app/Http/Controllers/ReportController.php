<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Models\Report;
use App\Models\ReportLine;
use App\Models\Empresa;
use App\Http\Requests\ReportRequest;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Facades\DB;
use Throwable;
use Mpdf;


class ReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $heads = $this->head_datatables();
        return view('reports.index',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
        ]);
        
    }

    public function head_datatables(){
        $columns = array(
            array('data'=>'id'),
            array('data'=>'code'),
            array('data'=>'action'),

        );
        $head = array(
            'ID',
            'Codigo',
            'Action',
        );
        return array('columns'=>$columns,'head'=>$head);
    }

    public function datatables(){
        $table = Datatables::of(Report::all());
        $table->addColumn('action', function($row){
            $url = url('estatus').'/'.$row['id'];
            return view('layouts.buttons_datatables_reports',['id'=>$row['id'],'url'=>$url]);
        })->rawColumns(['action']);
        return $table->make(true);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $empresas = Empresa::all();
        return view('reports.create',compact('empresas'));
    }
    public function getNumberReport(){
        $numberReport = Report::orderBy('number','DESC')->first();

        if(!empty($numberReport)){
            $number = $numberReport->number+1;
        }else{
            $number = 1;
        }
        
        return $number; 

    }

    public function pdfinit($report_id){

        $report = Report::find($report_id)->first();
        $reportLine = ReportLine::where('report_id',$report_id)->get();

        /*Ajustamos las  medidas, orientacio y formato  de las paginas*/
        $mpdf = new \Mpdf\Mpdf([
            'margin_left' => 6,
            'margin_right' => 6,
            'margin_top' => 35,
            'margin_bottom' => 10,
            'margin_header' => 5,
            'margin_footer' => 5,
            'mode' => 'utf-8', 
            'format' => 'A4',
            'orientation' => 'P'
        ]);
        $mpdf->SetProtection(array('print'));
        $mpdf->SetTitle("Factura PDF Pedidos");
        $mpdf->SetAuthor("Acme Trading Co.");
        $mpdf->SetWatermarkText("");   // anulada
        $mpdf->showWatermarkText = true;
        $mpdf->watermark_font = 'DejaVuSansCondensed';
        $mpdf->watermarkTextAlpha = 0.1;
        $mpdf->SetDisplayMode('fullpage');
        $mpdf->WriteHTML(view('export_pdf.report',['report'=>$report,'reportLines'=>$reportLine]));
        $mpdf->Output($report->code.'.pdf', 'I');
    
    }  
    public function wordInit($report_id){
        $report = Report::find($report_id)->first();
        $reportLine = ReportLine::where('report_id',$report_id)->get();

        $phpWord = new \PhpOffice\PhpWord\PhpWord();

        
        foreach($reportLine as $line){
            // Adding an empty Section to the document...
            $section = $phpWord->addSection();
            // Adding Text element to the Section having font styled by default...
            $section->addText($line->description);
        }


        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        $objWriter->save($report->code.'.docx');

        
        return response()->download(public_path($report->code.'.docx'));
    } 
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ReportRequest $request)
    {
        //try{

            DB::beginTransaction();
            $all = $request->all();
            $reportRequest['number'] = $this->getNumberReport();
            $reportRequest['code'] = 'rp-'.$reportRequest['number'];
            $reportRequest['empresa_id'] = $all['empresa_id'];
            $report = Report::create($reportRequest);

            foreach($all['lines'] as $line){
                $line['report_id'] = $report->id;
            
                ReportLine::create($line);
            }

            
            DB::commit();
            Session::flash('success','El reporte fue creado con exito'); 

            return response()->json(['success'=>'Reporte creado con exito']);
        /*}catch (Throwable $e) {
            return response()->json(['errors'=>array('Ooops tenemos un error, contacte con el programador')],500);
        }*/
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
