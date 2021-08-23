abstract class IRepositoryh<T> {
  Future<List<T>> findAll();

  Future<T> find(int id);

  Future<int> insert(T entity);

  Future<int> update({
    required T enitity,
    required String conditions,
    required List conditionsValues,
  });

  Future<int> remove({
    required String conditions,
    required List conditionsValues,
  });
}
