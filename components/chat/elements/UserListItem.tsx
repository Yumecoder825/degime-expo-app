import { StyleSheet, TouchableOpacity, useColorScheme } from "react-native";
import { Image } from "expo-image";
import { Text, View } from "../../Themed";
import Colors from "../../../constants/Colors";

export type TUserListItemViewProps = {
    source: Image['props']['source'];
    title: string;
    phone: string;
    date: string;
    onPressChat?: TouchableOpacity['props']['onPress'];
}

function UserListItemView({ source, title, phone, date, onPressChat }: TUserListItemViewProps) {
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
                    <View
                        style={styles.subSection}
                    >
                        <Text
                            style={[
                                styles.subTitle, {
                                    color: Colors[colortheme ?? 'light'].textLight,
                                }]}
                        >
                            {phone},
                        </Text>
                        <Text
                            style={[
                                styles.subTitle, {
                                    color: Colors[colortheme ?? 'light'].textLight,
                                }]}
                        >
                            {date}
                        </Text>
                    </View>
                </View>
                <TouchableOpacity
                    style={[
                        styles.btn, {
                            backgroundColor: Colors[colortheme ?? 'light'].orange1,
                        }
                    ]}
                    onPress={onPressChat}
                >
                    <Text
                        style={styles.btnText}
                    >チャットを申請</Text>
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
        borderBottomWidth: 1,
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
        paddingHorizontal: 4,
        paddingVertical: 2,
        borderRadius: 999,
    },
    btnText: {
        color: '#fff',
        fontSize: 9,
        fontWeight: '400'
    },
    title: {
        fontSize: 11,
        fontWeight: '700'
    },
    subTitle: {
        fontSize: 10,
        fontWeight: '400'
    },
    subSection: {
        flexDirection: 'row',
        gap: 8
    }
})

export default UserListItemView
