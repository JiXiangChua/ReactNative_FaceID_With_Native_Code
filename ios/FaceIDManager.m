//
//  FaceIDManager.m
//  RNNativeApp
//
//  Created by JI XIANG on 28/6/24.
//

#import "FaceIDManager.h"

@implementation FaceIDManager
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(authenticateWithFaceID: (RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
  // Create a new instance of LAContext for biometric authentication
  LAContext *context = [[LAContext alloc] init];
  NSError *error = nil;
  
  // Check if the device supports biometric authentication
  if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
    // Check if the available biometric on the device is Face ID
    if (context.biometryType == LABiometryTypeFaceID) {
      // Start the authentication process with Face ID
      [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
              localizedReason:@"Authenticate with Face ID"
                        reply:^(BOOL success, NSError *error) {
        if (success) {
          resolve(@"Authentication successful");
        } else {
          reject(@"authentication_error", @"Authentication failed", error);
        }
      }];
    } else {
      // Face ID is not available on this device
      reject(@"face_id_unavailable", @"Face ID is not available on this device", error);
    }
  } else {
    // Biometric authentication is not available on this device
    reject(@"biometry_unavailable", @"Biometric authentication is not available on this device", error);
  }
}

@end
