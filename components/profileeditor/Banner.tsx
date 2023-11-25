import { Image } from "expo-image";
import { StyleSheet, useColorScheme } from "react-native";
import { TouchableOpacity } from "react-native-gesture-handler";
import Colors from "../../constants/Colors";
import AppImages from "../../constants/Images";
import { getDimention } from "../../utils/dimentions";
import { Text, View } from "../Themed";

const { windowWidth } = getDimention()

export function ProfileBanner() {
    const colorTheme = useColorScheme()

    return (
        <View style={[styles.banner, { borderColor: Colors[colorTheme ?? 'light'].blue1 }]}>
            <View style={styles.bannerContainer}>
                <TouchableOpacity>
                    <View style={styles.bannerAvatar}>
                        <Text style={styles.bannerAvatarText}>
                            A
                        </Text>
                    </View>
                </TouchableOpacity>
            </View>
            <View style={styles.bannerDivider}></View>
            <View style={styles.bannerImageContainer}>
                <Image style={styles.bannerImage} source={AppImages.pageBannerImg} />
            </View>
        </View>

    )
}


const styles = StyleSheet.create({
    bannerContainer: {
        padding: 2,
        borderWidth: 1,
        borderRadius: 999,
        borderColor: '#000',
    },
    banner: {
        padding: 4,
        borderRadius: 8,
        borderWidth: 3,
        flexDirection: 'row',
        alignItems: 'center',
        gap: 16
    },
    bannerAvatar: {
        borderRadius: 999,
        padding: 4,
        justifyContent: 'center',
        alignItems: 'center',
        width: 36,
        backgroundColor: '#000',
        height: 36,
    },
    bannerAvatarText: {
        color: '#fff',
        fontSize: 18,
        fontWeight: 'bold'
    },
    bannerDivider: {
        width: 1,
        height: 130,
        backgroundColor: '#000',
        marginTop: 40,
        marginBottom: 40,
    },
    bannerImageContainer: {
        padding: 4,
        // borderWidth: 1,
        // borderColor: '#000'
    },
    bannerImage: {
        width: windowWidth - 150,
        height: 150,
        resizeMode: 'contain'
    }
});
