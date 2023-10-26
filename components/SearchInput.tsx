import { AntDesign, EvilIcons } from '@expo/vector-icons';
import { ReactNode } from 'react';
import { StyleSheet, TextInput, TouchableOpacity, useColorScheme } from 'react-native';
import Colors from '../constants/Colors';
import { View, Text } from "./Themed";

type Props = {
    onPressSearch?: () => void;
    onPressClose?: () => void;
} & TextInput['props'];

export function SearchInput(props: Props) {
    const { onPressClose, ...otherProps } = props;
    const colorScheme = useColorScheme();

    return (
        <View style={[styles.inputgroup, { backgroundColor: Colors[colorScheme ?? 'light'].gray1 }]}>
            <EvilIcons name="search" size={32} color="black" />
            <TextInput
                style={[
                    styles.textInput,
                ]}
                editable
                placeholderTextColor='#fff'
                {...otherProps}
            />
            <TouchableOpacity
                onPress={onPressClose}
            >
                <AntDesign name="closecircle" size={20} color="white" />
            </TouchableOpacity>
        </View>
    )
}

const styles = StyleSheet.create({
    inputgroup: {
        flexDirection: 'row',
        flexWrap: 'wrap',
        alignItems: 'center',
        paddingTop: 8,
        paddingBottom: 8,
        borderRadius: 8,
        paddingRight: 12,
        paddingLeft: 12,
    },
    textInput: {
        flex: 1,
        fontSize: 18,
        borderLeftColor: '#fff',
        marginLeft: 8,
        paddingLeft: 8,
        borderLeftWidth: 2,
        color: '#fff'
    }
});
