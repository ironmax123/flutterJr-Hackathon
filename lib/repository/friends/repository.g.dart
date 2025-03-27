// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$friendRepoHash() => r'61472ad3548c4141781585ea67f79b1329dbd640';

/// See also [friendRepo].
@ProviderFor(friendRepo)
final friendRepoProvider = AutoDisposeProvider<FriendRepo>.internal(
  friendRepo,
  name: r'friendRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$friendRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FriendRepoRef = AutoDisposeProviderRef<FriendRepo>;
String _$friendRepoCasheHash() => r'b9b25849b887f8e503573cbfeffdde0857b2e166';

/// キャッシュするためのProvider
///
/// Copied from [FriendRepoCashe].
@ProviderFor(FriendRepoCashe)
final friendRepoCasheProvider =
    NotifierProvider<FriendRepoCashe, Map<String, FriendEntity>>.internal(
  FriendRepoCashe.new,
  name: r'friendRepoCasheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$friendRepoCasheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FriendRepoCashe = Notifier<Map<String, FriendEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
