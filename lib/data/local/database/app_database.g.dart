// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverRevisionMeta = const VerificationMeta(
    'serverRevision',
  );
  @override
  late final GeneratedColumn<int> serverRevision = GeneratedColumn<int>(
    'server_revision',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sortOrder,
    createdAt,
    updatedAt,
    syncedAt,
    serverRevision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    }
    if (data.containsKey('server_revision')) {
      context.handle(
        _serverRevisionMeta,
        serverRevision.isAcceptableOrUnknown(
          data['server_revision']!,
          _serverRevisionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      ),
      serverRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_revision'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryRow extends DataClass implements Insertable<CategoryRow> {
  final String id;
  final String name;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? syncedAt;
  final int? serverRevision;
  const CategoryRow({
    required this.id,
    required this.name,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    this.syncedAt,
    this.serverRevision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<DateTime>(syncedAt);
    }
    if (!nullToAbsent || serverRevision != null) {
      map['server_revision'] = Variable<int>(serverRevision);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
      serverRevision: serverRevision == null && nullToAbsent
          ? const Value.absent()
          : Value(serverRevision),
    );
  }

  factory CategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncedAt: serializer.fromJson<DateTime?>(json['syncedAt']),
      serverRevision: serializer.fromJson<int?>(json['serverRevision']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncedAt': serializer.toJson<DateTime?>(syncedAt),
      'serverRevision': serializer.toJson<int?>(serverRevision),
    };
  }

  CategoryRow copyWith({
    String? id,
    String? name,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> syncedAt = const Value.absent(),
    Value<int?> serverRevision = const Value.absent(),
  }) => CategoryRow(
    id: id ?? this.id,
    name: name ?? this.name,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
    serverRevision: serverRevision.present
        ? serverRevision.value
        : this.serverRevision,
  );
  CategoryRow copyWithCompanion(CategoriesCompanion data) {
    return CategoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
      serverRevision: data.serverRevision.present
          ? data.serverRevision.value
          : this.serverRevision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('serverRevision: $serverRevision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    sortOrder,
    createdAt,
    updatedAt,
    syncedAt,
    serverRevision,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncedAt == this.syncedAt &&
          other.serverRevision == this.serverRevision);
}

class CategoriesCompanion extends UpdateCompanion<CategoryRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> syncedAt;
  final Value<int?> serverRevision;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.serverRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncedAt = const Value.absent(),
    this.serverRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CategoryRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? syncedAt,
    Expression<int>? serverRevision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (serverRevision != null) 'server_revision': serverRevision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? syncedAt,
    Value<int?>? serverRevision,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncedAt: syncedAt ?? this.syncedAt,
      serverRevision: serverRevision ?? this.serverRevision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (serverRevision.present) {
      map['server_revision'] = Variable<int>(serverRevision.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('serverRevision: $serverRevision, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isDemoMeta = const VerificationMeta('isDemo');
  @override
  late final GeneratedColumn<bool> isDemo = GeneratedColumn<bool>(
    'is_demo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_demo" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverRevisionMeta = const VerificationMeta(
    'serverRevision',
  );
  @override
  late final GeneratedColumn<int> serverRevision = GeneratedColumn<int>(
    'server_revision',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    name,
    price,
    isActive,
    isDemo,
    imagePath,
    createdAt,
    updatedAt,
    syncedAt,
    serverRevision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_demo')) {
      context.handle(
        _isDemoMeta,
        isDemo.isAcceptableOrUnknown(data['is_demo']!, _isDemoMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    }
    if (data.containsKey('server_revision')) {
      context.handle(
        _serverRevisionMeta,
        serverRevision.isAcceptableOrUnknown(
          data['server_revision']!,
          _serverRevisionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isDemo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_demo'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      ),
      serverRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_revision'],
      ),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductRow extends DataClass implements Insertable<ProductRow> {
  final String id;
  final String categoryId;
  final String name;
  final int price;
  final bool isActive;
  final bool isDemo;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? syncedAt;
  final int? serverRevision;
  const ProductRow({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.isActive,
    required this.isDemo,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    this.syncedAt,
    this.serverRevision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category_id'] = Variable<String>(categoryId);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<int>(price);
    map['is_active'] = Variable<bool>(isActive);
    map['is_demo'] = Variable<bool>(isDemo);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<DateTime>(syncedAt);
    }
    if (!nullToAbsent || serverRevision != null) {
      map['server_revision'] = Variable<int>(serverRevision);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
      price: Value(price),
      isActive: Value(isActive),
      isDemo: Value(isDemo),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
      serverRevision: serverRevision == null && nullToAbsent
          ? const Value.absent()
          : Value(serverRevision),
    );
  }

  factory ProductRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductRow(
      id: serializer.fromJson<String>(json['id']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int>(json['price']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isDemo: serializer.fromJson<bool>(json['isDemo']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncedAt: serializer.fromJson<DateTime?>(json['syncedAt']),
      serverRevision: serializer.fromJson<int?>(json['serverRevision']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'categoryId': serializer.toJson<String>(categoryId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int>(price),
      'isActive': serializer.toJson<bool>(isActive),
      'isDemo': serializer.toJson<bool>(isDemo),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncedAt': serializer.toJson<DateTime?>(syncedAt),
      'serverRevision': serializer.toJson<int?>(serverRevision),
    };
  }

  ProductRow copyWith({
    String? id,
    String? categoryId,
    String? name,
    int? price,
    bool? isActive,
    bool? isDemo,
    Value<String?> imagePath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> syncedAt = const Value.absent(),
    Value<int?> serverRevision = const Value.absent(),
  }) => ProductRow(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    price: price ?? this.price,
    isActive: isActive ?? this.isActive,
    isDemo: isDemo ?? this.isDemo,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
    serverRevision: serverRevision.present
        ? serverRevision.value
        : this.serverRevision,
  );
  ProductRow copyWithCompanion(ProductsCompanion data) {
    return ProductRow(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isDemo: data.isDemo.present ? data.isDemo.value : this.isDemo,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
      serverRevision: data.serverRevision.present
          ? data.serverRevision.value
          : this.serverRevision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductRow(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('isActive: $isActive, ')
          ..write('isDemo: $isDemo, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('serverRevision: $serverRevision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    categoryId,
    name,
    price,
    isActive,
    isDemo,
    imagePath,
    createdAt,
    updatedAt,
    syncedAt,
    serverRevision,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductRow &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.price == this.price &&
          other.isActive == this.isActive &&
          other.isDemo == this.isDemo &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncedAt == this.syncedAt &&
          other.serverRevision == this.serverRevision);
}

class ProductsCompanion extends UpdateCompanion<ProductRow> {
  final Value<String> id;
  final Value<String> categoryId;
  final Value<String> name;
  final Value<int> price;
  final Value<bool> isActive;
  final Value<bool> isDemo;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> syncedAt;
  final Value<int?> serverRevision;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDemo = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.serverRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String categoryId,
    required String name,
    required int price,
    this.isActive = const Value.absent(),
    this.isDemo = const Value.absent(),
    this.imagePath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncedAt = const Value.absent(),
    this.serverRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       categoryId = Value(categoryId),
       name = Value(name),
       price = Value(price),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProductRow> custom({
    Expression<String>? id,
    Expression<String>? categoryId,
    Expression<String>? name,
    Expression<int>? price,
    Expression<bool>? isActive,
    Expression<bool>? isDemo,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? syncedAt,
    Expression<int>? serverRevision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (isActive != null) 'is_active': isActive,
      if (isDemo != null) 'is_demo': isDemo,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (serverRevision != null) 'server_revision': serverRevision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? categoryId,
    Value<String>? name,
    Value<int>? price,
    Value<bool>? isActive,
    Value<bool>? isDemo,
    Value<String?>? imagePath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? syncedAt,
    Value<int?>? serverRevision,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      price: price ?? this.price,
      isActive: isActive ?? this.isActive,
      isDemo: isDemo ?? this.isDemo,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncedAt: syncedAt ?? this.syncedAt,
      serverRevision: serverRevision ?? this.serverRevision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isDemo.present) {
      map['is_demo'] = Variable<bool>(isDemo.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (serverRevision.present) {
      map['server_revision'] = Variable<int>(serverRevision.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('isActive: $isActive, ')
          ..write('isDemo: $isDemo, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('serverRevision: $serverRevision, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNumberMeta = const VerificationMeta(
    'displayNumber',
  );
  @override
  late final GeneratedColumn<String> displayNumber = GeneratedColumn<String>(
    'display_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderTypeMeta = const VerificationMeta(
    'orderType',
  );
  @override
  late final GeneratedColumn<String> orderType = GeneratedColumn<String>(
    'order_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _voidedAtMeta = const VerificationMeta(
    'voidedAt',
  );
  @override
  late final GeneratedColumn<DateTime> voidedAt = GeneratedColumn<DateTime>(
    'voided_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountPaidMeta = const VerificationMeta(
    'amountPaid',
  );
  @override
  late final GeneratedColumn<int> amountPaid = GeneratedColumn<int>(
    'amount_paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _changeAmountMeta = const VerificationMeta(
    'changeAmount',
  );
  @override
  late final GeneratedColumn<int> changeAmount = GeneratedColumn<int>(
    'change_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverRevisionMeta = const VerificationMeta(
    'serverRevision',
  );
  @override
  late final GeneratedColumn<int> serverRevision = GeneratedColumn<int>(
    'server_revision',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayNumber,
    createdAt,
    orderType,
    status,
    voidedAt,
    subtotal,
    total,
    paymentMethod,
    amountPaid,
    changeAmount,
    syncedAt,
    serverRevision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_number')) {
      context.handle(
        _displayNumberMeta,
        displayNumber.isAcceptableOrUnknown(
          data['display_number']!,
          _displayNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNumberMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('order_type')) {
      context.handle(
        _orderTypeMeta,
        orderType.isAcceptableOrUnknown(data['order_type']!, _orderTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_orderTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('voided_at')) {
      context.handle(
        _voidedAtMeta,
        voidedAt.isAcceptableOrUnknown(data['voided_at']!, _voidedAtMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
        _amountPaidMeta,
        amountPaid.isAcceptableOrUnknown(data['amount_paid']!, _amountPaidMeta),
      );
    } else if (isInserting) {
      context.missing(_amountPaidMeta);
    }
    if (data.containsKey('change_amount')) {
      context.handle(
        _changeAmountMeta,
        changeAmount.isAcceptableOrUnknown(
          data['change_amount']!,
          _changeAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_changeAmountMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    }
    if (data.containsKey('server_revision')) {
      context.handle(
        _serverRevisionMeta,
        serverRevision.isAcceptableOrUnknown(
          data['server_revision']!,
          _serverRevisionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_number'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      orderType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      voidedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}voided_at'],
      ),
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      amountPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_paid'],
      )!,
      changeAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}change_amount'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      ),
      serverRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_revision'],
      ),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final String id;
  final String displayNumber;
  final DateTime createdAt;
  final String orderType;
  final String status;
  final DateTime? voidedAt;
  final int subtotal;
  final int total;
  final String paymentMethod;
  final int amountPaid;
  final int changeAmount;
  final DateTime? syncedAt;
  final int? serverRevision;
  const TransactionRow({
    required this.id,
    required this.displayNumber,
    required this.createdAt,
    required this.orderType,
    required this.status,
    this.voidedAt,
    required this.subtotal,
    required this.total,
    required this.paymentMethod,
    required this.amountPaid,
    required this.changeAmount,
    this.syncedAt,
    this.serverRevision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_number'] = Variable<String>(displayNumber);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['order_type'] = Variable<String>(orderType);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || voidedAt != null) {
      map['voided_at'] = Variable<DateTime>(voidedAt);
    }
    map['subtotal'] = Variable<int>(subtotal);
    map['total'] = Variable<int>(total);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['amount_paid'] = Variable<int>(amountPaid);
    map['change_amount'] = Variable<int>(changeAmount);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<DateTime>(syncedAt);
    }
    if (!nullToAbsent || serverRevision != null) {
      map['server_revision'] = Variable<int>(serverRevision);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      displayNumber: Value(displayNumber),
      createdAt: Value(createdAt),
      orderType: Value(orderType),
      status: Value(status),
      voidedAt: voidedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(voidedAt),
      subtotal: Value(subtotal),
      total: Value(total),
      paymentMethod: Value(paymentMethod),
      amountPaid: Value(amountPaid),
      changeAmount: Value(changeAmount),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
      serverRevision: serverRevision == null && nullToAbsent
          ? const Value.absent()
          : Value(serverRevision),
    );
  }

  factory TransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<String>(json['id']),
      displayNumber: serializer.fromJson<String>(json['displayNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      orderType: serializer.fromJson<String>(json['orderType']),
      status: serializer.fromJson<String>(json['status']),
      voidedAt: serializer.fromJson<DateTime?>(json['voidedAt']),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      total: serializer.fromJson<int>(json['total']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      amountPaid: serializer.fromJson<int>(json['amountPaid']),
      changeAmount: serializer.fromJson<int>(json['changeAmount']),
      syncedAt: serializer.fromJson<DateTime?>(json['syncedAt']),
      serverRevision: serializer.fromJson<int?>(json['serverRevision']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayNumber': serializer.toJson<String>(displayNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'orderType': serializer.toJson<String>(orderType),
      'status': serializer.toJson<String>(status),
      'voidedAt': serializer.toJson<DateTime?>(voidedAt),
      'subtotal': serializer.toJson<int>(subtotal),
      'total': serializer.toJson<int>(total),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'amountPaid': serializer.toJson<int>(amountPaid),
      'changeAmount': serializer.toJson<int>(changeAmount),
      'syncedAt': serializer.toJson<DateTime?>(syncedAt),
      'serverRevision': serializer.toJson<int?>(serverRevision),
    };
  }

  TransactionRow copyWith({
    String? id,
    String? displayNumber,
    DateTime? createdAt,
    String? orderType,
    String? status,
    Value<DateTime?> voidedAt = const Value.absent(),
    int? subtotal,
    int? total,
    String? paymentMethod,
    int? amountPaid,
    int? changeAmount,
    Value<DateTime?> syncedAt = const Value.absent(),
    Value<int?> serverRevision = const Value.absent(),
  }) => TransactionRow(
    id: id ?? this.id,
    displayNumber: displayNumber ?? this.displayNumber,
    createdAt: createdAt ?? this.createdAt,
    orderType: orderType ?? this.orderType,
    status: status ?? this.status,
    voidedAt: voidedAt.present ? voidedAt.value : this.voidedAt,
    subtotal: subtotal ?? this.subtotal,
    total: total ?? this.total,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    amountPaid: amountPaid ?? this.amountPaid,
    changeAmount: changeAmount ?? this.changeAmount,
    syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
    serverRevision: serverRevision.present
        ? serverRevision.value
        : this.serverRevision,
  );
  TransactionRow copyWithCompanion(TransactionsCompanion data) {
    return TransactionRow(
      id: data.id.present ? data.id.value : this.id,
      displayNumber: data.displayNumber.present
          ? data.displayNumber.value
          : this.displayNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      orderType: data.orderType.present ? data.orderType.value : this.orderType,
      status: data.status.present ? data.status.value : this.status,
      voidedAt: data.voidedAt.present ? data.voidedAt.value : this.voidedAt,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      total: data.total.present ? data.total.value : this.total,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      amountPaid: data.amountPaid.present
          ? data.amountPaid.value
          : this.amountPaid,
      changeAmount: data.changeAmount.present
          ? data.changeAmount.value
          : this.changeAmount,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
      serverRevision: data.serverRevision.present
          ? data.serverRevision.value
          : this.serverRevision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('displayNumber: $displayNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('orderType: $orderType, ')
          ..write('status: $status, ')
          ..write('voidedAt: $voidedAt, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('serverRevision: $serverRevision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayNumber,
    createdAt,
    orderType,
    status,
    voidedAt,
    subtotal,
    total,
    paymentMethod,
    amountPaid,
    changeAmount,
    syncedAt,
    serverRevision,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRow &&
          other.id == this.id &&
          other.displayNumber == this.displayNumber &&
          other.createdAt == this.createdAt &&
          other.orderType == this.orderType &&
          other.status == this.status &&
          other.voidedAt == this.voidedAt &&
          other.subtotal == this.subtotal &&
          other.total == this.total &&
          other.paymentMethod == this.paymentMethod &&
          other.amountPaid == this.amountPaid &&
          other.changeAmount == this.changeAmount &&
          other.syncedAt == this.syncedAt &&
          other.serverRevision == this.serverRevision);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  final Value<String> id;
  final Value<String> displayNumber;
  final Value<DateTime> createdAt;
  final Value<String> orderType;
  final Value<String> status;
  final Value<DateTime?> voidedAt;
  final Value<int> subtotal;
  final Value<int> total;
  final Value<String> paymentMethod;
  final Value<int> amountPaid;
  final Value<int> changeAmount;
  final Value<DateTime?> syncedAt;
  final Value<int?> serverRevision;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.displayNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.orderType = const Value.absent(),
    this.status = const Value.absent(),
    this.voidedAt = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.total = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.changeAmount = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.serverRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String displayNumber,
    required DateTime createdAt,
    required String orderType,
    required String status,
    this.voidedAt = const Value.absent(),
    required int subtotal,
    required int total,
    required String paymentMethod,
    required int amountPaid,
    required int changeAmount,
    this.syncedAt = const Value.absent(),
    this.serverRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayNumber = Value(displayNumber),
       createdAt = Value(createdAt),
       orderType = Value(orderType),
       status = Value(status),
       subtotal = Value(subtotal),
       total = Value(total),
       paymentMethod = Value(paymentMethod),
       amountPaid = Value(amountPaid),
       changeAmount = Value(changeAmount);
  static Insertable<TransactionRow> custom({
    Expression<String>? id,
    Expression<String>? displayNumber,
    Expression<DateTime>? createdAt,
    Expression<String>? orderType,
    Expression<String>? status,
    Expression<DateTime>? voidedAt,
    Expression<int>? subtotal,
    Expression<int>? total,
    Expression<String>? paymentMethod,
    Expression<int>? amountPaid,
    Expression<int>? changeAmount,
    Expression<DateTime>? syncedAt,
    Expression<int>? serverRevision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayNumber != null) 'display_number': displayNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (orderType != null) 'order_type': orderType,
      if (status != null) 'status': status,
      if (voidedAt != null) 'voided_at': voidedAt,
      if (subtotal != null) 'subtotal': subtotal,
      if (total != null) 'total': total,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (changeAmount != null) 'change_amount': changeAmount,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (serverRevision != null) 'server_revision': serverRevision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? displayNumber,
    Value<DateTime>? createdAt,
    Value<String>? orderType,
    Value<String>? status,
    Value<DateTime?>? voidedAt,
    Value<int>? subtotal,
    Value<int>? total,
    Value<String>? paymentMethod,
    Value<int>? amountPaid,
    Value<int>? changeAmount,
    Value<DateTime?>? syncedAt,
    Value<int?>? serverRevision,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      displayNumber: displayNumber ?? this.displayNumber,
      createdAt: createdAt ?? this.createdAt,
      orderType: orderType ?? this.orderType,
      status: status ?? this.status,
      voidedAt: voidedAt ?? this.voidedAt,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      amountPaid: amountPaid ?? this.amountPaid,
      changeAmount: changeAmount ?? this.changeAmount,
      syncedAt: syncedAt ?? this.syncedAt,
      serverRevision: serverRevision ?? this.serverRevision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayNumber.present) {
      map['display_number'] = Variable<String>(displayNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<String>(orderType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (voidedAt.present) {
      map['voided_at'] = Variable<DateTime>(voidedAt.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<int>(amountPaid.value);
    }
    if (changeAmount.present) {
      map['change_amount'] = Variable<int>(changeAmount.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (serverRevision.present) {
      map['server_revision'] = Variable<int>(serverRevision.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('displayNumber: $displayNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('orderType: $orderType, ')
          ..write('status: $status, ')
          ..write('voidedAt: $voidedAt, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('serverRevision: $serverRevision, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionLinesTable extends TransactionLines
    with TableInfo<$TransactionLinesTable, TransactionLineRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionLinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _productNameSnapshotMeta =
      const VerificationMeta('productNameSnapshot');
  @override
  late final GeneratedColumn<String> productNameSnapshot =
      GeneratedColumn<String>(
        'product_name_snapshot',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _unitPriceSnapshotMeta = const VerificationMeta(
    'unitPriceSnapshot',
  );
  @override
  late final GeneratedColumn<int> unitPriceSnapshot = GeneratedColumn<int>(
    'unit_price_snapshot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int> qty = GeneratedColumn<int>(
    'qty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineTotalMeta = const VerificationMeta(
    'lineTotal',
  );
  @override
  late final GeneratedColumn<int> lineTotal = GeneratedColumn<int>(
    'line_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionId,
    productId,
    productNameSnapshot,
    unitPriceSnapshot,
    qty,
    lineTotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionLineRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('product_name_snapshot')) {
      context.handle(
        _productNameSnapshotMeta,
        productNameSnapshot.isAcceptableOrUnknown(
          data['product_name_snapshot']!,
          _productNameSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameSnapshotMeta);
    }
    if (data.containsKey('unit_price_snapshot')) {
      context.handle(
        _unitPriceSnapshotMeta,
        unitPriceSnapshot.isAcceptableOrUnknown(
          data['unit_price_snapshot']!,
          _unitPriceSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceSnapshotMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
        _qtyMeta,
        qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('line_total')) {
      context.handle(
        _lineTotalMeta,
        lineTotal.isAcceptableOrUnknown(data['line_total']!, _lineTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionLineRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionLineRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      ),
      productNameSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name_snapshot'],
      )!,
      unitPriceSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_snapshot'],
      )!,
      qty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty'],
      )!,
      lineTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total'],
      )!,
    );
  }

  @override
  $TransactionLinesTable createAlias(String alias) {
    return $TransactionLinesTable(attachedDatabase, alias);
  }
}

class TransactionLineRow extends DataClass
    implements Insertable<TransactionLineRow> {
  final String id;
  final String transactionId;
  final String? productId;
  final String productNameSnapshot;
  final int unitPriceSnapshot;
  final int qty;
  final int lineTotal;
  const TransactionLineRow({
    required this.id,
    required this.transactionId,
    this.productId,
    required this.productNameSnapshot,
    required this.unitPriceSnapshot,
    required this.qty,
    required this.lineTotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transaction_id'] = Variable<String>(transactionId);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    map['product_name_snapshot'] = Variable<String>(productNameSnapshot);
    map['unit_price_snapshot'] = Variable<int>(unitPriceSnapshot);
    map['qty'] = Variable<int>(qty);
    map['line_total'] = Variable<int>(lineTotal);
    return map;
  }

  TransactionLinesCompanion toCompanion(bool nullToAbsent) {
    return TransactionLinesCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      productNameSnapshot: Value(productNameSnapshot),
      unitPriceSnapshot: Value(unitPriceSnapshot),
      qty: Value(qty),
      lineTotal: Value(lineTotal),
    );
  }

  factory TransactionLineRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionLineRow(
      id: serializer.fromJson<String>(json['id']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      productId: serializer.fromJson<String?>(json['productId']),
      productNameSnapshot: serializer.fromJson<String>(
        json['productNameSnapshot'],
      ),
      unitPriceSnapshot: serializer.fromJson<int>(json['unitPriceSnapshot']),
      qty: serializer.fromJson<int>(json['qty']),
      lineTotal: serializer.fromJson<int>(json['lineTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'transactionId': serializer.toJson<String>(transactionId),
      'productId': serializer.toJson<String?>(productId),
      'productNameSnapshot': serializer.toJson<String>(productNameSnapshot),
      'unitPriceSnapshot': serializer.toJson<int>(unitPriceSnapshot),
      'qty': serializer.toJson<int>(qty),
      'lineTotal': serializer.toJson<int>(lineTotal),
    };
  }

  TransactionLineRow copyWith({
    String? id,
    String? transactionId,
    Value<String?> productId = const Value.absent(),
    String? productNameSnapshot,
    int? unitPriceSnapshot,
    int? qty,
    int? lineTotal,
  }) => TransactionLineRow(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    productId: productId.present ? productId.value : this.productId,
    productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
    unitPriceSnapshot: unitPriceSnapshot ?? this.unitPriceSnapshot,
    qty: qty ?? this.qty,
    lineTotal: lineTotal ?? this.lineTotal,
  );
  TransactionLineRow copyWithCompanion(TransactionLinesCompanion data) {
    return TransactionLineRow(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productNameSnapshot: data.productNameSnapshot.present
          ? data.productNameSnapshot.value
          : this.productNameSnapshot,
      unitPriceSnapshot: data.unitPriceSnapshot.present
          ? data.unitPriceSnapshot.value
          : this.unitPriceSnapshot,
      qty: data.qty.present ? data.qty.value : this.qty,
      lineTotal: data.lineTotal.present ? data.lineTotal.value : this.lineTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionLineRow(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('productId: $productId, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('unitPriceSnapshot: $unitPriceSnapshot, ')
          ..write('qty: $qty, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    transactionId,
    productId,
    productNameSnapshot,
    unitPriceSnapshot,
    qty,
    lineTotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionLineRow &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.productId == this.productId &&
          other.productNameSnapshot == this.productNameSnapshot &&
          other.unitPriceSnapshot == this.unitPriceSnapshot &&
          other.qty == this.qty &&
          other.lineTotal == this.lineTotal);
}

class TransactionLinesCompanion extends UpdateCompanion<TransactionLineRow> {
  final Value<String> id;
  final Value<String> transactionId;
  final Value<String?> productId;
  final Value<String> productNameSnapshot;
  final Value<int> unitPriceSnapshot;
  final Value<int> qty;
  final Value<int> lineTotal;
  final Value<int> rowid;
  const TransactionLinesCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productNameSnapshot = const Value.absent(),
    this.unitPriceSnapshot = const Value.absent(),
    this.qty = const Value.absent(),
    this.lineTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionLinesCompanion.insert({
    required String id,
    required String transactionId,
    this.productId = const Value.absent(),
    required String productNameSnapshot,
    required int unitPriceSnapshot,
    required int qty,
    required int lineTotal,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       transactionId = Value(transactionId),
       productNameSnapshot = Value(productNameSnapshot),
       unitPriceSnapshot = Value(unitPriceSnapshot),
       qty = Value(qty),
       lineTotal = Value(lineTotal);
  static Insertable<TransactionLineRow> custom({
    Expression<String>? id,
    Expression<String>? transactionId,
    Expression<String>? productId,
    Expression<String>? productNameSnapshot,
    Expression<int>? unitPriceSnapshot,
    Expression<int>? qty,
    Expression<int>? lineTotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (productId != null) 'product_id': productId,
      if (productNameSnapshot != null)
        'product_name_snapshot': productNameSnapshot,
      if (unitPriceSnapshot != null) 'unit_price_snapshot': unitPriceSnapshot,
      if (qty != null) 'qty': qty,
      if (lineTotal != null) 'line_total': lineTotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionLinesCompanion copyWith({
    Value<String>? id,
    Value<String>? transactionId,
    Value<String?>? productId,
    Value<String>? productNameSnapshot,
    Value<int>? unitPriceSnapshot,
    Value<int>? qty,
    Value<int>? lineTotal,
    Value<int>? rowid,
  }) {
    return TransactionLinesCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      productId: productId ?? this.productId,
      productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
      unitPriceSnapshot: unitPriceSnapshot ?? this.unitPriceSnapshot,
      qty: qty ?? this.qty,
      lineTotal: lineTotal ?? this.lineTotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (productNameSnapshot.present) {
      map['product_name_snapshot'] = Variable<String>(
        productNameSnapshot.value,
      );
    }
    if (unitPriceSnapshot.present) {
      map['unit_price_snapshot'] = Variable<int>(unitPriceSnapshot.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (lineTotal.present) {
      map['line_total'] = Variable<int>(lineTotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionLinesCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('productId: $productId, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('unitPriceSnapshot: $unitPriceSnapshot, ')
          ..write('qty: $qty, ')
          ..write('lineTotal: $lineTotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettingsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outletNameMeta = const VerificationMeta(
    'outletName',
  );
  @override
  late final GeneratedColumn<String> outletName = GeneratedColumn<String>(
    'outlet_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Outlet Saya'),
  );
  static const VerificationMeta _receiptFooterMeta = const VerificationMeta(
    'receiptFooter',
  );
  @override
  late final GeneratedColumn<String> receiptFooter = GeneratedColumn<String>(
    'receipt_footer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('light'),
  );
  static const VerificationMeta _dbSeededAtMeta = const VerificationMeta(
    'dbSeededAt',
  );
  @override
  late final GeneratedColumn<DateTime> dbSeededAt = GeneratedColumn<DateTime>(
    'db_seeded_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    outletName,
    receiptFooter,
    themeMode,
    dbSeededAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('outlet_name')) {
      context.handle(
        _outletNameMeta,
        outletName.isAcceptableOrUnknown(data['outlet_name']!, _outletNameMeta),
      );
    }
    if (data.containsKey('receipt_footer')) {
      context.handle(
        _receiptFooterMeta,
        receiptFooter.isAcceptableOrUnknown(
          data['receipt_footer']!,
          _receiptFooterMeta,
        ),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('db_seeded_at')) {
      context.handle(
        _dbSeededAtMeta,
        dbSeededAt.isAcceptableOrUnknown(
          data['db_seeded_at']!,
          _dbSeededAtMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettingsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      outletName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outlet_name'],
      )!,
      receiptFooter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_footer'],
      ),
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      dbSeededAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}db_seeded_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }
}

class AppSettingsRow extends DataClass implements Insertable<AppSettingsRow> {
  final int id;
  final String outletName;
  final String? receiptFooter;
  final String themeMode;
  final DateTime? dbSeededAt;
  final DateTime updatedAt;
  const AppSettingsRow({
    required this.id,
    required this.outletName,
    this.receiptFooter,
    required this.themeMode,
    this.dbSeededAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['outlet_name'] = Variable<String>(outletName);
    if (!nullToAbsent || receiptFooter != null) {
      map['receipt_footer'] = Variable<String>(receiptFooter);
    }
    map['theme_mode'] = Variable<String>(themeMode);
    if (!nullToAbsent || dbSeededAt != null) {
      map['db_seeded_at'] = Variable<DateTime>(dbSeededAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(
      id: Value(id),
      outletName: Value(outletName),
      receiptFooter: receiptFooter == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptFooter),
      themeMode: Value(themeMode),
      dbSeededAt: dbSeededAt == null && nullToAbsent
          ? const Value.absent()
          : Value(dbSeededAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSettingsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsRow(
      id: serializer.fromJson<int>(json['id']),
      outletName: serializer.fromJson<String>(json['outletName']),
      receiptFooter: serializer.fromJson<String?>(json['receiptFooter']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      dbSeededAt: serializer.fromJson<DateTime?>(json['dbSeededAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'outletName': serializer.toJson<String>(outletName),
      'receiptFooter': serializer.toJson<String?>(receiptFooter),
      'themeMode': serializer.toJson<String>(themeMode),
      'dbSeededAt': serializer.toJson<DateTime?>(dbSeededAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSettingsRow copyWith({
    int? id,
    String? outletName,
    Value<String?> receiptFooter = const Value.absent(),
    String? themeMode,
    Value<DateTime?> dbSeededAt = const Value.absent(),
    DateTime? updatedAt,
  }) => AppSettingsRow(
    id: id ?? this.id,
    outletName: outletName ?? this.outletName,
    receiptFooter: receiptFooter.present
        ? receiptFooter.value
        : this.receiptFooter,
    themeMode: themeMode ?? this.themeMode,
    dbSeededAt: dbSeededAt.present ? dbSeededAt.value : this.dbSeededAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AppSettingsRow copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettingsRow(
      id: data.id.present ? data.id.value : this.id,
      outletName: data.outletName.present
          ? data.outletName.value
          : this.outletName,
      receiptFooter: data.receiptFooter.present
          ? data.receiptFooter.value
          : this.receiptFooter,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      dbSeededAt: data.dbSeededAt.present
          ? data.dbSeededAt.value
          : this.dbSeededAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsRow(')
          ..write('id: $id, ')
          ..write('outletName: $outletName, ')
          ..write('receiptFooter: $receiptFooter, ')
          ..write('themeMode: $themeMode, ')
          ..write('dbSeededAt: $dbSeededAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    outletName,
    receiptFooter,
    themeMode,
    dbSeededAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsRow &&
          other.id == this.id &&
          other.outletName == this.outletName &&
          other.receiptFooter == this.receiptFooter &&
          other.themeMode == this.themeMode &&
          other.dbSeededAt == this.dbSeededAt &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettingsRow> {
  final Value<int> id;
  final Value<String> outletName;
  final Value<String?> receiptFooter;
  final Value<String> themeMode;
  final Value<DateTime?> dbSeededAt;
  final Value<DateTime> updatedAt;
  const AppSettingsTableCompanion({
    this.id = const Value.absent(),
    this.outletName = const Value.absent(),
    this.receiptFooter = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.dbSeededAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.outletName = const Value.absent(),
    this.receiptFooter = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.dbSeededAt = const Value.absent(),
    required DateTime updatedAt,
  }) : updatedAt = Value(updatedAt);
  static Insertable<AppSettingsRow> custom({
    Expression<int>? id,
    Expression<String>? outletName,
    Expression<String>? receiptFooter,
    Expression<String>? themeMode,
    Expression<DateTime>? dbSeededAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (outletName != null) 'outlet_name': outletName,
      if (receiptFooter != null) 'receipt_footer': receiptFooter,
      if (themeMode != null) 'theme_mode': themeMode,
      if (dbSeededAt != null) 'db_seeded_at': dbSeededAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AppSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? outletName,
    Value<String?>? receiptFooter,
    Value<String>? themeMode,
    Value<DateTime?>? dbSeededAt,
    Value<DateTime>? updatedAt,
  }) {
    return AppSettingsTableCompanion(
      id: id ?? this.id,
      outletName: outletName ?? this.outletName,
      receiptFooter: receiptFooter ?? this.receiptFooter,
      themeMode: themeMode ?? this.themeMode,
      dbSeededAt: dbSeededAt ?? this.dbSeededAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (outletName.present) {
      map['outlet_name'] = Variable<String>(outletName.value);
    }
    if (receiptFooter.present) {
      map['receipt_footer'] = Variable<String>(receiptFooter.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (dbSeededAt.present) {
      map['db_seeded_at'] = Variable<DateTime>(dbSeededAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('outletName: $outletName, ')
          ..write('receiptFooter: $receiptFooter, ')
          ..write('themeMode: $themeMode, ')
          ..write('dbSeededAt: $dbSeededAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SchemaMetaTable extends SchemaMeta
    with TableInfo<$SchemaMetaTable, SchemaMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchemaMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schema_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchemaMetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SchemaMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchemaMetaData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SchemaMetaTable createAlias(String alias) {
    return $SchemaMetaTable(attachedDatabase, alias);
  }
}

class SchemaMetaData extends DataClass implements Insertable<SchemaMetaData> {
  final String key;
  final String value;
  const SchemaMetaData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SchemaMetaCompanion toCompanion(bool nullToAbsent) {
    return SchemaMetaCompanion(key: Value(key), value: Value(value));
  }

  factory SchemaMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchemaMetaData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SchemaMetaData copyWith({String? key, String? value}) =>
      SchemaMetaData(key: key ?? this.key, value: value ?? this.value);
  SchemaMetaData copyWithCompanion(SchemaMetaCompanion data) {
    return SchemaMetaData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchemaMetaData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchemaMetaData &&
          other.key == this.key &&
          other.value == this.value);
}

class SchemaMetaCompanion extends UpdateCompanion<SchemaMetaData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SchemaMetaCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SchemaMetaCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SchemaMetaData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SchemaMetaCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SchemaMetaCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchemaMetaCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $TransactionLinesTable transactionLines = $TransactionLinesTable(
    this,
  );
  late final $AppSettingsTableTable appSettingsTable = $AppSettingsTableTable(
    this,
  );
  late final $SchemaMetaTable schemaMeta = $SchemaMetaTable(this);
  late final CatalogDao catalogDao = CatalogDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    products,
    transactions,
    transactionLines,
    appSettingsTable,
    schemaMeta,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'transactions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('transaction_lines', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'products',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('transaction_lines', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  required String name,
  Value<int> sortOrder,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> syncedAt,
  Value<int?> serverRevision,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> syncedAt,
  Value<int?> serverRevision,
  Value<int> rowid,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<ProductRow>>
  _productsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: 'categories__id__products__category_id',
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  GeneratedColumn<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => column,
  );

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryRow,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (CategoryRow, $$CategoriesTableReferences),
          CategoryRow,
          PrefetchHooks Function({bool productsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<int?> serverRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                serverRevision: serverRevision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<int?> serverRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                serverRevision: serverRevision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CategoriesTable, CategoryRow>(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedDataByColumns<
                      CategoryRow,
                      $CategoriesTable,
                      ProductRow,
                      $ProductsTable
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._productsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).productsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'category_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryRow,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (CategoryRow, $$CategoriesTableReferences),
      CategoryRow,
      PrefetchHooks Function({bool productsRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String id,
  required String categoryId,
  required String name,
  required int price,
  Value<bool> isActive,
  Value<bool> isDemo,
  Value<String?> imagePath,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> syncedAt,
  Value<int?> serverRevision,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<String> categoryId,
  Value<String> name,
  Value<int> price,
  Value<bool> isActive,
  Value<bool> isDemo,
  Value<String?> imagePath,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> syncedAt,
  Value<int?> serverRevision,
  Value<int> rowid,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, ProductRow> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('products__category_id__categories__id');

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransactionLinesTable, List<TransactionLineRow>>
  _transactionLinesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactionLines,
    aliasName: 'products__id__transaction_lines__product_id',
  );

  $$TransactionLinesTableProcessedTableManager get transactionLinesRefs {
    final manager = $$TransactionLinesTableTableManager(
      $_db,
      $_db.transactionLines,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionLinesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDemo => $composableBuilder(
    column: $table.isDemo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionLinesRefs(
    Expression<bool> Function($$TransactionLinesTableFilterComposer f) f,
  ) {
    final $$TransactionLinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionLines,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionLinesTableFilterComposer(
            $db: $db,
            $table: $db.transactionLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDemo => $composableBuilder(
    column: $table.isDemo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isDemo =>
      $composableBuilder(column: $table.isDemo, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  GeneratedColumn<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => column,
  );

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionLinesRefs<T extends Object>(
    Expression<T> Function($$TransactionLinesTableAnnotationComposer a) f,
  ) {
    final $$TransactionLinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionLines,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionLinesTableAnnotationComposer(
            $db: $db,
            $table: $db.transactionLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          ProductRow,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (ProductRow, $$ProductsTableReferences),
          ProductRow,
          PrefetchHooks Function({bool categoryId, bool transactionLinesRefs})
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isDemo = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<int?> serverRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                categoryId: categoryId,
                name: name,
                price: price,
                isActive: isActive,
                isDemo: isDemo,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                serverRevision: serverRevision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String categoryId,
                required String name,
                required int price,
                Value<bool> isActive = const Value.absent(),
                Value<bool> isDemo = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<int?> serverRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                categoryId: categoryId,
                name: name,
                price: price,
                isActive: isActive,
                isDemo: isDemo,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                serverRevision: serverRevision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductsTable, ProductRow>(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryId = false, transactionLinesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionLinesRefs) db.transactionLines,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$ProductsTableReferences
                                ._categoryIdTable(db),
                            referencedColumn: $$ProductsTableReferences
                                ._categoryIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionLinesRefs)
                        await $_getPrefetchedDataByColumns<
                          ProductRow,
                          $ProductsTable,
                          TransactionLineRow,
                          $TransactionLinesTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._transactionLinesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionLinesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'product_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      ProductRow,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (ProductRow, $$ProductsTableReferences),
      ProductRow,
      PrefetchHooks Function({bool categoryId, bool transactionLinesRefs})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required String displayNumber,
      required DateTime createdAt,
      required String orderType,
      required String status,
      Value<DateTime?> voidedAt,
      required int subtotal,
      required int total,
      required String paymentMethod,
      required int amountPaid,
      required int changeAmount,
      Value<DateTime?> syncedAt,
      Value<int?> serverRevision,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<String> displayNumber,
      Value<DateTime> createdAt,
      Value<String> orderType,
      Value<String> status,
      Value<DateTime?> voidedAt,
      Value<int> subtotal,
      Value<int> total,
      Value<String> paymentMethod,
      Value<int> amountPaid,
      Value<int> changeAmount,
      Value<DateTime?> syncedAt,
      Value<int?> serverRevision,
      Value<int> rowid,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionLinesTable, List<TransactionLineRow>>
  _transactionLinesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactionLines,
    aliasName: 'transactions__id__transaction_lines__transaction_id',
  );

  $$TransactionLinesTableProcessedTableManager get transactionLinesRefs {
    final manager = $$TransactionLinesTableTableManager(
      $_db,
      $_db.transactionLines,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionLinesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayNumber => $composableBuilder(
    column: $table.displayNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get voidedAt => $composableBuilder(
    column: $table.voidedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get changeAmount => $composableBuilder(
    column: $table.changeAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionLinesRefs(
    Expression<bool> Function($$TransactionLinesTableFilterComposer f) f,
  ) {
    final $$TransactionLinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionLines,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionLinesTableFilterComposer(
            $db: $db,
            $table: $db.transactionLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayNumber => $composableBuilder(
    column: $table.displayNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get voidedAt => $composableBuilder(
    column: $table.voidedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get changeAmount => $composableBuilder(
    column: $table.changeAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayNumber => $composableBuilder(
    column: $table.displayNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get orderType =>
      $composableBuilder(column: $table.orderType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get voidedAt =>
      $composableBuilder(column: $table.voidedAt, builder: (column) => column);

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => column,
  );

  GeneratedColumn<int> get changeAmount => $composableBuilder(
    column: $table.changeAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  GeneratedColumn<int> get serverRevision => $composableBuilder(
    column: $table.serverRevision,
    builder: (column) => column,
  );

  Expression<T> transactionLinesRefs<T extends Object>(
    Expression<T> Function($$TransactionLinesTableAnnotationComposer a) f,
  ) {
    final $$TransactionLinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionLines,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionLinesTableAnnotationComposer(
            $db: $db,
            $table: $db.transactionLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          TransactionRow,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (TransactionRow, $$TransactionsTableReferences),
          TransactionRow,
          PrefetchHooks Function({bool transactionLinesRefs})
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> orderType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> voidedAt = const Value.absent(),
                Value<int> subtotal = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<int> amountPaid = const Value.absent(),
                Value<int> changeAmount = const Value.absent(),
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<int?> serverRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                displayNumber: displayNumber,
                createdAt: createdAt,
                orderType: orderType,
                status: status,
                voidedAt: voidedAt,
                subtotal: subtotal,
                total: total,
                paymentMethod: paymentMethod,
                amountPaid: amountPaid,
                changeAmount: changeAmount,
                syncedAt: syncedAt,
                serverRevision: serverRevision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayNumber,
                required DateTime createdAt,
                required String orderType,
                required String status,
                Value<DateTime?> voidedAt = const Value.absent(),
                required int subtotal,
                required int total,
                required String paymentMethod,
                required int amountPaid,
                required int changeAmount,
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<int?> serverRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                displayNumber: displayNumber,
                createdAt: createdAt,
                orderType: orderType,
                status: status,
                voidedAt: voidedAt,
                subtotal: subtotal,
                total: total,
                paymentMethod: paymentMethod,
                amountPaid: amountPaid,
                changeAmount: changeAmount,
                syncedAt: syncedAt,
                serverRevision: serverRevision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionsTable, TransactionRow>(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionLinesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionLinesRefs) db.transactionLines,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionLinesRefs)
                    await $_getPrefetchedDataByColumns<
                      TransactionRow,
                      $TransactionsTable,
                      TransactionLineRow,
                      $TransactionLinesTable
                    >(
                      currentTable: table,
                      referencedTable: $$TransactionsTableReferences
                          ._transactionLinesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TransactionsTableReferences(
                            db,
                            table,
                            p0,
                          ).transactionLinesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'transaction_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      TransactionRow,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (TransactionRow, $$TransactionsTableReferences),
      TransactionRow,
      PrefetchHooks Function({bool transactionLinesRefs})
    >;
typedef $$TransactionLinesTableCreateCompanionBuilder =
    TransactionLinesCompanion Function({
      required String id,
      required String transactionId,
      Value<String?> productId,
      required String productNameSnapshot,
      required int unitPriceSnapshot,
      required int qty,
      required int lineTotal,
      Value<int> rowid,
    });
typedef $$TransactionLinesTableUpdateCompanionBuilder =
    TransactionLinesCompanion Function({
      Value<String> id,
      Value<String> transactionId,
      Value<String?> productId,
      Value<String> productNameSnapshot,
      Value<int> unitPriceSnapshot,
      Value<int> qty,
      Value<int> lineTotal,
      Value<int> rowid,
    });

final class $$TransactionLinesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionLinesTable,
          TransactionLineRow
        > {
  $$TransactionLinesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) => db
      .transactions
      .createAlias('transaction_lines__transaction_id__transactions__id');

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<String>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('transaction_lines__product_id__products__id');

  $$ProductsTableProcessedTableManager? get productId {
    final $_column = $_itemColumn<String>('product_id');
    if ($_column == null) return null;
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionLinesTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionLinesTable> {
  $$TransactionLinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceSnapshot => $composableBuilder(
    column: $table.unitPriceSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionLinesTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionLinesTable> {
  $$TransactionLinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceSnapshot => $composableBuilder(
    column: $table.unitPriceSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionLinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionLinesTable> {
  $$TransactionLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unitPriceSnapshot => $composableBuilder(
    column: $table.unitPriceSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<int> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<int> get lineTotal =>
      $composableBuilder(column: $table.lineTotal, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionLinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionLinesTable,
          TransactionLineRow,
          $$TransactionLinesTableFilterComposer,
          $$TransactionLinesTableOrderingComposer,
          $$TransactionLinesTableAnnotationComposer,
          $$TransactionLinesTableCreateCompanionBuilder,
          $$TransactionLinesTableUpdateCompanionBuilder,
          (TransactionLineRow, $$TransactionLinesTableReferences),
          TransactionLineRow,
          PrefetchHooks Function({bool transactionId, bool productId})
        > {
  $$TransactionLinesTableTableManager(
    _$AppDatabase db,
    $TransactionLinesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> transactionId = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String> productNameSnapshot = const Value.absent(),
                Value<int> unitPriceSnapshot = const Value.absent(),
                Value<int> qty = const Value.absent(),
                Value<int> lineTotal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionLinesCompanion(
                id: id,
                transactionId: transactionId,
                productId: productId,
                productNameSnapshot: productNameSnapshot,
                unitPriceSnapshot: unitPriceSnapshot,
                qty: qty,
                lineTotal: lineTotal,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String transactionId,
                Value<String?> productId = const Value.absent(),
                required String productNameSnapshot,
                required int unitPriceSnapshot,
                required int qty,
                required int lineTotal,
                Value<int> rowid = const Value.absent(),
              }) => TransactionLinesCompanion.insert(
                id: id,
                transactionId: transactionId,
                productId: productId,
                productNameSnapshot: productNameSnapshot,
                unitPriceSnapshot: unitPriceSnapshot,
                qty: qty,
                lineTotal: lineTotal,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionLinesTable, TransactionLineRow>(
                    table,
                  ),
                  $$TransactionLinesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (transactionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.transactionId,
                        referencedTable: $$TransactionLinesTableReferences
                            ._transactionIdTable(db),
                        referencedColumn: $$TransactionLinesTableReferences
                            ._transactionIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (productId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.productId,
                        referencedTable: $$TransactionLinesTableReferences
                            ._productIdTable(db),
                        referencedColumn: $$TransactionLinesTableReferences
                            ._productIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TransactionLinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionLinesTable,
      TransactionLineRow,
      $$TransactionLinesTableFilterComposer,
      $$TransactionLinesTableOrderingComposer,
      $$TransactionLinesTableAnnotationComposer,
      $$TransactionLinesTableCreateCompanionBuilder,
      $$TransactionLinesTableUpdateCompanionBuilder,
      (TransactionLineRow, $$TransactionLinesTableReferences),
      TransactionLineRow,
      PrefetchHooks Function({bool transactionId, bool productId})
    >;
typedef $$AppSettingsTableTableCreateCompanionBuilder =
    AppSettingsTableCompanion Function({
      Value<int> id,
      Value<String> outletName,
      Value<String?> receiptFooter,
      Value<String> themeMode,
      Value<DateTime?> dbSeededAt,
      required DateTime updatedAt,
    });
typedef $$AppSettingsTableTableUpdateCompanionBuilder =
    AppSettingsTableCompanion Function({
      Value<int> id,
      Value<String> outletName,
      Value<String?> receiptFooter,
      Value<String> themeMode,
      Value<DateTime?> dbSeededAt,
      Value<DateTime> updatedAt,
    });

class $$AppSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outletName => $composableBuilder(
    column: $table.outletName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptFooter => $composableBuilder(
    column: $table.receiptFooter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dbSeededAt => $composableBuilder(
    column: $table.dbSeededAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outletName => $composableBuilder(
    column: $table.outletName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptFooter => $composableBuilder(
    column: $table.receiptFooter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dbSeededAt => $composableBuilder(
    column: $table.dbSeededAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get outletName => $composableBuilder(
    column: $table.outletName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receiptFooter => $composableBuilder(
    column: $table.receiptFooter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<DateTime> get dbSeededAt => $composableBuilder(
    column: $table.dbSeededAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTableTable,
          AppSettingsRow,
          $$AppSettingsTableTableFilterComposer,
          $$AppSettingsTableTableOrderingComposer,
          $$AppSettingsTableTableAnnotationComposer,
          $$AppSettingsTableTableCreateCompanionBuilder,
          $$AppSettingsTableTableUpdateCompanionBuilder,
          (
            AppSettingsRow,
            BaseReferences<
              _$AppDatabase,
              $AppSettingsTableTable,
              AppSettingsRow
            >,
          ),
          AppSettingsRow,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableTableManager(
    _$AppDatabase db,
    $AppSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> outletName = const Value.absent(),
                Value<String?> receiptFooter = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<DateTime?> dbSeededAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AppSettingsTableCompanion(
                id: id,
                outletName: outletName,
                receiptFooter: receiptFooter,
                themeMode: themeMode,
                dbSeededAt: dbSeededAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> outletName = const Value.absent(),
                Value<String?> receiptFooter = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<DateTime?> dbSeededAt = const Value.absent(),
                required DateTime updatedAt,
              }) => AppSettingsTableCompanion.insert(
                id: id,
                outletName: outletName,
                receiptFooter: receiptFooter,
                themeMode: themeMode,
                dbSeededAt: dbSeededAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTableTable, AppSettingsRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $AppSettingsTableTable,
                    AppSettingsRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTableTable,
      AppSettingsRow,
      $$AppSettingsTableTableFilterComposer,
      $$AppSettingsTableTableOrderingComposer,
      $$AppSettingsTableTableAnnotationComposer,
      $$AppSettingsTableTableCreateCompanionBuilder,
      $$AppSettingsTableTableUpdateCompanionBuilder,
      (
        AppSettingsRow,
        BaseReferences<_$AppDatabase, $AppSettingsTableTable, AppSettingsRow>,
      ),
      AppSettingsRow,
      PrefetchHooks Function()
    >;
typedef $$SchemaMetaTableCreateCompanionBuilder = SchemaMetaCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SchemaMetaTableUpdateCompanionBuilder = SchemaMetaCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SchemaMetaTableFilterComposer
    extends Composer<_$AppDatabase, $SchemaMetaTable> {
  $$SchemaMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SchemaMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $SchemaMetaTable> {
  $$SchemaMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchemaMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchemaMetaTable> {
  $$SchemaMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SchemaMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchemaMetaTable,
          SchemaMetaData,
          $$SchemaMetaTableFilterComposer,
          $$SchemaMetaTableOrderingComposer,
          $$SchemaMetaTableAnnotationComposer,
          $$SchemaMetaTableCreateCompanionBuilder,
          $$SchemaMetaTableUpdateCompanionBuilder,
          (
            SchemaMetaData,
            BaseReferences<_$AppDatabase, $SchemaMetaTable, SchemaMetaData>,
          ),
          SchemaMetaData,
          PrefetchHooks Function()
        > {
  $$SchemaMetaTableTableManager(_$AppDatabase db, $SchemaMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchemaMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchemaMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchemaMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => SchemaMetaCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SchemaMetaCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SchemaMetaTable, SchemaMetaData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SchemaMetaTable,
                    SchemaMetaData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SchemaMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchemaMetaTable,
      SchemaMetaData,
      $$SchemaMetaTableFilterComposer,
      $$SchemaMetaTableOrderingComposer,
      $$SchemaMetaTableAnnotationComposer,
      $$SchemaMetaTableCreateCompanionBuilder,
      $$SchemaMetaTableUpdateCompanionBuilder,
      (
        SchemaMetaData,
        BaseReferences<_$AppDatabase, $SchemaMetaTable, SchemaMetaData>,
      ),
      SchemaMetaData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$TransactionLinesTableTableManager get transactionLines =>
      $$TransactionLinesTableTableManager(_db, _db.transactionLines);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
  $$SchemaMetaTableTableManager get schemaMeta =>
      $$SchemaMetaTableTableManager(_db, _db.schemaMeta);
}
