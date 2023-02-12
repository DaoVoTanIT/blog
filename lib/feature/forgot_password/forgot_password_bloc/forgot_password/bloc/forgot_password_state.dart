import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  const ForgotPasswordSuccess();

  @override
  List<Object> get props => [];
}

class GetCapChaSuccess extends ForgotPasswordState {
  GetCapChaSuccess(this.urlImage);
  Image urlImage;

  @override
  List<Object> get props => [];
}

class ForgotPasswordFailure extends ForgotPasswordState {
  const ForgotPasswordFailure({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
