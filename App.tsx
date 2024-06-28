import React from 'react';
import {View, Button, Alert, StyleSheet} from 'react-native';
import {authenticateWithFaceID} from './src/FaceIDModule';

const App = () => {
  const handleFaceIDAuthentication = async () => {
    try {
      const result = await authenticateWithFaceID();
      Alert.alert('Authentication Success', result);
    } catch (error: any) {
      Alert.alert('Authentication Error', error.message);
    }
  };

  return (
    <View style={styles.container}>
      <Button
        title="Authenticate with Face ID"
        onPress={handleFaceIDAuthentication}
      />
    </View>
  );
};

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    justifyContent: 'center',
    alignItems: 'center',
  },
});
