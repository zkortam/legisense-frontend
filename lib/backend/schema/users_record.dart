import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "realName" field.
  String? _realName;
  String get realName => _realName ?? '';
  bool hasRealName() => _realName != null;

  // "isCompressed" field.
  bool? _isCompressed;
  bool get isCompressed => _isCompressed ?? false;
  bool hasIsCompressed() => _isCompressed != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "county" field.
  String? _county;
  String get county => _county ?? '';
  bool hasCounty() => _county != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "race" field.
  String? _race;
  String get race => _race ?? '';
  bool hasRace() => _race != null;

  // "isStudent" field.
  bool? _isStudent;
  bool get isStudent => _isStudent ?? false;
  bool hasIsStudent() => _isStudent != null;

  // "isParent" field.
  bool? _isParent;
  bool get isParent => _isParent ?? false;
  bool hasIsParent() => _isParent != null;

  // "isAlone" field.
  bool? _isAlone;
  bool get isAlone => _isAlone ?? false;
  bool hasIsAlone() => _isAlone != null;

  // "isEmployed" field.
  bool? _isEmployed;
  bool get isEmployed => _isEmployed ?? false;
  bool hasIsEmployed() => _isEmployed != null;

  // "isReligious" field.
  bool? _isReligious;
  bool get isReligious => _isReligious ?? false;
  bool hasIsReligious() => _isReligious != null;

  // "isPolitical" field.
  bool? _isPolitical;
  bool get isPolitical => _isPolitical ?? false;
  bool hasIsPolitical() => _isPolitical != null;

  // "incomeRange" field.
  String? _incomeRange;
  String get incomeRange => _incomeRange ?? '';
  bool hasIncomeRange() => _incomeRange != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "pushNotifStatus" field.
  bool? _pushNotifStatus;
  bool get pushNotifStatus => _pushNotifStatus ?? false;
  bool hasPushNotifStatus() => _pushNotifStatus != null;

  // "emailNotifStatus" field.
  bool? _emailNotifStatus;
  bool get emailNotifStatus => _emailNotifStatus ?? false;
  bool hasEmailNotifStatus() => _emailNotifStatus != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _realName = snapshotData['realName'] as String?;
    _isCompressed = snapshotData['isCompressed'] as bool?;
    _country = snapshotData['country'] as String?;
    _state = snapshotData['state'] as String?;
    _county = snapshotData['county'] as String?;
    _city = snapshotData['city'] as String?;
    _race = snapshotData['race'] as String?;
    _isStudent = snapshotData['isStudent'] as bool?;
    _isParent = snapshotData['isParent'] as bool?;
    _isAlone = snapshotData['isAlone'] as bool?;
    _isEmployed = snapshotData['isEmployed'] as bool?;
    _isReligious = snapshotData['isReligious'] as bool?;
    _isPolitical = snapshotData['isPolitical'] as bool?;
    _incomeRange = snapshotData['incomeRange'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _time = snapshotData['time'] as DateTime?;
    _pushNotifStatus = snapshotData['pushNotifStatus'] as bool?;
    _emailNotifStatus = snapshotData['emailNotifStatus'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? realName,
  bool? isCompressed,
  String? country,
  String? state,
  String? county,
  String? city,
  String? race,
  bool? isStudent,
  bool? isParent,
  bool? isAlone,
  bool? isEmployed,
  bool? isReligious,
  bool? isPolitical,
  String? incomeRange,
  int? age,
  DateTime? time,
  bool? pushNotifStatus,
  bool? emailNotifStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'realName': realName,
      'isCompressed': isCompressed,
      'country': country,
      'state': state,
      'county': county,
      'city': city,
      'race': race,
      'isStudent': isStudent,
      'isParent': isParent,
      'isAlone': isAlone,
      'isEmployed': isEmployed,
      'isReligious': isReligious,
      'isPolitical': isPolitical,
      'incomeRange': incomeRange,
      'age': age,
      'time': time,
      'pushNotifStatus': pushNotifStatus,
      'emailNotifStatus': emailNotifStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.realName == e2?.realName &&
        e1?.isCompressed == e2?.isCompressed &&
        e1?.country == e2?.country &&
        e1?.state == e2?.state &&
        e1?.county == e2?.county &&
        e1?.city == e2?.city &&
        e1?.race == e2?.race &&
        e1?.isStudent == e2?.isStudent &&
        e1?.isParent == e2?.isParent &&
        e1?.isAlone == e2?.isAlone &&
        e1?.isEmployed == e2?.isEmployed &&
        e1?.isReligious == e2?.isReligious &&
        e1?.isPolitical == e2?.isPolitical &&
        e1?.incomeRange == e2?.incomeRange &&
        e1?.age == e2?.age &&
        e1?.time == e2?.time &&
        e1?.pushNotifStatus == e2?.pushNotifStatus &&
        e1?.emailNotifStatus == e2?.emailNotifStatus;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.realName,
        e?.isCompressed,
        e?.country,
        e?.state,
        e?.county,
        e?.city,
        e?.race,
        e?.isStudent,
        e?.isParent,
        e?.isAlone,
        e?.isEmployed,
        e?.isReligious,
        e?.isPolitical,
        e?.incomeRange,
        e?.age,
        e?.time,
        e?.pushNotifStatus,
        e?.emailNotifStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
