import React from 'react'
import { ScrollView, StyleSheet, TextInput, TouchableOpacity, useColorScheme } from 'react-native'
import { FontAwesome, Ionicons } from '@expo/vector-icons'
import Colors from '../../../constants/Colors'
import { View } from '../../Themed'


type TChatSendFormProps = TextInput['props'] & {
    onPressSend?: TouchableOpacity['props']['onPress'];
    onPressCamera?: TouchableOpacity['props']['onPress'];
}

function ChatSendForm({ onPressSend, onPressCamera, ...props }: TChatSendFormProps) {
    const colorScheme = useColorScheme() || 'light';

    return (
        <View
            style={styles.widget}
        >
            <ScrollView>
                <View
                    style={styles.container}
                >
                    <View
                        style={styles.inputGroup}
                    >
                        <TextInput
                            style={[
                                styles.input,
                            ]}
                            multiline
                            {...props}
                        />
                    </View>
                    <View
                        style={styles.actionGroup}
                    >
                        <TouchableOpacity
                            style={[
                                styles.button, {
                                    backgroundColor: Colors[colorScheme].green3
                                }
                            ]}
                            onPress={onPressCamera}
                        >
                            <FontAwesome name="camera" size={24} color="white" />
                        </TouchableOpacity>
                        <TouchableOpacity
                            style={[
                                styles.button, {
                                    backgroundColor: Colors[colorScheme].purple2
                                }
                            ]}
                            onPress={onPressSend}
                        >
                            <Ionicons name="chatbubble-sharp" size={24} color="white" />
                        </TouchableOpacity>
                    </View>
                </View>
            </ScrollView>
        </View>
    )
}

export default ChatSendForm

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row'
    },
    widget: {
        maxHeight: 100,
        paddingVertical: 8
    },
    button: {
        borderRadius: 8,
        padding: 8,
        width: 40,
        height: 40,
    },
    input: {
        backgroundColor: '#0004',
        fontSize: 14,
        fontWeight: '400',
        borderRadius: 8,
        paddingHorizontal: 8,
        paddingVertical: 6,
    },
    inputGroup: {
        flex: 1,
        position: 'relative',
        // backgroundColor: 'red',
    },
    actionGroup: {
        width: 100,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'flex-start',
        gap: 8,
    },
    inputButton: {
        position: 'absolute',
        zIndex: 1,
        right: 0,
        top: 0,
    }
})