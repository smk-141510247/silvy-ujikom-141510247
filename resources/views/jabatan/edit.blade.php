@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading"> Edit Data Jabatan</div>

                <div class="panel-body">
                    {!! Form::model($jabatan,['method' => 'PATCH','route'=>['jabatan.update',$jabatan->id]]) !!}
                <div class="form-group">
                    {!! Form::label('kode_jabatan', 'Kode Jabatan') !!}
                    {!! Form::text('kode_jabatan',null,['class'=>'form-control']) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('nama_jabatan', 'Nama Jabatan') !!}
                    {!! Form::text('nama_jabatan',null,['class'=>'form-control']) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('besaran_uang', 'Besaran uang') !!}
                    {!! Form::text('besaran_uang',null,['class'=>'form-control']) !!}
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