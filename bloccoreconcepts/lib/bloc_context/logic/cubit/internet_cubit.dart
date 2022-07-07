import 'dart:async';
import 'package:bloccoreconcepts/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivitySubscriptionStream;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    // Subscribe to connectivity changes
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    try {
      return connectivitySubscriptionStream = connectivity.onConnectivityChanged
          .listen((ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          emit(InternetDisconnected());
        } else if (result == ConnectivityResult.wifi) {
          emitInternetConnected(ConnectionType.Wifi);
        } else if (result == ConnectivityResult.mobile) {
          emitInternetConnected(ConnectionType.Mobile);
        }
      });
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void emitInternetConnected(ConnectionType connectionType) {
    emit(InternetConnected(connectionType: connectionType));
  }

  void emitInternetDisconnected() {
    emit(InternetDisconnected());
  }

  @override
  Future<void> close() {
    connectivitySubscriptionStream.cancel();
    return super.close();
  }
}
