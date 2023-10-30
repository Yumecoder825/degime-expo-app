import React, { useEffect, useState } from 'react'
import { Keyboard, KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TouchableWithoutFeedback } from 'react-native'
import AppImages from '../../constants/Images'
import { useHomeContext } from '../../Context/HomeContext'
import { getDimention } from '../../utils/dimentions'
import { View } from '../Themed'
import ChatSendForm from './elements/ChatSendForm'
import MessageView, { TMessageViewProps } from './elements/MessageView'

const { windowHeight } = getDimention()

function ChatView() {
    const { setShowMenu } = useHomeContext()
    const [isVisible, setIsVisible] = useState(false)

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

    const onFocus = () => {
        setIsVisible(true)
    }
    const onBlur = () => {
        setIsVisible(false)
    }

    useEffect(() => {
        setShowMenu(false);

        return () => {
            setShowMenu(true);
        }
    }, [])

    return (
        <KeyboardAvoidingView
            behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
            style={styles.container}>
            <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
                <View style={[
                    styles.inner, {
                        marginBottom: isVisible ? 50 : 0
                    }
                ]}>
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
                    <ChatSendForm onFocus={onFocus} onBlur={onBlur} />
                </View>
            </TouchableWithoutFeedback>
        </KeyboardAvoidingView>
    )
}

export default ChatView

const styles = StyleSheet.create({
    container: {
        flex: 1,
        // backgroundColor: 'red'
    },
    inner: {
        padding: 24,
        flex: 1,
        justifyContent: 'space-around',
    },
    header: {
        fontSize: 36,
        marginBottom: 48,
    },
    textInput: {
        height: 40,
        borderColor: '#000000',
        borderBottomWidth: 1,
        marginBottom: 36,
    },
    btnContainer: {
        backgroundColor: 'white',
        marginTop: 12,
    },
    chatList: {
        flexDirection: 'column',
        gap: 16,
        marginBottom: 40
    }
});