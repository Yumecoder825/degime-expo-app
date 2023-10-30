import React, { useState } from 'react'
import { ScrollView, StyleSheet, TouchableOpacity, useColorScheme } from 'react-native'
import Colors from '../../constants/Colors'
import AppImages from '../../constants/Images'
import { getDimention } from '../../utils/dimentions'
import ConfirmModal from '../modals/ConfirmModal'
import { TabHeight } from '../Tab/Constant'
import { Text, View } from '../Themed'
import ChatListItemView, { TChatListItemProps } from './elements/ChatListItem'
import SearchBox from './elements/SearchBox'

const { windowWidth, windowHeight } = getDimention()

type TTabItemProps = TouchableOpacity['props'] & {
    active: boolean;
    text: string;
    badgeText: string;
}
function TabItem({ active, badgeText, ...props }: TTabItemProps) {
    const colorScheme = useColorScheme() || 'light'

    return (
        <TouchableOpacity
            style={[
                tStyles.tabHeaderBtn,
                active && {
                    borderBottomColor: Colors[colorScheme].purple1
                }
            ]}
            {...props}
        >
            <Text
                style={[
                    tStyles.text,
                    active && {
                        color: Colors[colorScheme].purple1
                    }
                ]}
            >
                申請者
            </Text>
            {badgeText && (
                <Text
                    style={[
                        tStyles.tabBadge, {
                            backgroundColor: Colors[colorScheme].purple1
                        }
                    ]}
                >
                    3
                </Text>
            )}
        </TouchableOpacity>
    )
}

const tStyles = StyleSheet.create({
    tabHeaderBtn: {
        paddingVertical: 8,
        paddingHorizontal: 22,
        position: 'relative',
        borderBottomWidth: 1,
        borderBottomColor: 'transparent',
    },
    text: {
        fontSize: 16,
        fontWeight: '400'
    },
    tabBadge: {
        position: 'absolute',
        width: 18,
        height: 18,
        right: 2,
        bottom: 1,
        padding: 2,
        borderRadius: 999,
        fontSize: 11,
        fontWeight: '300',
        textAlign: 'center',
        color: '#fff',
    }
})

type Profile = Omit<TChatListItemProps, 'onPressChat'>

function ChatListView() {
    const [tab, setTab] = useState(0);
    const [showConfirmModal, setShowConfirmModal] = useState(false);


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

    const handleOnPressTab = () => {
        setTab(p => {
            if (p === 0) {
                return 1;
            }
            return 0;
        })
    }

    const handleOnRequestClose = () => {
        setShowConfirmModal(false)
    }
    const handleOnPressCancel = () => {
        setShowConfirmModal(false)
    }

    const handleOnPressChatItem = () => {
        setShowConfirmModal(true)
    }

    return (
        <View>
            <View
                style={styles.actionContainer}
            >
                <Text
                    style={styles.headerText}
                >
                    チャットを追加
                </Text>
            </View>
            <View
                style={styles.searchContainer}
            >
                <SearchBox inputBg='gray6' />
            </View>
            <View
                style={styles.tabView}
            >
                <View
                    style={styles.tabHeader}
                >
                    <View>
                        <TabItem active={tab === 0} badgeText='3' text='申請者'
                            onPress={handleOnPressTab}
                        />
                    </View>
                    <View>
                        <TabItem active={tab === 1} badgeText='' text='承認者'
                            onPress={handleOnPressTab}
                        />
                    </View>
                </View>
                <View
                    style={styles.tabContainer}
                >
                    <ScrollView>
                        {
                            profiles.concat(new Array(20).fill(profiles[0])).map((item, idx) => (
                                <ChatListItemView
                                    key={idx}
                                    onPress={handleOnPressChatItem}
                                    {...item}
                                />
                            ))
                        }
                    </ScrollView>
                </View>
            </View>
            <ConfirmModal
                showConfirmModal={showConfirmModal}
                msg='本当にこのユーザーをチャットに承認しますか？'
                handleOnRequestClose={handleOnRequestClose}
                onPressCancel={handleOnPressCancel}
            />
        </View>
    )
}

export default ChatListView

const styles = StyleSheet.create({
    container: {

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

        height: windowHeight - TabHeight - 180
    }
})