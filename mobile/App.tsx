import 'react-native-gesture-handler';
import React from 'react';
import { Button, SafeAreaView, ScrollView, Text } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import {
  createStackNavigator,
  StackNavigationProp,
} from '@react-navigation/stack';
import { UserStatusContextProvider } from './context/userStatusContext';
import { useUserStatus } from './hooks/useUserStatus';

type StackParamList = {
  Home: undefined;
  Details: undefined;
  SignIn: undefined;
};
const Stack = createStackNavigator<StackParamList>();

const App = () => {
  return (
    <UserStatusContextProvider>
      <Navigator />
    </UserStatusContextProvider>
  );
};

const Navigator = () => {
  const { isSignedIn } = useUserStatus();

  return (
    <NavigationContainer>
      <Stack.Navigator>
        {isSignedIn ? (
          <>
            <Stack.Screen name="Home" component={HomeScreen} />
            <Stack.Screen name="Details" component={DetailsScreen} />
          </>
        ) : (
          <>
            <Stack.Screen name="SignIn" component={SignInScreen} />
          </>
        )}
      </Stack.Navigator>
    </NavigationContainer>
  );
};

const HomeScreen = ({
  navigation,
}: {
  navigation: StackNavigationProp<StackParamList, 'Home'>;
}) => {
  return (
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <Text>Home</Text>
        <Button
          title="Go to Details"
          onPress={() => navigation.navigate('Details')}
        />
      </ScrollView>
    </SafeAreaView>
  );
};

const DetailsScreen = ({
  navigation,
}: {
  navigation: StackNavigationProp<StackParamList, 'Details'>;
}) => {
  return (
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <Text>Details</Text>
        <Button title="Go back" onPress={() => navigation.goBack()} />
      </ScrollView>
    </SafeAreaView>
  );
};

const SignInScreen = () => {
  const { setIsSignedIn } = useUserStatus();

  return (
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <Text>Hello, React Native.</Text>
        <Button title="Sign In" onPress={() => setIsSignedIn(true)} />
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
