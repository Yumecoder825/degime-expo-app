import { SafeAreaView, StyleSheet, TouchableOpacity, useColorScheme, Button } from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { router } from "expo-router";
import { Text, View } from "../../components/Themed";
import Colors from "../../constants/Colors";
import { Image } from "expo-image";
import { getDimention } from "../../utils/dimentions";
import { ProfileBanner } from "../../components/profileeditor/Banner";

const { windowWidth } = getDimention()

export default function ProfileEditorScreen() {
    const colorTheme = useColorScheme()

    const handleOnPressBack = () => {
        router.replace('/profile')
    }

    return (
        <SafeAreaView>
            <View style={styles.container}>
                <View style={styles.actionContainer}>
                    <TouchableOpacity
                        onPress={handleOnPressBack}
                    >
                        <Ionicons name="md-return-down-back-sharp" size={24} color="black" />
                    </TouchableOpacity>
                    <View style={styles.actionGroup}>

                        <TouchableOpacity
                            style={[styles.actionBtn, { backgroundColor: Colors[colorTheme ?? 'light'].orange1 }]}
                        >
                            <Text style={styles.actionBtnText}>
                                変更
                            </Text>
                        </TouchableOpacity>
                        <TouchableOpacity
                            style={[styles.actionBtn, { backgroundColor: Colors[colorTheme ?? 'light'].blue2 }]}
                        >
                            <Text style={styles.actionBtnText}>
                                公共
                            </Text>
                        </TouchableOpacity>
                        <TouchableOpacity
                            style={[styles.actionBtn, { backgroundColor: Colors[colorTheme ?? 'light'].orange1 }]}
                        >
                            <Text style={styles.actionBtnText}>
                                プライベート
                            </Text>
                        </TouchableOpacity>
                    </View>
                </View>
                <View style={styles.editorContainer}>
                    <ProfileBanner />
                </View>
            </View>
        </SafeAreaView>
    )
}

const styles = StyleSheet.create({
    container: {
        paddingTop: 40,
        paddingLeft: 20,
        paddingRight: 20,
    },
    actionGroup: {
        marginLeft: 20,
        flexDirection: 'row',
        alignItems: 'center',
        gap: windowWidth / 9,
    },
    actionBtn: {
        paddingLeft: 12,
        paddingRight: 12,
        paddingTop: 4,
        paddingBottom: 4,
        borderRadius: 4
    },
    actionBtnText: {
        color: '#fff'
    },
    actionContainer: {
        flexDirection: 'row',
        justifyContent: 'space-between'
    },
    editorContainer: {
        marginTop: 40
    }
});
