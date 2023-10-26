import { StatusBar } from 'react-native'
import { getDimention } from '../../utils/dimentions';

const { windowHeight } = getDimention()

export const TabHeight = 56;
export const TabBodyHeight = windowHeight - (StatusBar.currentHeight || 0);
