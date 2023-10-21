import { Dimensions } from "react-native";

export function getDimention() {
    const windowWidth = Dimensions.get('window').width;
    const windowHeight = Dimensions.get('window').height;
    return {
        windowWidth,
        windowHeight
    }
}