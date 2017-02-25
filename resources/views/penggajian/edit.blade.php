@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Update</div>

                <div class="panel-body">
                    {!! Form::model($penggajian,['method' => 'PATCH','route'=>['penggajian.update',$penggajian->id]]) !!}
                <div class="form-group">
                    {!! Form::label('tunjangan_pegawai_id', 'Id tunjangan pegawai : ') !!}
                    {!! Form::text('tunjangan_pegawai_id',$penggajian->tunjagan_pegawai_id,['class'=>'form-control']) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('jumlah_uang_lembur', 'Jumlah Uang Lembur : ') !!}
                    {!! Form::text('jumlah_uang_lembur',$penggajian->jumlah_uang_lembur,['class'=>'form-control']) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('gaji_pokok', 'Gaji pokok : ') !!}
                    {!! Form::text('gaji_pokok',$penggajian->gaji_pokok,['class'=>'form-control']) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('tanggal_pengambilan', 'Tanggal Pengambilan : ') !!}
                    {!! Form::date('tanggal_pengambilan',$penggajian->tanggal_pengambilan,['class'=>'form-control']) !!}
                </div>

                 <div class="form-group">
                    {!! Form::label('status_pengambilan', 'Status Pengambilan : ') !!}
                    {!! Form::text('status_pengambilan',$penggajian->status_pengambilan,['class'=>'form-control']) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('petugas_penerima', 'Petugas Penerima : ') !!}
                    {!! Form::text('petugas_penerima',$penggajian->petugas_penerima,['class'=>'form-control']) !!}
                </div>

                <div class="form-group">
                    {!! Form::submit('SAVE', ['class' => 'btn btn-primary']) !!}
                </div>
                {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection