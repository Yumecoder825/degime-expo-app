import { TextInput, StyleSheet, TouchableOpacity } from "react-native";
import { AntDesign } from '@expo/vector-icons';
import { Image } from "expo-image";
import { View } from "../../Themed";
import { ProfileInput } from "./Input";
import AppImages from "../../../constants/Images";

type TImageWidgetItemProps = {
    img: Image['props']['source'] | null;
    onPressClose?: TouchableOpacity['props']['onPress'];
}

export function ImageWidgetItem({ img, onPressClose }: TImageWidgetItemProps) {
    return (
        <View
            style={styles.item}
        >
            <TouchableOpacity
                style={styles.closeBtn}
                onPress={onPressClose}
            >
                <AntDesign name="closecircleo" size={16} color="black" />
            </TouchableOpacity>
            <View
                style={styles.imgSection}
            >
                <View
                    style={styles.imgContainer}
                >
                    <Image
                        style={styles.placeholdeImg}
                        source={img || AppImages.imagePlaceHolder}
                    />
                </View>
                <TextInput
                    style={[styles.input, styles.title]}
                    placeholder='タイトル '
                />
            </View>
            <ProfileInput
                placeholder='テキスト'
            />
            <ProfileInput
                placeholder='URL'
            />
        </View>
    )
}


const styles = StyleSheet.create({
    item: {
        padding: 4,
        flexDirection: 'column',
        gap: 2,
        position: 'relative',
    },
    imgSection: {
        width: 150,
        height: 95,
        flexDirection: 'column',
        borderRadius: 8,
        borderWidth: 1,
        borderColor: '#00000088'
    },
    imgContainer: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
    },
    placeholdeImg: {
        width: 20,
        height: 20,
    },
    input: {
        // backgroundColor: '#ff0000',
        fontSize: 12,
        paddingHorizontal: 4,
    },
    title: {
        borderTopWidth: 1,
        borderTopColor: '#00000088'
    },
    closeBtn: {
        position: 'absolute',
        right: 0,
        top: 0,
        zIndex: 1,
        backgroundColor: '#fff'
    }
})