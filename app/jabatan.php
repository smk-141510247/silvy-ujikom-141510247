<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class jabatan extends Model
{
    //
   protected $table = 'jabatans'; 
    protected $fillable = array('id','kode_jabatan','nama_jabatan','besaran_uang');
    protected $visible = array('id','kode_jabatan','nama_jabatan','besaran_uang');

    public function kategori_lembur()
    {
        return $this->hasmany('App\kategori_lembur','id_jabatan');
    }

    public function tunjangan()
    {
        return $this->hasmany('App\tunjangan','id_jabatan');
    }

    public function pegawai()
    {
        return $this->hasmany('App\pegawai','id_jabatan');
    }
}
