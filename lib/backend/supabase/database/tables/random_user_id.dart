import '../database.dart';

class RandomUserIdTable extends SupabaseTable<RandomUserIdRow> {
  @override
  String get tableName => 'random_user_id';

  @override
  RandomUserIdRow createRow(Map<String, dynamic> data) => RandomUserIdRow(data);
}

class RandomUserIdRow extends SupabaseDataRow {
  RandomUserIdRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RandomUserIdTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);
}
