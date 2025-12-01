// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( ChangeStep value)?  changeStep,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ChangeStep() when changeStep != null:
return changeStep(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( ChangeStep value)  changeStep,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case ChangeStep():
return changeStep(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( ChangeStep value)?  changeStep,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ChangeStep() when changeStep != null:
return changeStep(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int step)?  changeStep,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ChangeStep() when changeStep != null:
return changeStep(_that.step);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int step)  changeStep,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case ChangeStep():
return changeStep(_that.step);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int step)?  changeStep,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ChangeStep() when changeStep != null:
return changeStep(_that.step);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements CheckoutState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.initial()';
}


}




/// @nodoc


class ChangeStep implements CheckoutState {
  const ChangeStep(this.step);
  

 final  int step;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeStepCopyWith<ChangeStep> get copyWith => _$ChangeStepCopyWithImpl<ChangeStep>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeStep&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'CheckoutState.changeStep(step: $step)';
}


}

/// @nodoc
abstract mixin class $ChangeStepCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory $ChangeStepCopyWith(ChangeStep value, $Res Function(ChangeStep) _then) = _$ChangeStepCopyWithImpl;
@useResult
$Res call({
 int step
});




}
/// @nodoc
class _$ChangeStepCopyWithImpl<$Res>
    implements $ChangeStepCopyWith<$Res> {
  _$ChangeStepCopyWithImpl(this._self, this._then);

  final ChangeStep _self;
  final $Res Function(ChangeStep) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(ChangeStep(
null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
