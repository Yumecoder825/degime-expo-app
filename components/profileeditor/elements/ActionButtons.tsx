import { TouchableOpacity, StyleSheet, useColorScheme } from "react-native"
import { Ionicons } from '@expo/vector-icons';
import Colors from "../../../constants/Colors"
import { Text, View } from "../../Themed"

type TActionButtonsProps = {
    hideTrash?: boolean;
    onPressTrust?: TouchableOpacity['props']['onPress'];
    onPressReservation?: TouchableOpacity['props']['onPress'];
    onPressSave?: TouchableOpacity['props']['onPress'];
}

export function ActionButtons({ hideTrash, onPressReservation, onPressSave, onPressTrust }: TActionButtonsProps) {
    const colorTheme = useColorScheme() ?? 'light';

    return (
        <View
            style={styles.container}
        >
            <TouchableOpacity
                style={[
                    styles.button,
                    hideTrash && {
                        display: 'none'
                    }
                ]}
                onPress={onPressTrust}
            >
                <Ionicons name="trash-outline" size={24} color="black" />
            </TouchableOpacity>
            <TouchableOpacity
                style={[
                    styles.button, {
                        backgroundColor: Colors[colorTheme].primary
                    }
                ]}
                onPress={onPressSave}
            >
                <Text
                    darkColor="#000"
                    lightColor="#fff"
                    style={styles.buttonText}
                >
                    保存
                </Text>
            </TouchableOpacity>
            <TouchableOpacity
                style={[
                    styles.button, {
                        backgroundColor: Colors[colorTheme].orange1
                    }
                ]}
                onPress={onPressReservation}
            >
                <Text
                    darkColor="#000"
                    lightColor="#fff"
                    style={styles.buttonText}
                >
                    予約
                </Text>
            </TouchableOpacity>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'flex-end',
        gap: 4,
    },
    button: {
        paddingHorizontal: 12,
        paddingVertical: 4,
        borderRadius: 4,
    },
    buttonText: {
        fontSize: 14,
        fontWeight: '400'
    }
})