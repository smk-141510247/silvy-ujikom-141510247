<?php

namespace App\Http\Controllers;

use App\golongan;
use App\jabatan;
use App\pegawai;
use App\User;
use App\Form;
use App\kategori_lembur;
use Input;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;

class PegawaiController extends Controller
{
        use RegistersUsers;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $pegawai = pegawai::all();
        return view ('pegawai.index', compact('pegawai'));
       
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $golongan = golongan::all();
        $jabatan = jabatan::all();
        return view ('pegawai.create', compact('golongan','jabatan'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request, [
                'name' => 'required',
                'nip' => 'required|numeric|min:3|unique:pegawais',
                'permission' => 'required|max:255',
                'email' => 'required|email|max:255|unique:users',
                'password' => 'required|min:6|confirmed',
                ]);

                $user = User::create([
                    'name' => $request->get('name'),
                    'permission' => $request->get('permission'),
                    'email' => $request->get('email'),
                    'password' => bcrypt($request->get('password')),
                ]);

        $file = Input::file('foto');
        $destinationPath = public_path().'/assets/image/';
        $filename = $file->getClientOriginalName();
        $uploadSuccess = $file->move($destinationPath, $filename);

        if(Input::hasFile('foto')){
        $pegawai= new pegawai;
        $pegawai->nip=$request->get('nip');
        $pegawai->id_jabatan =$request->get('id_jabatan');
        $pegawai->id_golongan=$request->get('id_golongan');
        $pegawai->id_user =$user->id;
        $pegawai->foto = $filename;
        $pegawai->save();

                return redirect('/pegawai');
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
         $golongan = golongan::all();
        $jabatan = jabatan::all();
        $pegawai=pegawai::find($id);
        return view('pegawai.edit',compact('pegawai','jabatan','golongan'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id)
    {
        $pegawaiUpdate=Input::all();
        $pegawai=pegawai::find($id);
        $pegawai->update($pegawaiUpdate);
        return redirect('pegawai');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        pegawai::find($id)->delete();
        return redirect('pegawai');
    }
}
