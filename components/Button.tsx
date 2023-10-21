import { StyleSheet, TouchableOpacity } from 'react-native';
import Colors from '../constants/Colors';
import { Text, useThemeColor } from './Themed';


type TButtonProps = {
    bgColor: keyof typeof Colors.light & keyof typeof Colors.dark
    color: keyof typeof Colors.light & keyof typeof Colors.dark
    text: string;
    rounded?: 'full';
} & TouchableOpacity['props']

export function Button({ color, bgColor, text, rounded = 'full' }: TButtonProps) {
    const textColor = useThemeColor({}, color);
    const backColor = useThemeColor({}, bgColor);

    return (
        <TouchableOpacity style={[styles.button, { backgroundColor: backColor, borderRadius: rounded === 'full' ? 999 : 0 }]}>
            <Text style={[styles.text, { color: textColor }]}>{text}</Text>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    button: {
        paddingTop: 16,
        paddingBottom: 16,
    },
    text: {
        textAlign: 'center',
        fontSize: 15
    }
});
