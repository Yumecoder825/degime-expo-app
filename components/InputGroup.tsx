import { ReactNode } from 'react';
import { StyleSheet, TextInput, TouchableOpacity } from 'react-native';
import { View, Text } from "./Themed";

type AddtionalProps = {
    leftIcon?: ReactNode;
    rightIcon?: ReactNode;
    title: string;
    placeholder?: string;
    onPressRightIcon?: () => void;
}

type TInputGroupProps = AddtionalProps & TextInput['props'];
export function InputGroup(props: TInputGroupProps) {
    const { title, leftIcon, placeholder, rightIcon, onPressRightIcon, ...otherProps } = props;

    return (
        <View style={styles.container}>
            <Text>{title}</Text>
            <View style={styles.inputgroup}>
                {leftIcon && leftIcon}
                <TextInput
                    style={[
                        styles.textInput,
                        {
                            paddingLeft: leftIcon ? 5 : 0,
                            paddingRight: rightIcon ? 5 : 5,
                        }
                    ]}
                    editable
                    placeholder={placeholder}
                    {...otherProps}
                />
                {rightIcon && (
                    <TouchableOpacity onPress={onPressRightIcon}>
                        {rightIcon}
                    </TouchableOpacity>
                )}
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
    },
    inputgroup: {
        flexDirection: 'row',
        flexWrap: 'wrap',
        alignItems: 'center'
    },
    icon: {
        width: 20,
        height: 20,
        zIndex: 1,
    },
    textInput: {
        flex: 1,
        fontSize: 20,
    }
});
