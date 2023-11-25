import { useState, useMemo } from "react";
import { StyleSheet, TouchableOpacity, useColorScheme } from "react-native";
import { AntDesign, Fontisto } from '@expo/vector-icons';
import DateTimePicker, { DateTimePickerAndroid, DateTimePickerEvent } from '@react-native-community/datetimepicker';

import { Text, View } from "../../Themed";
import { getDimention } from "../../../utils/dimentions";
import DatePicker from "../elements/DatePicker";
import TimePicker from "../elements/TimePicker";
import Colors from "../../../constants/Colors";

const { windowWidth } = getDimention()

enum PickerFlag {
    publicDate,
    endDate
}
type TScheduleWidgetProps = {
    onPressClose?: TouchableOpacity['props']['onPress'];
}
function ScheduleWidget({ onPressClose }: TScheduleWidgetProps) {
    const colorScheme = useColorScheme() || 'light';

    const [publicDate, setPublicDate] = useState(new Date());
    const [endDate, setEndDate] = useState(new Date());

    const onChangePublicDate = (event: DateTimePickerEvent, selectedDate: Date | undefined) => {
        const currentDate = selectedDate;
        currentDate && setPublicDate(currentDate);
    };
    const onChangeEndDate = (event: DateTimePickerEvent, selectedDate: Date | undefined) => {
        const currentDate = selectedDate;
        currentDate && setEndDate(currentDate);
    };

    const showMode = (currentMode: 'date' | 'time', _currentDate: Date, _flag: PickerFlag) => {
        const onChange = _flag === PickerFlag.publicDate ? onChangePublicDate : onChangeEndDate

        DateTimePickerAndroid.open({
            value: _currentDate,
            onChange,
            mode: currentMode,
            is24Hour: false,
        });
    };

    return (
        <View
            style={styles.container}
        >
            <View
                style={styles.header}
            >
                <Text
                    style={styles.headerText}
                >
                    予約設定
                </Text>
                <TouchableOpacity
                    onPress={onPressClose}
                >
                    <AntDesign name="close" size={18} color="black" />
                </TouchableOpacity>
            </View>
            <View
                style={styles.mainSection}
            >
                <View
                    style={styles.body}
                >
                    <Text
                        style={styles.subTitle}
                    >公開日時</Text>
                    <View
                        style={styles.timeSection}
                    >
                        <View
                            style={styles.timeSectionItem}
                        >
                            <DatePicker date={publicDate} onPressPicker={() => showMode('date', publicDate, PickerFlag.publicDate)} />
                        </View>
                        <View
                            style={styles.timeSectionItem}
                        >
                            <TimePicker date={publicDate} onPressPicker={() => showMode('time', publicDate, PickerFlag.publicDate)} />
                        </View>
                    </View>
                </View>
                <View
                    style={styles.body}
                >
                    <Text
                        style={styles.subTitle}
                    >終了日時</Text>
                    <View
                        style={styles.timeSection}
                    >
                        <View
                            style={styles.timeSectionItem}
                        >
                            <DatePicker date={endDate} onPressPicker={() => showMode('date', endDate, PickerFlag.endDate)} />
                        </View>
                        <View
                            style={styles.timeSectionItem}
                        >
                            <TimePicker date={endDate} onPressPicker={() => showMode('time', endDate, PickerFlag.endDate)} />
                        </View>
                    </View>
                </View>

                <View
                    style={styles.actionGroup}
                >
                    <TouchableOpacity
                        style={[
                            styles.actionBtn, {
                                backgroundColor: Colors[colorScheme].red1
                            }
                        ]}
                    >
                        <Text
                            style={styles.actionBtnText}
                        >
                            予約設定
                        </Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={[
                            styles.actionBtn, {
                                backgroundColor: Colors[colorScheme].blue4
                            }
                        ]}
                    >
                        <Text
                            style={styles.actionBtnText}
                        >
                            予約設定
                        </Text>
                    </TouchableOpacity>
                </View>
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
        width: windowWidth - 60
    },
    header: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        borderBottomColor: '#0008',
        borderBottomWidth: 1,
        paddingBottom: 8,
        marginBottom: 12,
    },
    headerText: {
        fontSize: 18,
        fontWeight: '400'
    },
    body: {
        marginVertical: 8,
        marginHorizontal: 8,
    },
    subTitle: {
        fontSize: 13,
        fontWeight: '400',
    },
    mainSection: {
        paddingHorizontal: 8
    },
    timeSection: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        gap: 24,
        marginLeft: 12,
        marginVertical: 4
    },
    timeSectionItem: {
        maxWidth: 100,
        flex: 1
    },
    actionGroup: {
        marginTop: 12,
        flexDirection: 'row',
        justifyContent: 'space-between',
        gap: 48,
    },
    actionBtn: {
        flex: 1,
        paddingVertical: 4,
        borderRadius: 8
    },
    actionBtnText: {
        textAlign: 'center',
        fontSize: 13,
        color: '#fff',
        lineHeight: 24
    }
})

export default ScheduleWidget;
