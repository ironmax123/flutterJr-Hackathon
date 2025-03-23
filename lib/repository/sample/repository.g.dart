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
String _$sampleRepoCasheHash() => r'53f41d21fb0abbe233949cd9901a2d6f2da15f5c';

/// キャッシュするためのProvider
///
/// Copied from [SampleRepoCashe].
@ProviderFor(SampleRepoCashe)
final sampleRepoCasheProvider =
    NotifierProvider<SampleRepoCashe, Map<String, SampleEntity>>.internal(
  SampleRepoCashe.new,
  name: r'sampleRepoCasheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sampleRepoCasheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SampleRepoCashe = Notifier<Map<String, SampleEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
