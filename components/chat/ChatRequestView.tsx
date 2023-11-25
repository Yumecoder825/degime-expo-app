import { Ionicons } from '@expo/vector-icons'
import React, { useState } from 'react'
import { ScrollView, StyleSheet, TouchableOpacity, useColorScheme } from 'react-native'
import Colors from '../../constants/Colors'
import AppImages from '../../constants/Images'
import { AppModal } from '../Modal'
import ConfirmModal from '../modals/ConfirmModal'
import { TabHeight } from '../Tab/Constant'
import { Text, View } from '../Themed'
import SearchBox from './elements/SearchBox'
import UserListItemView, { TUserListItemViewProps } from './elements/UserListItem'


type Profile = Omit<TUserListItemViewProps, 'onPressChat'>

function ChatRequestView() {
    const colorScheme = useColorScheme() || 'light'

    const [showConfirmModal, setShowConfirmModal] = useState(false);

    const [profiles] = useState<Profile[]>([
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date: '2022/11/20',
            phone: '(270) 555-0117',
        },
    ])

    const handleOnPressBack = () => {
    }

    const handleOnPressChat = () => {
        setShowConfirmModal(true)
    }

    const handleOnRequestClose = () => {
        setShowConfirmModal(false)
    }

    const handleOnPressCancel = () => {
        setShowConfirmModal(false)
    }


    return (
        <View
            style={styles.container}
        >
            <View
                style={styles.actionContainer}
            >
                <TouchableOpacity
                    onPress={handleOnPressBack}
                    style={styles.headerBtn}
                >
                    <Ionicons name="md-return-down-back-sharp" size={24} color={Colors[colorScheme].secondary} />
                </TouchableOpacity>
                <Text
                    style={styles.headerText}
                >
                    チャットを追加
                </Text>
            </View>
            <View
                style={styles.searchContainer}
            >
                <SearchBox />
            </View>
            <View
                style={styles.scrollContainer}
            >
                <ScrollView
                    style={styles.scrollView}
                >
                    {
                        profiles.map((p, idx) => {
                            return (
                                <UserListItemView key={idx} phone={p.phone} date={p.date} title={p.title} source={p.source}
                                    onPressChat={handleOnPressChat}
                                />
                            )
                        })
                    }
                </ScrollView>
            </View>
            <ConfirmModal 
                showConfirmModal={showConfirmModal}
                msg='本当にこの人にチャットを申し込みますか？'
                handleOnRequestClose={handleOnRequestClose}
                onPressCancel={handleOnPressCancel}
            />
        </View>
    )
}

export default ChatRequestView

const styles = StyleSheet.create({
    container: {
        marginTop: 8
    },
    headerText: {
        textAlign: 'center',
        fontWeight: '700',
        fontSize: 22,
    },
    headerBtn: {
        position: 'absolute',
        top: 12,
        left: 8,
        zIndex: 1,
    },
    actionContainer: {
        paddingVertical: 8,
        position: 'relative'
    },
    searchContainer: {
        marginTop: 12,
        paddingHorizontal: 24,
    },
    scrollContainer: {
        paddingBottom: TabHeight + 128
    },
    scrollView: {
        marginTop: 40,
        paddingHorizontal: 8,
    }
})

const mStyles = StyleSheet.create({
    container: {
        paddingVertical: 12,
        paddingHorizontal: 8,
    },
    headerText: {
        fontSize: 20,
        lineHeight: 30,
        fontWeight: '700',
        textAlign: 'center',
    },
    actionSection: {
        marginTop: 20,
        flexDirection: 'row',
        justifyContent: 'space-between',
        gap: 20,
    },
    button: {
        flex: 1,
        paddingVertical: 4,
        borderRadius: 4,
        borderWidth: 1,
    },
    buttonText: {
        textAlign: 'center'
    }
})
