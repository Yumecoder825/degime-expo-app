import { useState } from "react"
import { StyleSheet, TouchableOpacity } from "react-native"
import { Entypo } from '@expo/vector-icons';
import { Image } from "expo-image";
import BouncyCheckbox from "react-native-bouncy-checkbox";
import { Text, View } from "../../Themed"
import { ActionButtons } from "../elements/ActionButtons"
import AppImages from "../../../constants/Images";

type TSliderWidgetProps = {

}

export function SliderWidget({ }: TSliderWidgetProps) {
    const [images] = useState<[string, string, string]>([
        AppImages.sliderImg, AppImages.sliderImg, AppImages.sliderImg,
    ])

    const handleOnPressCenterImage = () => {

    }

    return (
        <View
            style={styles.container}
        >
            <View
                style={styles.sliderContainer}
            >
                <TouchableOpacity
                    style={styles.actionBtn}
                >
                    <Entypo name="chevron-thin-left" size={32} color="black" />
                </TouchableOpacity>
                <View
                    style={styles.imgContainer}
                >
                    <TouchableOpacity>
                        <Image
                            source={images[0]}
                            style={styles.previewImg}
                        />
                    </TouchableOpacity>

                    <TouchableOpacity
                        onPress={handleOnPressCenterImage}
                    >
                        <Image
                            source={images[1]}
                            style={styles.mainImg}
                        />
                    </TouchableOpacity>
                    <TouchableOpacity>
                        <Image
                            source={images[2]}
                            style={styles.previewImg}
                        />
                    </TouchableOpacity>

                </View>
                <TouchableOpacity
                    style={styles.actionBtn}
                >
                    <Entypo name="chevron-thin-right" size={32} color="black" />
                </TouchableOpacity>
            </View>
            <View
                style={styles.actionContainer}
            >
                <View
                    style={styles.checkboxContainer}
                >
                    <BouncyCheckbox
                        iconStyle={styles.checkboxIcon}
                        innerIconStyle={styles.checkboxInnerIcon}
                        // disableText
                        textComponent={
                            <Text
                                style={styles.checkboxText}
                            >
                                ダウンロードを許可する
                            </Text>
                        }
                    />
                </View>
                <ActionButtons />
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
        paddingVertical: 12
    },
    sliderContainer: {
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        gap: 8,
    },
    actionBtn: {

    },
    actionContainer: {
        marginTop: 20,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
    },
    imgContainer: {
        flexDirection: 'row',
        alignItems: 'flex-end',
        gap: 8,
    },
    mainImg: {
        width: 120,
        height: 95,
    },
    previewImg: {
        width: 65,
        height: 38,
    },
    checkboxContainer: {
    },
    checkboxInnerIcon: {
        borderRadius: 2,
        width: 12,
        height: 12
    },
    checkboxIcon: {
        borderRadius: 2,
        width: 12,
        height: 12,
    },
    checkboxText: {
        marginLeft: 4,
        fontSize: 10,
        fontWeight: '400',
    }
})