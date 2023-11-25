import { StyleSheet, TouchableOpacity, useColorScheme } from "react-native";
import { Image } from "expo-image";
import { Text, View } from "../Themed";
import Colors from "../../constants/Colors";

export type TProfileItemViewProps = {
    source: Image['props']['source'];
    title: string;
    date1: string;
    date2: string;
    onPressChat?: TouchableOpacity['props']['onPress'];
}

export function ProfileItemView({ source, title, date1, date2, onPressChat }: TProfileItemViewProps) {
    const colortheme = useColorScheme();

    return (
        <View style={styles.container}>
            <Image
                style={styles.avatar}
                source={source}
            />
            <View
                style={[
                    styles.infoGroup, {
                        borderBottomColor: Colors[colortheme ?? 'light'].gray2
                    }
                ]}
            >
                <View
                    style={styles.details}
                >
                    <Text
                        style={styles.title}
                    >
                        {title}
                    </Text>
                    <Text
                        style={[
                            styles.subTitle, {
                                color: Colors[colortheme ?? 'light'].textLight,
                            }]}
                    >
                        {date1}
                    </Text>
                    <Text
                        style={[
                            styles.subTitle, {
                                color: Colors[colortheme ?? 'light'].textLight,
                            }]}
                    >
                        {date2}
                    </Text>
                </View>
                <TouchableOpacity
                    style={[
                        styles.btn, {
                            backgroundColor: Colors[colortheme ?? 'light'].primary,
                        }
                    ]}
                    onPress={onPressChat}
                >
                    <Text
                        style={styles.btnText}
                    >チャット</Text>
                </TouchableOpacity>
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        paddingHorizontal: 8,
        paddingVertical: 4,
    },
    infoGroup: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        paddingHorizontal: 8,
        borderBottomWidth: 2,
    },
    details: {
        flexDirection: 'column',
        gap: 2,
        paddingBottom: 8
    },
    avatar: {
        width: 40,
        height: 40,
        borderRadius: 999,
    },
    btn: {
        paddingHorizontal: 12,
        paddingVertical: 8,
        borderRadius: 999,
    },
    btnText: {
        color: '#fff',
        fontSize: 10
    },
    title: {
        fontSize: 11,
        fontWeight: '400'
    },
    subTitle: {
        fontSize: 10,
        fontWeight: '400'
    }
})