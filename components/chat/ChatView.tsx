import React, { useEffect, useState } from 'react'
import { Keyboard, KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TouchableWithoutFeedback } from 'react-native'
import AppImages from '../../constants/Images'
import { useHomeContext } from '../../Context/HomeContext'
import { getDimention } from '../../utils/dimentions'
import { TabHeight } from '../Tab/Constant'
import { View } from '../Themed'
import ChatSendForm from './elements/ChatSendForm'
import MessageView, { TMessageViewProps } from './elements/MessageView'

const { windowHeight } = getDimention()

function ChatView() {
    const { setShowMenu } = useHomeContext()

    const [messages] = useState<TMessageViewProps[]>([{
        text: '今日はビーチに行きます。'
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '午前10時',
        senderAvatar: AppImages.userAvatar
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '素晴らしい！',
        byMe: true,
    }, {
        text: '一緒に行きませんか？'
    }, {
        text: '素晴らしい！',
        byMe: true,
    },])

    useEffect(() => {
        setShowMenu(false);

        return () => {
            setShowMenu(true);
        }
    }, [])

    return (
        <View
            style={styles.container}
        >
            <KeyboardAvoidingView
                behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
            >
                <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
                    <View
                        style={styles.chatList}
                    >
                        <ScrollView>
                            {
                                messages.map((msg, idx) => {
                                    return (
                                        <MessageView
                                            key={idx}
                                            {...msg}
                                        />
                                    )
                                })
                            }
                        </ScrollView>
                    </View>
                </TouchableWithoutFeedback>
                <ChatSendForm />
            </KeyboardAvoidingView>
        </View>
    )
}

export default ChatView

const styles = StyleSheet.create({
    container: {
        padding: 8
    },
    chatList: {
        flexDirection: 'column',
        gap: 16,
        maxHeight: windowHeight - 68 //TabHeight
    }
})
