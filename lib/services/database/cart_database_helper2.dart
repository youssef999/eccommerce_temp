
import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/model/product_moidel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper{


  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database  _database;

  Future<Database> get database async {
    if (_database != null){
      _database = await initDb();
    }
    //return _database;
    _database = await initDb();
   return _database;
  }


  initDb()async{

    String path=join(
        await getDatabasesPath(),'CartProduct.db');
    return await openDatabase(path,version:1,
    onCreate:(Database db, int version)async{
      await db.execute('''
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL,
       $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
         $columnQuant INTEGER,
         $columnProductId TEXT NOT NULL
         ,$columnProductColor TEXT NOT NULL,
         $columnProductSize TEXT NOT NULL
         
         )
      ''');
    }
    );
  }

 Future<List<CartProductModel>> getAllProduct()async{
    var dbClient =await database;
    List<Map>maps=await dbClient.query(tableCartProduct);
    List<CartProductModel>list=maps.isNotEmpty ? maps.map((product)=>CartProductModel
        .fromJson(product)).toList():[];
    return list;
  }

  insert(CartProductModel model)async{

  // print(model.toString());
    var dbClient =await database;
    await dbClient.insert(tableCartProduct,model.toJson(),
        conflictAlgorithm:ConflictAlgorithm.replace

    );

  }

  updateProduct(CartProductModel model)async{

    var dbClient =await database;

    await dbClient.update(tableCartProduct,model.toJson(),
        where: '$columnProductId = ?',whereArgs: [model.productId],
    );
    print("update2222");
  }


  Delete(CartProductModel model)async{
    var dbClient =await database;
    await dbClient.delete(tableCartProduct,
        where: '$columnProductId = ?',whereArgs: [model.productId],
    );
    print("Delete");
  }

  DeleteAll(CartProductModel model)async{
    var dbClient =await database;
    await dbClient.delete(tableCartProduct,
      // where: '$columnProductId = ?'
    );
    print("Delete");
  }


}