import '../database.dart';

class ViewLeadTable extends SupabaseTable<ViewLeadRow> {
  @override
  String get tableName => 'view_lead';

  @override
  ViewLeadRow createRow(Map<String, dynamic> data) => ViewLeadRow(data);
}

class ViewLeadRow extends SupabaseDataRow {
  ViewLeadRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewLeadTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get idLead => getField<int>('id_lead');
  set idLead(int? value) => setField<int>('id_lead', value);

  String? get nomeLead => getField<String>('nome_lead');
  set nomeLead(String? value) => setField<String>('nome_lead', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get produtoCodigo => getField<String>('produto_codigo');
  set produtoCodigo(String? value) => setField<String>('produto_codigo', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get valorProduto => getField<double>('valor_produto');
  set valorProduto(double? value) => setField<double>('valor_produto', value);

  DateTime? get dataAgendamento => getField<DateTime>('data_agendamento');
  set dataAgendamento(DateTime? value) =>
      setField<DateTime>('data_agendamento', value);

  String? get dataFiltro => getField<String>('data_filtro');
  set dataFiltro(String? value) => setField<String>('data_filtro', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get origem => getField<String>('origem');
  set origem(String? value) => setField<String>('origem', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  String? get nomeUsuario => getField<String>('nome_usuario');
  set nomeUsuario(String? value) => setField<String>('nome_usuario', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  bool? get aprovacaoGestor => getField<bool>('aprovacao_gestor');
  set aprovacaoGestor(bool? value) => setField<bool>('aprovacao_gestor', value);
}
