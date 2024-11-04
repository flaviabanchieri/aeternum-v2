import '../database.dart';

class ConfiguracoesTable extends SupabaseTable<ConfiguracoesRow> {
  @override
  String get tableName => 'configuracoes';

  @override
  ConfiguracoesRow createRow(Map<String, dynamic> data) =>
      ConfiguracoesRow(data);
}

class ConfiguracoesRow extends SupabaseDataRow {
  ConfiguracoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConfiguracoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  double get valorMetaMensal => getField<double>('valor_meta_mensal')!;
  set valorMetaMensal(double value) =>
      setField<double>('valor_meta_mensal', value);

  String? get mesAno => getField<String>('mes_ano');
  set mesAno(String? value) => setField<String>('mes_ano', value);
}
