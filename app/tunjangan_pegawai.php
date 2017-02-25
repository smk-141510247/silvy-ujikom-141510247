<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tunjangan_pegawai extends Model
{
    protected $table = 'tunjangan_pegawais';
    protected $fillable = array('kode_tunjangan_id','id_pegawai');
    protected $visible = array('kode_tunjangan_id','id_pegawai');

   public function tunjangan()
   {
        return $this->belongsTo('App\tunjangan','kode_tunjangan_id');
   }

   public function pegawai()
   {
        return $this->belongsTo('App\pegawai','id_pegawai');
   }

   public function penggajian()
   {
      return $this->hasMany('App\penggajian','kode_tunjangan_id');
   }
   
}
