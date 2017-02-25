@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Update</div>

                <div class="panel-body">
                    {!! Form::model($pegawai,['method' => 'PATCH','route'=>['pegawai.update',$pegawai->id]]) !!}
                <div class="form-group">
                    {!! Form::label('nip', 'NIP') !!}
                    {!! Form::text('nip',null,['class'=>'form-control']) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('id_user', 'Id User') !!}
                    {!! Form::text('id_user',null,['class'=>'form-control']) !!}
                </div>
  <div class="form-group{{ $errors->has('id_jabatan') ? ' has-error' : '' }}">
                    <div class="control-group">
                        <label for="id_jabatan" class="col-md-4 control-label" >Jabatan</label>
                        <div class="col-md-6">

                            <select class="form-control" name="id_jabatan">
                                @foreach ($jabatan as $data)
                                <option value="{{ $data->id }}">{{ $data->nama_jabatan }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div><br><br>

                    <div class="form-group{{ $errors->has('id_golongan') ? ' has-error' : '' }}">
                    <div class="control-group">
                        <label for="id_golongan" class="col-md-4 control-label" >Golongan</label>
                        <div class="col-md-6">

                            <select class="form-control" name="id_golongan">
                                @foreach ($golongan as $data)
                                <option value="{{ $data->id }}">{{ $data->nama_golongan }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div><br><br>
                </div>
                <div class="form-group{{ $errors->has('foto') ? ' has-error' : '' }}">
                            <label for="foto" class="col-md-4 control-label">Photo</label>

                            <div class="col-md-6">
                                <input id="foto" type="file" class="form-control" name="foto" value="{{ old('foto') }}" required autofocus>

                                @if ($errors->has('foto'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('foto') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div><br><br>

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