@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Edit Data Lembur Pegawai</div>

                <div class="panel-body">
                    {!! Form::model($lemburpegawai,['method' => 'PATCH','route'=>['lemburpegawai.update',$lemburpegawai->id]]) !!}
                    
                <div class="form-group">
                    <label>Id Kode Lembur</label>   
                    <div class="controls">
                  <select class="form-control" name="kode_lembur_id">
                                @foreach ($kategori as $data)
                                <option value="{{ $data->id }}">{{ $data->kode_lembur }}</option>
                                @endforeach
                            </select>
                </div>
      
                    <div class="control-group">
                        <label class="control-label">Id Pegawai</label>
                        <div class="controls">
                            <select class="span11" name="id_pegawai">
                                @foreach ($pegawai as $data)
                                <option value="{{ $data->id }}">{{ $data->User->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                <div class="form-group">
                    {!! Form::label('jumlah jam', 'jumlah jam') !!}
                    {!! Form::text('jumlah_jam',null,['class'=>'form-control']) !!}
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