import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'usuario';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioTable();

  int? get permissao => getField<int>('permissao');
  set permissao(int? value) => setField<int>('permissao', value);

  String? get linkCheckout => getField<String>('link_checkout');
  set linkCheckout(String? value) => setField<String>('link_checkout', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get codigoPayt => getField<String>('codigo_payt');
  set codigoPayt(String? value) => setField<String>('codigo_payt', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool? get passwordDefault => getField<bool>('password_default');
  set passwordDefault(bool? value) => setField<bool>('password_default', value);

  int? get situacao => getField<int>('situacao');
  set situacao(int? value) => setField<int>('situacao', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  bool? get apagado => getField<bool>('apagado');
  set apagado(bool? value) => setField<bool>('apagado', value);
}
