import React from 'react'
import { StyleSheet, TouchableOpacity, useColorScheme } from 'react-native'
import Colors from '../../constants/Colors'
import { AppModal } from '../Modal'
import { Text, View } from '../Themed'

type TConfirmModalProps = {
    showConfirmModal: boolean;
    msg: string;
    handleOnRequestClose: () => void;
    onPressConfirm?: TouchableOpacity['props']['onPress'];
    onPressCancel?: TouchableOpacity['props']['onPress'];
}

function ConfirmModal({ msg, showConfirmModal, handleOnRequestClose, onPressCancel, onPressConfirm }: TConfirmModalProps) {
    const colorScheme = useColorScheme() || 'light'


    return (
        <AppModal
            isVisible={showConfirmModal}
            onRequestClose={handleOnRequestClose}
            borderColor='#000'
        >
            <View
                style={mStyles.container}
            >
                <Text
                    style={[
                        mStyles.headerText, {
                            color: Colors[colorScheme].gray5
                        }
                    ]}
                >{msg}</Text>
                <View
                    style={mStyles.actionSection}
                >
                    <TouchableOpacity
                        style={[
                            mStyles.button, {
                                borderColor: '#0008'
                            }
                        ]}
                        onPress={onPressConfirm}
                    >
                        <Text
                            style={mStyles.buttonText}
                        >はい</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={[
                            mStyles.button, {
                                backgroundColor: Colors[colorScheme].orange1,
                                borderColor: Colors[colorScheme].orange1,
                            }
                        ]}
                        onPress={onPressCancel}
                    >
                        <Text
                            style={[
                                mStyles.buttonText
                            ]}
                        >いいえ</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </AppModal>
    )
}

export default ConfirmModal



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