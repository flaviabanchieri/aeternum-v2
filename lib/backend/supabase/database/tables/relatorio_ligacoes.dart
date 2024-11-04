import '../database.dart';

class RelatorioLigacoesTable extends SupabaseTable<RelatorioLigacoesRow> {
  @override
  String get tableName => 'relatorio_ligacoes';

  @override
  RelatorioLigacoesRow createRow(Map<String, dynamic> data) =>
      RelatorioLigacoesRow(data);
}

class RelatorioLigacoesRow extends SupabaseDataRow {
  RelatorioLigacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RelatorioLigacoesTable();

  DateTime? get dataLigacao => getField<DateTime>('data_ligacao');
  set dataLigacao(DateTime? value) => setField<DateTime>('data_ligacao', value);

  String? get nomeLead => getField<String>('nome_lead');
  set nomeLead(String? value) => setField<String>('nome_lead', value);

  String? get nomeAtendente => getField<String>('nome_atendente');
  set nomeAtendente(String? value) => setField<String>('nome_atendente', value);

  String? get tempoLigacao => getField<String>('tempo_ligacao');
  set tempoLigacao(String? value) => setField<String>('tempo_ligacao', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  String? get statusLead => getField<String>('status_lead');
  set statusLead(String? value) => setField<String>('status_lead', value);

  String? get urlGravacao => getField<String>('url_gravacao');
  set urlGravacao(String? value) => setField<String>('url_gravacao', value);

  bool? get aprovacaoGestor => getField<bool>('aprovacao_gestor');
  set aprovacaoGestor(bool? value) => setField<bool>('aprovacao_gestor', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  String? get usuarioId => getField<String>('usuario_id');
  set usuarioId(String? value) => setField<String>('usuario_id', value);

  int? get statusId => getField<int>('status_id');
  set statusId(int? value) => setField<int>('status_id', value);

  String? get produtoCodigo => getField<String>('produto_codigo');
  set produtoCodigo(String? value) => setField<String>('produto_codigo', value);
}
