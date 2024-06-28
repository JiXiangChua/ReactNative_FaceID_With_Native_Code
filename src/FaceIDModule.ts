import {NativeModules} from 'react-native';

const {FaceIDManager} = NativeModules;

export const authenticateWithFaceID = async (): Promise<string> => {
  return FaceIDManager.authenticateWithFaceID();
};
