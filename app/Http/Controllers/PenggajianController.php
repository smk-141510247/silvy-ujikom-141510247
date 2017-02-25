<?php

namespace App\Http\Controllers;

use App\tunjangan;
use App\penggajian;
use App\tunjangan_pegawai;
use Input;
use App\pegawai;
use App\jabatan;
use App\golongan;
use App\kategori_lembur;
use App\lembur_pegawai;
use Auth;
use Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class PenggajianController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $penggajian = penggajian::paginate(3);
        return view('penggajian.index',compact('penggajian'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        $Gaji = tunjangan_pegawai::paginate(10);
        return view('penggajian.create',compact('Gaji')); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $i_Gaji=Input::all();
       $tunjangan_pegawai=tunjangan_pegawai::where('id',$i_Gaji['kode_tunjangan'])->first();
       $penggajian=penggajian::where('kode_tunjangan',$tunjangan_pegawai->id)->first();
       $tunjangan=tunjangan::where('id',$tunjangan_pegawai->kode_tunjangan)->first();
       $pegawai=pegawai::where('id',$tunjangan_pegawai->Kode_pegawai)->first();
       $kategori_lembur=kategori_lembur::where('kode_jabatan',$pegawai->kode_jabatan)->where('kode_golongan',$pegawai->kode_golongan)->first();
       $lembur_pegawai=lembur_pegawai::where('Kode_pegawai',$pegawai->id)->first();
       $jabatan=jabatan::where('id',$pegawai->kode_jabatan)->first();
       $golongan=golongan::where('id',$pegawai->kode_golongan)->first();

       $Gaji = new penggajian ;

       if (isset($penggajian)) {
           $error=true ;
           $tunjangan=tunjangan_pegawai::paginate(10);
           return view('penggajian.create',compact('tunjangan','error'));
       }
       elseif (!isset($lembur_pegawai)) {
            $nol = 0;
            $Gaji->jumlah_jam_lembur= $nol;
            $Gaji->jumlah_uang_lembur = $nol;
            $Gaji->gaji_pokok=$jabatan->besaran_uang+$golongan->besaran_uang;
            $Gaji->total_gaji=($tunjangan->jumlah_anak*$tunjangan->besaran_uang)+($jabatan->besaran_uang+$golongan->besaran_uang);
            $Gaji->tanggal_pengambilan = date('d-m-y');
            $Gaji->status_pengambilan = Input::get('status_pengambilan');
            $Gaji->kode_tunjangan = Input::get('kode_tunjangan');
            $Gaji->petugas_penerima = Auth::user()->name;
            $Gaji->save();
        }
        elseif(!isset($lembur_pegawai) || !isset($kategori_lembur))
        {
            $nol = 0;
            $Gaji->jumlah_jam_lembur= $nol;
            $Gaji->jumlah_uang_lembur = $nol;
            $Gaji->gaji_pokok=$jabatan->besaran_uang+$golongan->besaran_uang;
            $Gaji->total_gaji = ($tunjangan->jumlah_anak*$tunjangan->besaran_uang)+($jabatan->besaran_uang+$golongan->besaran_uang);
            $Gaji->tanggal_pengambilan = date('d-m-y');
            $Gaji->status_pengambilan = Input::get('status_pengambilan');
            $Gaji->kode_tunjangan = Input::get('kode_tunjangan');
            $Gaji->petugas_penerima = Auth::user()->name;
            $Gaji->save();
        }
        else
        {
            $Gaji->jumlah_jam_lembur=$lembur_pegawai->Jumlah_Jam;
            $Gaji->jumlah_uang_lembur =($lembur_pegawai->Jumlah_Jam)*($kategori_lembur->besaran_uang);
            $Gaji->gaji_pokok=$jabatan->besaran_uang+$golongan->besaran_uang;
            $Gaji->total_gaji = ($lembur_pegawai->Jumlah_Jam*$kategori_lembur->besaran_uang)+($tunjangan->jumlah_anak*$tunjangan->besaran_uang)+($jabatan->besaran_uang+$golongan->besaran_uang);
            $Gaji->tanggal_pengambilan = date('d-m-y');
            $Gaji->status_pengambilan = Input::get('status_pengambilan');
            $Gaji->kode_tunjangan = Input::get('kode_tunjangan');
            $Gaji->petugas_penerima = Auth::user()->name;
            $Gaji->save();
        }
        return redirect('penggajian');
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

        penggajian::find($id)->delete();
        return redirect('penggajian');
    }
}

