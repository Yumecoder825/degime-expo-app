import { useMemo } from "react";
import { StyleSheet, TouchableOpacity } from "react-native";
import { Text, View } from "../../Themed";

type TDatePickerProps = {
    date: Date
    onPressPicker?: TouchableOpacity['props']['onPress']
}

const withZeroNumber = (n: number): string => {
    return String(+n < 10 ? `0${n}` : n)
}

function TimePicker({ onPressPicker, date }: TDatePickerProps) {
    const [hours, minutes, meridian] = useMemo(() => {
        const hours = date.getHours();
        const meridian = hours >= 12 ? "PM" : "AM";

        const hrs = hours > 12 ? hours - 12 : hours;

        return [hrs, date.getMinutes(), meridian]
    }, [date])

    return (
        <TouchableOpacity
            style={styles.container}
            onPress={onPressPicker}
        >
            <Text
                style={styles.text}
            >{withZeroNumber(hours)}:{withZeroNumber(minutes)}</Text>
            <View
                style={styles.btn}
            >
                <Text
                    style={styles.meridian}
                >{meridian}</Text>
            </View>
        </TouchableOpacity>
    )
}

export default TimePicker;

const styles = StyleSheet.create({
    container: {
        position: 'relative',
    },
    text: {
        fontSize: 10,
        textAlign: 'center',
        fontWeight: '400',
        borderWidth: 1,
        borderColor: '#0008',
        paddingVertical: 4,
        paddingHorizontal: 4,
    },
    btn: {
        position: 'absolute',
        right: 4,
        top: 1,
        borderLeftWidth: 1,
        paddingTop: 3,
        paddingBottom: 3,
        paddingLeft: 4,
        borderLeftColor: '#0008',
    },
    meridian: {
        fontSize: 12,
        fontWeight: '400',
    }
});
