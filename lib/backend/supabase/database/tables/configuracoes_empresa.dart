import '../database.dart';

class ConfiguracoesEmpresaTable extends SupabaseTable<ConfiguracoesEmpresaRow> {
  @override
  String get tableName => 'configuracoes_empresa';

  @override
  ConfiguracoesEmpresaRow createRow(Map<String, dynamic> data) =>
      ConfiguracoesEmpresaRow(data);
}

class ConfiguracoesEmpresaRow extends SupabaseDataRow {
  ConfiguracoesEmpresaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConfiguracoesEmpresaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get token => getField<String>('token');
  set token(String? value) => setField<String>('token', value);

  String? get refreshToken => getField<String>('refresh_token');
  set refreshToken(String? value) => setField<String>('refresh_token', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get userKey => getField<String>('userKey');
  set userKey(String? value) => setField<String>('userKey', value);

  String? get lineId => getField<String>('lineId');
  set lineId(String? value) => setField<String>('lineId', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);
}
