// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepoHash() => r'a96e2c00b726dc040946d522318d7e96b9f63c12';

/// See also [userRepo].
@ProviderFor(userRepo)
final userRepoProvider = AutoDisposeProvider<UserRepo>.internal(
  userRepo,
  name: r'userRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepoRef = AutoDisposeProviderRef<UserRepo>;
String _$userRepoCasheHash() => r'2baad499bad7972e1852b77142e6a34a1997d4e9';

/// See also [UserRepoCashe].
@ProviderFor(UserRepoCashe)
final userRepoCasheProvider =
    NotifierProvider<UserRepoCashe, Map<String, UserEntity>>.internal(
  UserRepoCashe.new,
  name: r'userRepoCasheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepoCasheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserRepoCashe = Notifier<Map<String, UserEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
