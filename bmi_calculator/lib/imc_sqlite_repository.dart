import 'imc_sqlite_model.dart';
import 'sqlitedatabase.dart';

class MedidaIMCSQLiteRepository {
  Future<List<IMCSQLiteModel>> obterDados() async {
    List<IMCSQLiteModel> medidas = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery("SELECT id, nome, altura, peso, imc, imc_descricao FROM imc_table");
    for (var element in result) {
      medidas.add(IMCSQLiteModel(
          int.parse(element["id"].toString()),
          element["nome"].toString(), 
          double.parse(element["altura"].toString()),
          double.parse(element["peso"].toString()),
          double.parse(element["imc"].toString()),
          element["imc_descricao"].toString(),
          ));
    }
    return medidas;
  }

  Future<void> salvar(IMCSQLiteModel imcSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('INSERT INTO imc_table (nome, altura, peso, imc, imc_descricao) values(?,?,?,?,?)',
        [
        imcSQLiteModel.nome, 
        imcSQLiteModel.altura,
        imcSQLiteModel.peso, 
        imcSQLiteModel.imc,
        imcSQLiteModel.imcDescricao
        ]);
  }

  Future<void> atualizar(IMCSQLiteModel imcSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        '''UPDATE imc_table SET 
        nome = ?,
        altura = ?,
        peso = ?,
        imc = ?,
        imc_descricao = ?
        WHERE id = ?'''
    , [
      imcSQLiteModel.nome,
      imcSQLiteModel.altura,
      imcSQLiteModel.peso,
      imcSQLiteModel.imc,
      imcSQLiteModel.imcDescricao,
      imcSQLiteModel.id
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('DELETE FROM imc_table WHERE id = ?', [id]);
  }
}