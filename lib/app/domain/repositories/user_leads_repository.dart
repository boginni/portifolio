import '../dto/entities/user/user_lead_entity.dart';
import '../dto/params/user_lead_param.dart';

abstract class UserLeadsRepository {
  const UserLeadsRepository();

  Future<List<UserLeadEntity>> index();

  Future<void> store(UserLeadParam param);

  Future<void> delete(int id);

  Future<void> sync();
}
