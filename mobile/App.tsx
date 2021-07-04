import React from 'react';
import { SafeAreaView, ScrollView, Text } from 'react-native';

const App = () => {
  return (
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <Text>Hello, React Native.</Text>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
