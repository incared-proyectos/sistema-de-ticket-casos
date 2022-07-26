<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ReportRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
    */
    public function rules()
    {
        $rules =  [
            'lines'=>'required',
            'empresa_id'=>'required'
        ];
        $lines = $this->input('lines');
        if(count($lines) > 0){
            foreach ($lines as $key => $ll) {
                if(empty($ll['title']) || empty($ll['page_type']) || empty($ll['description'])){
                  
                    $rules['linesEmpty'] = 'required';
                }
            }
        }else{
            $rules['linesCount'] = 'required';
        }
        return $rules;
    }

    public function messages()
    {
        return [
            'linesCount.required' => 'Debe Ingresar una linea o mas',
            'linesEmpty.required' => 'El campo titulo y descripcion de las lineas es requerido',
        ];
    }
}
