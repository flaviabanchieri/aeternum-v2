import '../database.dart';

class ViewLigacoesTable extends SupabaseTable<ViewLigacoesRow> {
  @override
  String get tableName => 'view_ligacoes';

  @override
  ViewLigacoesRow createRow(Map<String, dynamic> data) => ViewLigacoesRow(data);
}

class ViewLigacoesRow extends SupabaseDataRow {
  ViewLigacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewLigacoesTable();

  DateTime? get dataLead => getField<DateTime>('data_lead');
  set dataLead(DateTime? value) => setField<DateTime>('data_lead', value);

  int? get idLigacao => getField<int>('id_ligacao');
  set idLigacao(int? value) => setField<int>('id_ligacao', value);

  int? get idLead => getField<int>('id_lead');
  set idLead(int? value) => setField<int>('id_lead', value);

  String? get leadNome => getField<String>('lead_nome');
  set leadNome(String? value) => setField<String>('lead_nome', value);

  int? get idStatus => getField<int>('id_status');
  set idStatus(int? value) => setField<int>('id_status', value);

  String? get statusLead => getField<String>('status_lead');
  set statusLead(String? value) => setField<String>('status_lead', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);

  DateTime? get horaInicio => getField<DateTime>('hora_inicio');
  set horaInicio(DateTime? value) => setField<DateTime>('hora_inicio', value);

  DateTime? get horaFim => getField<DateTime>('hora_fim');
  set horaFim(DateTime? value) => setField<DateTime>('hora_fim', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get urlGravacao => getField<String>('url_gravacao');
  set urlGravacao(String? value) => setField<String>('url_gravacao', value);

  String? get statusLigacao => getField<String>('status_ligacao');
  set statusLigacao(String? value) => setField<String>('status_ligacao', value);

  String? get atendente => getField<String>('atendente');
  set atendente(String? value) => setField<String>('atendente', value);

  String? get produtoCodigo => getField<String>('produto_codigo');
  set produtoCodigo(String? value) => setField<String>('produto_codigo', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  String? get origem => getField<String>('origem');
  set origem(String? value) => setField<String>('origem', value);

  String? get duracaoLigacao => getField<String>('duracao_ligacao');
  set duracaoLigacao(String? value) =>
      setField<String>('duracao_ligacao', value);
}
