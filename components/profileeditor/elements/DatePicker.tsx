import { useMemo } from "react";
import { StyleSheet, TouchableOpacity } from "react-native";
import { Fontisto } from '@expo/vector-icons';
import { Text, View } from "../../Themed";

type TDatePickerProps = {
    date: Date
    onPressPicker?: TouchableOpacity['props']['onPress']
}
function DatePicker({ onPressPicker, date }: TDatePickerProps) {
    const [year, month, day] = useMemo(() => {
        return [date.getFullYear(), date.getMonth() + 1, date.getDate()]
    }, [date])

    return (
        <View
            style={styles.container}
        >
            <Text
                style={styles.text}
            >{year}/{month}/{day}</Text>
            <TouchableOpacity
                style={styles.btn}
                onPress={onPressPicker}
            >
                <Fontisto name="date" size={16} color="black" />
            </TouchableOpacity>
        </View>
    )
}

export default DatePicker;

const styles = StyleSheet.create({
    container: {
        position: 'relative',
    },
    text: {
        fontSize: 10,
        fontWeight: '400',
        borderWidth: 1,
        borderColor: '#0008',
        paddingVertical: 4,
        paddingHorizontal: 4,
    },
    btn: {
        position: 'absolute',
        right: 4,
        top: 2
    }
})