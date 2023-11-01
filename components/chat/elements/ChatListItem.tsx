import { useMemo, useState } from "react";
import { StyleSheet, TouchableOpacity, useColorScheme } from "react-native";
import { Image } from "expo-image";
import { Text, View } from "../../Themed";
import Colors from "../../../constants/Colors";
import BouncyCheckbox from "react-native-bouncy-checkbox";

export type TChatListItemProps = TouchableOpacity['props'] & {
    source: Image['props']['source'];
    isSelectMode?: boolean;
    newMsgCount?: string;
    avatarSize?: 'sm' | 'md';
    status?: 'online' | 'offline' | 'away';
    title: string;
    lastMsg: string;
    date: string;
}

function ChatListItemView({ source, newMsgCount, title, lastMsg, isSelectMode = false, date, status = 'away', avatarSize = 'md', ...props }: TChatListItemProps) {
    const colorScheme = useColorScheme() || 'light';

    const [isChecked, setIsChecked] = useState(false)

    const clr = useMemo(() => {
        if (status === 'online') {
            return '#05FF00'
        } else if (status === 'offline') {
            return 'red'
        }
        return '#FAFF00'
    }, [status])

    const handleOnPressCheckBox = (_checked: boolean) => {
        setIsChecked(_checked)
    }

    return (
        <TouchableOpacity style={styles.container}
            {...props}
        >
            <View
                style={styles.avatarView}
            >
                {

                    newMsgCount && (
                        <Text
                            style={[
                                styles.newMsgCount, {
                                    backgroundColor: Colors[colorScheme].purple1
                                }
                            ]}
                        >
                            {newMsgCount}
                        </Text>
                    )
                }
                <Image
                    style={[
                        avatarSize === 'md'
                            ? styles.avatar
                            : styles.avatarSM,
                        newMsgCount ? styles.avatarWithNewMsg : {}
                    ]}
                    source={source}
                />
                <View
                    style={[
                        styles.userActiveStatus, {
                            backgroundColor: clr
                        }, newMsgCount ? {
                            bottom: 0,
                            right: -6
                        } : {}
                    ]}
                ></View>
            </View>
            <View
                style={[
                    styles.infoGroup
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
                        style={styles.subTitle}
                    >
                        {lastMsg},
                    </Text>
                    <Text
                        style={styles.subTitle1}
                    >
                        {date}
                    </Text>
                </View>
                {
                    isSelectMode && (
                        <BouncyCheckbox
                            iconStyle={[
                                styles.checkboxIcon, isChecked && {
                                    backgroundColor: '#4C31F4',
                                }
                            ]}
                            innerIconStyle={[
                                styles.checkboxInnerIcon, {
                                    borderColor: '#0008'
                                },
                                isChecked && {
                                    borderColor: '#4C31F4',
                                }
                            ]}
                            onPress={handleOnPressCheckBox}
                        />
                    )
                }
            </View>
        </TouchableOpacity>
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
        marginLeft: 8,
        paddingHorizontal: 8,
    },
    details: {
        flexDirection: 'column',
        gap: 2,
        paddingBottom: 8
    },
    avatarView: {
        position: 'relative',
        backgroundColor: 'transparent',
        borderRadius: 999,

        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 6,
        },
        shadowOpacity: 0.37,
        shadowRadius: 7.49,

        elevation: 12,
    },
    avatar: {
        width: 44,
        height: 44,
        borderRadius: 999,
    },
    avatarSM: {
        width: 34,
        height: 34,
        borderRadius: 999,
    },
    avatarWithNewMsg: {
        width: 34,
        height: 34,
        borderRadius: 999,
        right: -8,
    },
    newMsgCount: {
        position: 'absolute',
        zIndex: 1,
        left: -8,
        top: -4,

        width: 28,
        height: 28,
        paddingLeft: 2,
        paddingTop: 4,
        borderRadius: 999,
        color: '#fff',
    },
    userActiveStatus: {
        position: 'absolute',
        borderRadius: 999,
        width: 8,
        height: 8,
        bottom: 4,
        right: 0,
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
        fontSize: 15,
        fontWeight: '400'
    },
    subTitle: {
        fontSize: 13,
        fontWeight: '300'
    },
    subTitle1: {
        fontSize: 9,
        fontWeight: '400'
    },
    subSection: {
        flexDirection: 'row',
        gap: 8
    },
    checkboxIcon: {
        borderRadius: 999,
        width: 15,
        height: 15,
    },
    checkboxInnerIcon: {
        borderRadius: 999,
        width: 15,
        height: 15
    },
})

export default ChatListItemView
