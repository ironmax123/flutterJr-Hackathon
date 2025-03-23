// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sampleRepoHash() => r'e34b2ac56053ff7d96810b3060f4d570b254c72d';

/// See also [sampleRepo].
@ProviderFor(sampleRepo)
final sampleRepoProvider = AutoDisposeProvider<SampleRepo>.internal(
  sampleRepo,
  name: r'sampleRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sampleRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SampleRepoRef = AutoDisposeProviderRef<SampleRepo>;
String _$postRepoCasheHash() => r'cb59b1e88cb2e45799072765f91ef85ef0b78aa5';

/// キャッシュするためのProvider
///
/// Copied from [PostRepoCashe].
@ProviderFor(PostRepoCashe)
final postRepoCasheProvider =
    NotifierProvider<PostRepoCashe, Map<String, SampleEntity>>.internal(
  PostRepoCashe.new,
  name: r'postRepoCasheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepoCasheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostRepoCashe = Notifier<Map<String, SampleEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
