<?php

namespace App\Http\Controllers;

use Validator;
use App\kategori_lembur;
use App\jabatan;
use App\golongan;
use Request;
use Form;
use Input;

class KategoriController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $kategori = kategori_lembur::with('golongan','jabatan')->get();
       $kategori = kategori_lembur::where('kode_lembur', request('kode_lembur'))->paginate(0);
        if(request()->has('kode_lembur'))
        {
            $kategori=kategori_lembur::where('kode_lembur', request('kode_lembur'))->paginate(0);
        }
        else
        {
            $kategori=kategori_lembur::paginate(2);
        }

        return view ('kategori.index', compact('kategori'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $kategori = kategori_lembur::all();
        $golongan = golongan::all();
        $jabatan = jabatan::all();
        return view ('kategori.create', compact('kategori','golongan','jabatan'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $kategori=Request::all();
         $rules=['kode_lembur'=>'required:kategori_lemburs',
                 'besaran_uang'=>'required:kategori_lemburs'];
         $message=['kode_lembur.required'=>'Kolom Jangan Kosong',
                   'besaran_uang.required'=>'Kolom Jangan Kosong'];
         $validator=Validator::make(Input::all(),$rules,$message);

        if ($validator->fails())
         {
            # code...
            return redirect('/kategori/create')
            ->withErrors($validator)
            ->withInput();
        }
        else
        {
        kategori_lembur::create($kategori);
        return redirect('kategori');
        }
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
        $kategori=kategori_lembur::find($id);
        $golongan = golongan::all();
        $jabatan = jabatan::all();
        return view('kategori.edit',compact('kategori','golongan','jabatan'));
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
        $dataUpdate=Request::all();
        $kategori=kategori_lembur::find($id);
        $kategori->update($dataUpdate);
        return redirect('kategori');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        kategori_lembur::find($id)->delete();
        return redirect('kategori');
    }
}
