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
String _$postRepoCasheHash() => r'298201c37a698183912b42af42d9b4995aee7383';

/// キャッシュするためのProvider
///
/// Copied from [PostRepoCashe].
@ProviderFor(PostRepoCashe)
final postRepoCasheProvider =
    NotifierProvider<PostRepoCashe, Map<String, FriendEntity>>.internal(
  PostRepoCashe.new,
  name: r'postRepoCasheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepoCasheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostRepoCashe = Notifier<Map<String, FriendEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
