import { StyleSheet, TouchableOpacity } from "react-native";
import { AntDesign } from '@expo/vector-icons';
import { Text, View } from "../../Themed";

export function Reservation() {
    return (
        <View
            style={styles.header}
        >
            <View
                style={styles.header}
            >
                <Text>
                    予約設定
                </Text>
                <TouchableOpacity>
                    <AntDesign name="close" size={24} color="black" />
                </TouchableOpacity>
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
    },
    header: {
    }
})