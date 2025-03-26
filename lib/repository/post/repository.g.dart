// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postRepoHash() => r'4dd280b759c91b57666f79bcceb36fa821a23990';

/// See also [postRepo].
@ProviderFor(postRepo)
final postRepoProvider = AutoDisposeProvider<PostRepo>.internal(
  postRepo,
  name: r'postRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PostRepoRef = AutoDisposeProviderRef<PostRepo>;
String _$postRepoCasheHash() => r'4b4f01a798a8da59536053a1d375ef6a17dd685c';

/// キャッシュするためのProvider
///
/// Copied from [PostRepoCashe].
@ProviderFor(PostRepoCashe)
final postRepoCasheProvider =
    NotifierProvider<PostRepoCashe, Map<String, PostEntity>>.internal(
  PostRepoCashe.new,
  name: r'postRepoCasheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepoCasheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostRepoCashe = Notifier<Map<String, PostEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
