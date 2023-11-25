import React from 'react'
import { StyleSheet, TextInput, TouchableOpacity, useColorScheme } from 'react-native'
import { Fontisto } from '@expo/vector-icons';
import Colors from '../../../constants/Colors';
import { ThemeColorName, View } from '../../Themed'

type TSearchBoxProps = {
    inputBg?: ThemeColorName
}

function SearchBox({ inputBg }: TSearchBoxProps) {
    const colorScheme = useColorScheme() || 'light'

    return (
        <View
            style={styles.container}
        >
            <TextInput
                style={[
                    styles.textInput, {
                        backgroundColor: inputBg ? Colors[colorScheme][inputBg] : Colors[colorScheme].gray3
                    }
                ]}
            />
            <TouchableOpacity
                style={[
                    styles.searchBtn, {
                        backgroundColor: Colors[colorScheme].gray4
                    }
                ]}
            >
                <Fontisto name="zoom" size={20} color="#fff" />
            </TouchableOpacity>
        </View>
    )
}

export default SearchBox

const styles = StyleSheet.create({
    container: {
        position: 'relative'
    },
    textInput: {
        borderRadius: 8,
        fontSize: 16,
        color: '#fff',
        paddingLeft: 8,
        paddingRight: 40,
        paddingVertical: 4,
    },
    searchBtn: {
        position: 'absolute',
        paddingVertical: 8,
        paddingHorizontal: 8,
        borderRadius: 8,
        top: 0,
        right: 0,
        zIndex: 1,
    }
})
