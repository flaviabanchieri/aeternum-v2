import '../database.dart';

class LeadTable extends SupabaseTable<LeadRow> {
  @override
  String get tableName => 'lead';

  @override
  LeadRow createRow(Map<String, dynamic> data) => LeadRow(data);
}

class LeadRow extends SupabaseDataRow {
  LeadRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeadTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get logradouro => getField<String>('logradouro');
  set logradouro(String? value) => setField<String>('logradouro', value);

  String? get documento => getField<String>('documento');
  set documento(String? value) => setField<String>('documento', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get origem => getField<String>('origem');
  set origem(String? value) => setField<String>('origem', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get produtoCodigo => getField<String>('produto_codigo');
  set produtoCodigo(String? value) => setField<String>('produto_codigo', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get numEndereco => getField<String>('num_endereco');
  set numEndereco(String? value) => setField<String>('num_endereco', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  int? get cep => getField<int>('cep');
  set cep(int? value) => setField<int>('cep', value);

  String? get pais => getField<String>('pais');
  set pais(String? value) => setField<String>('pais', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get urlCliente => getField<String>('url_cliente');
  set urlCliente(String? value) => setField<String>('url_cliente', value);

  DateTime? get dataAgendamento => getField<DateTime>('data_agendamento');
  set dataAgendamento(DateTime? value) =>
      setField<DateTime>('data_agendamento', value);

  DateTime? get createAt => getField<DateTime>('create_at');
  set createAt(DateTime? value) => setField<DateTime>('create_at', value);

  bool? get aprovacaoGestor => getField<bool>('aprovacao_gestor');
  set aprovacaoGestor(bool? value) => setField<bool>('aprovacao_gestor', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
