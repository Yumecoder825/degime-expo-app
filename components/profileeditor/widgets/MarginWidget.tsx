import { Entypo } from '@expo/vector-icons'
import React, { useState } from 'react'
import { StyleSheet, TouchableOpacity, TextInput } from 'react-native'
import { getDimention } from '../../../utils/dimentions'
import { Text, View } from '../../Themed'
import { ActionButtons } from '../elements/ActionButtons'

const { windowWidth } = getDimention()

function MarginWidget() {
    const [value, setValue] = useState('1');

    const handleOnChangeText = (text: string) => {
        if (isNaN(+text)) {
            return;
        }
        if (+text < 20) {
            if (+text < 0) {
                return setValue('0')
            }
            setValue(text)
        } else {
            setValue('20')
        }
    }

    const handleOnPressBtn = (_value: string) => {
        handleOnChangeText(_value)
    }

    return (
        <View
            style={styles.container}
        >
            <Text
                style={styles.title}
            >
                余白サイズを選んでください
            </Text>
            <View
                style={styles.inputContainer}
            >
                <TextInput
                    style={styles.marginInput}
                    keyboardType='numeric'
                    maxLength={2}
                    value={value}
                    onChangeText={handleOnChangeText}
                />
                <Text
                    style={styles.uintText}
                >
                    mm幅
                </Text>
                <View
                    style={styles.control}
                >
                    <TouchableOpacity
                        onPress={() => handleOnPressBtn(String(+value + 1))}
                    >
                        <Entypo name="triangle-up" size={16} color="black" />
                    </TouchableOpacity>
                    <TouchableOpacity
                        onPress={() => handleOnPressBtn(String(+value - 1))}
                    >
                        <Entypo name="triangle-down" size={16} color="black" />
                    </TouchableOpacity>
                </View>
            </View>
            <View
                style={styles.actionBtns}
            >
                <ActionButtons
                    hideReservation
                />
            </View>
        </View>
    )
}

export default MarginWidget

const styles = StyleSheet.create({
    container: {
        width: windowWidth - 50
    },
    title: {
        fontSize: 14,
        fontWeight: '400',
        paddingHorizontal: 8,
        paddingVertical: 8,
        borderWidth: 1,
        borderColor: '#0008',
    },
    inputContainer: {
        position: 'relative',
        marginTop: 8,
        borderWidth: 1,
        borderColor: '#0008',
        flexDirection: 'row',
        alignItems: 'center',
    },
    marginInput: {
        paddingHorizontal: 8,
        paddingVertical: 4,
    },
    uintText: {
        position: 'absolute',
        fontSize: 14,
        fontWeight: '400',
        left: 26,
    },
    control: {
        position: 'absolute',
        right: 4
    },
    actionBtns: {
        marginTop: 12
    }
})