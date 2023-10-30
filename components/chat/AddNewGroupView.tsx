import React, { useState } from 'react'
import { TouchableOpacity, StyleSheet, useColorScheme, ScrollView } from 'react-native'
import { AntDesign } from '@expo/vector-icons'
import { Image } from 'expo-image'
import AppImages from '../../constants/Images'
import { getDimention } from '../../utils/dimentions'
import { TabHeight } from '../Tab/Constant'
import { Text, View } from '../Themed'
import SearchBox from './elements/SearchBox'
import Colors from '../../constants/Colors'
import ChatListItemView, { TChatListItemProps } from './elements/ChatListItem'

const { windowWidth, windowHeight } = getDimention()

type TUserItemProps = {
    source: Image['props']['source']
}
function UserItem({ source }: TUserItemProps) {
    const colorScheme = useColorScheme() || 'light'

    return (
        <TouchableOpacity
            style={uStyles.container}
        >
            <Image
                style={uStyles.img}
                source={source}
            />
            <View
                style={[
                    uStyles.btn, {
                        backgroundColor: Colors[colorScheme].secondary
                    }
                ]}
            >
                <AntDesign name="close" size={8} color="white" />
            </View>
        </TouchableOpacity>
    )
}

const uStyles = StyleSheet.create({
    container: {
        position: 'relative',
        width: 44,
        height: 44,
    },
    img: {
        width: 44,
        height: 44,
        borderRadius: 999
    },
    btn: {
        borderRadius: 999,
        position: 'absolute',
        right: 0,
        top: 0,
        zIndex: 1
    }
})
type Profile = Omit<TChatListItemProps, 'onPressChat'>

function AddNewGroupView() {
    const [profiles] = useState<Profile[]>([
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            lastMsg: 'あなたにチャットを求めています。',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            lastMsg: 'あなたにチャットを求めています。',
            newMsgCount: '+22',
        },
    ])

    return (
        <View
            style={styles.container}
        >
            <View
                style={styles.actionContainer}
            >
                <Text
                    style={styles.headerText}
                >
                    新しいグループを作成
                </Text>
            </View>
            <View
                style={styles.searchContainer}
            >
                <SearchBox inputBg='gray3' />
            </View>
            <View>
                <View
                    style={styles.addedUserList}
                >
                    <UserItem source={AppImages.userAvatar} />
                    <UserItem source={AppImages.userAvatar} />
                    <UserItem source={AppImages.userAvatar} />
                </View>
                <View
                    style={styles.scrollContainer}
                >
                    <ScrollView>
                        {
                            profiles.concat(new Array(20).fill(profiles[0])).map((item, idx) => {
                                return (
                                    <ChatListItemView
                                        key={idx}
                                        {...item}
                                        isSelectMode
                                    />
                                )
                            })
                        }
                    </ScrollView>
                </View>
            </View>
        </View>
    )
}

export default AddNewGroupView


const styles = StyleSheet.create({
    container: {
        marginTop: 12
    },
    searchContainer: {
        marginTop: 12,
        paddingHorizontal: 24,
    },
    actionContainer: {
        paddingVertical: 8,
        position: 'relative'
    },
    headerText: {
        fontSize: 20,
        lineHeight: 30,
        fontWeight: '700',
        textAlign: 'center',
    },
    tabView: {
        marginTop: 24
    },
    tabHeader: {
        flexDirection: 'row',
        justifyContent: 'space-around',
        paddingHorizontal: windowWidth / 6
    },
    tabContainer: {
        marginTop: 24,
        paddingHorizontal: 12,

        height: windowHeight - TabHeight - 180 // 24 is for select mode
    },
    tabAction: {
        flexDirection: 'row',
        justifyContent: 'flex-end',
        paddingRight: 32
    },
    addButton: {
        position: 'absolute',
        zIndex: 10,
        right: 36,
        bottom: 36,
        borderRadius: 999,
        backgroundColor: 'red',
        padding: 8
    },
    addedUserList: {
        flexDirection: 'row',
        gap: 12,
        paddingVertical: 12,
        paddingHorizontal: 40,
    },
    scrollContainer: {
        paddingHorizontal: 12,
        height: windowHeight - TabHeight - 172 // 24 is for select mode
    }
})
