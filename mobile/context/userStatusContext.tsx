import React, { createContext, ReactChild, useState } from 'react';

export const UserStatusContext = createContext({
  isSignedIn: false,
  setIsSignedIn: () => {},
} as {
  isSignedIn: boolean;
  setIsSignedIn: (isSignedIn: boolean) => void;
});

export const UserStatusContextProvider = ({
  children,
}: {
  children: ReactChild;
}) => {
  const [isSignedIn, setIsSignedIn] = useState(false);

  return (
    <UserStatusContext.Provider value={{ isSignedIn, setIsSignedIn }}>
      {children}
    </UserStatusContext.Provider>
  );
};
