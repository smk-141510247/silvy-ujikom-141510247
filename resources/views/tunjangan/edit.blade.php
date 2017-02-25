@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Edit Data Tunjangan</div>

                <div class="panel-body">
                    {!! Form::model($tunjangan,['method' => 'PATCH','route'=>['tunjangan.update',$tunjangan->id]]) !!}
                <div class="form-group">
                    {!! Form::label('kode_tunjangan', 'Kode Tunjangan') !!}
                    {!! Form::text('kode_tunjangan',null,['class'=>'form-control']) !!}
                </div>
                
                    <div class="control-group">
                        <label class="control-label">Id Jabatan</label>
                        <div class="controls">
                            <select class="span11" name="id_jabatan">
                                @foreach ($jabatan as $data)
                                <option value="{{ $data->id }}">{{ $data->nama_jabatan }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Id Golongan</label>
                        <div class="controls">
                            <select class="span11" name="id_golongan">
                                @foreach ($golongan as $data)
                                <option value="{{ $data->id }}">{{ $data->nama_golongan }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                <div class="form-group">
                    {!! Form::label('status', 'Status') !!}
                    {!! Form::text('status',null,['class'=>'form-control']) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('jumlah_anak', 'Jumlah Anak') !!}
                    {!! Form::text('jumlah_anak',null,['class'=>'form-control']) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('besaran_uang', 'Besaran Uang') !!}
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