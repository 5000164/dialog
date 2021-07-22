import { useContext } from 'react';
import { UserStatusContext } from '../context/userStatusContext';

export const useUserStatus = () => useContext(UserStatusContext);
