<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmpresaUpdateRequest extends FormRequest
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
            'ruc'  => 'required|unique:empresas,ruc,'.$this->input('empresa_id'),
            'name'=>'required',
            'surname'=>'required',
            'rsocial'=>'required',
        ];
      
        return $rules;
    }

    public function messages()
    {
        return [
            'ruc.required' => 'Debe ingresar un ruc',
            'name.required' => 'Debe Ingresar un nombre',
            'surname.required' => 'Debe Ingresar un apellido',
            'rsocial.required' => 'Debe Ingresar una razon social',
        ];
    }
}
