import { useState } from "react";
import { SafeAreaView, StyleSheet, TouchableOpacity, useColorScheme, TextInput, ScrollView, KeyboardAvoidingView, Platform, StatusBar } from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { router } from "expo-router";
import { Text, View } from "../../components/Themed";
import Colors from "../../constants/Colors";
import { Image } from "expo-image";
import { getDimention } from "../../utils/dimentions";
import { ProfileBanner } from "../../components/profileeditor/Banner";
import { ImageWidget } from "../../components/profileeditor/widgets/ImageWidget";
import { AppModal } from "../../components/Modal";
import { SliderWidget } from "../../components/profileeditor/widgets/SliderWidget";
import SmallImageWidget from "../../components/profileeditor/widgets/SmallImageWidget";
import YoutubeWidget from "../../components/profileeditor/widgets/YoutubeWidget";
import MapWidget from "../../components/profileeditor/widgets/MapWidget";
import MarginWidget from "../../components/profileeditor/widgets/MarginWidget";
import TextWidget from "../../components/profileeditor/widgets/TextWidget";
import ScheduleWidget from "../../components/profileeditor/widgets/ScheduleWidget";
import AppImages from "../../constants/Images";

const { windowWidth, windowHeight } = getDimention()

export default function ProfileEditorScreen() {
    const colorTheme = useColorScheme()
    const [isShowSaveModal, setIsShowSaveModal] = useState(false);
    const [isShowWidget, setIsShowWidget] = useState(false);

    const handleOnPressSaveBtn = () => {
        setIsShowSaveModal(true)
    }
    const handleOnRequestClose = () => {
        setIsShowSaveModal(false)
    }
    const handleOnRequestWidgetClose = () => {
        setIsShowWidget(false)
    }
    const handleOnPressBack = () => {
        router.replace('/home')
    }

    const handleOnPressAvatar = () => {
        setIsShowWidget(true)
    }

    return (
        <SafeAreaView style={styles.safeAreaView}>
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
                <KeyboardAvoidingView
                    behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
                >

                    <ScrollView style={styles.scrollView}>

                        <View style={styles.editorContainer}>
                            <ProfileBanner />
                        </View>
                        <View style={styles.profileContainer}>
                            <TouchableOpacity
                                onPress={handleOnPressAvatar}
                            >
                                <Image style={styles.userAvatar} source={AppImages.userAvatar} />
                            </TouchableOpacity>
                            <View style={styles.profileGroup}>
                                <TextInput style={[styles.userName, { backgroundColor: Colors[colorTheme ?? 'light'].primary }]}
                                    defaultValue="あおい"
                                />
                                <View style={styles.chatIconGroup}>
                                    <TouchableOpacity>
                                        <Image style={styles.chatIcon} source={AppImages.chatworkIcon} />
                                    </TouchableOpacity>
                                    <TouchableOpacity>
                                        <Image style={styles.chatIcon} source={AppImages.lineIcon} />
                                    </TouchableOpacity>
                                    <TouchableOpacity>
                                        <Image style={styles.chatIcon} source={AppImages.skillIconInstagram} />
                                    </TouchableOpacity>
                                </View>
                            </View>
                        </View>
                        {/* input elements */}
                        <View style={styles.userInfoInputGroup}>
                            <TextInput
                                style={[styles.userInfoInput, styles.userInfoInputBig]}
                                defaultValue="PM"
                            />
                            <TextInput
                                style={[styles.userInfoInput, styles.userInfoInputBig]}
                                defaultValue="Gunta"
                            />
                            <TextInput
                                style={[styles.userInfoInput, styles.userInfoInputBig]}
                                defaultValue="8334123454"
                            />
                            <TextInput
                                style={[styles.userInfoInput, styles.userInfoInputBig]}
                                defaultValue="8334123454"
                            />
                            <TextInput
                                style={[styles.userInfoInput, styles.userInfoInputBig]}
                                defaultValue="superstar1121@gmail.com"
                            />
                            <TextInput
                                style={[styles.userInfoInput, styles.userInfoInputBig]}
                                defaultValue="mizuke, #09821"
                            />
                            <View style={{ marginVertical: 16 }}>
                                <ImageWidget />
                            </View>
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="https://superstar.portfolio/myimage1"
                            />
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="https://superstar.portfolio/myimage1"
                            />
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="https://superstar.portfolio/myimage1"
                            />
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="https://superstar.portfolio/myimage1"
                            />
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="https://superstar.portfolio/myimage1"
                            />
                            <Text style={styles.infoText}>特技</Text>
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="https://superstar.portfolio/myimage1"
                            />
                            <Text style={styles.infoText}>性格</Text>
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="耐性的で静かです。"
                            />
                            <TextInput
                                style={[styles.userInfoInput]}
                                defaultValue="https://superstar.portfolio/mywebsite"
                            />

                            <TouchableOpacity style={[styles.saveBtn, { backgroundColor: Colors[colorTheme ?? 'light'].primary }]}
                                onPress={handleOnPressSaveBtn}
                            >
                                <Text style={styles.saveBtnText}>保存する</Text>
                            </TouchableOpacity>
                        </View>
                    </ScrollView>
                </KeyboardAvoidingView>
            </View>
            <AppModal
                isVisible={isShowSaveModal}
                onRequestClose={handleOnRequestClose}
                showCloseBtn
                borderColor='#000'
            >
                <Text style={modalStyles.text}>どちらに保存しますか？</Text>
                <View style={modalStyles.container}>
                    <TouchableOpacity style={[modalStyles.btn, { borderColor: '#000' }]}
                    >
                        <Text style={modalStyles.btnText}>ビジネス</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={[modalStyles.btn, { backgroundColor: Colors[colorTheme ?? 'light'].orange1, borderColor: Colors[colorTheme ?? 'light'].orange1 }]}
                    >
                        <Text style={[modalStyles.btnText, { color: '#fff' }]}>プライベート</Text>
                    </TouchableOpacity>
                </View>
            </AppModal>
            {/* <AppModal
                isVisible={isShowWidget}
                onRequestClose={handleOnRequestWidgetClose}
            >
                <SliderWidget />
            </AppModal> */}
            {/* <AppModal
                isVisible={isShowWidget}
                onRequestClose={handleOnRequestWidgetClose}
                modalViewStyle={{
                        backgroundColor: 'transparent'
                }}
            >
                <SmallImageWidget />
            </AppModal> */}
            {/* <AppModal
                isVisible={isShowWidget}
                onRequestClose={handleOnRequestWidgetClose}
            >
                <MapWidget />
            </AppModal> */}
            {/* <AppModal
                isVisible={isShowWidget}
                onRequestClose={handleOnRequestWidgetClose}
            >
                <MarginWidget />
            </AppModal> */}
            {/* <AppModal
                isVisible={isShowWidget}
                onRequestClose={handleOnRequestWidgetClose}
            >
                <TextWidget />
            </AppModal> */}
            {/* <AppModal
                isVisible={isShowWidget}
                onRequestClose={handleOnRequestWidgetClose}
            >
                <ScheduleWidget
                    onPressClose={handleOnRequestWidgetClose}
                />
            </AppModal> */}
            {/* <AppModal
                isVisible={isShowWidget}
                onRequestClose={handleOnRequestWidgetClose}
            >
                <YoutubeWidget />
            </AppModal> */}
        </SafeAreaView>
    )
}

const styles = StyleSheet.create({
    safeAreaView: {
        flex: 1,
        paddingTop: StatusBar.currentHeight
    },
    scrollView: {
        height: windowHeight - (StatusBar.currentHeight || 0)
    },
    container: {
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
        justifyContent: 'space-between',
        paddingVertical: 8
    },
    editorContainer: {
        marginTop: 40
    },
    profileContainer: {
        flexDirection: 'row',
        alignItems: 'center',
        paddingTop: 8,
        paddingBottom: 8,
        gap: 8,
        marginTop: 16,
        marginBottom: 16,
    },
    profileGroup: {
        flexDirection: 'column',
        flex: 1,
        gap: 12,
        paddingLeft: 8,
        paddingRight: 8,
    },
    userAvatar: {
        width: 92,
        height: 92,
        borderRadius: 999,
    },
    userName: {
        borderRadius: 4,
        color: '#fff',
        textAlign: 'center',
        fontWeight: 'bold',
        fontSize: 20,
        paddingTop: 4,
        paddingBottom: 4,
    },
    chatIconGroup: {
        flexDirection: 'row',
        gap: 8,
        paddingTop: 4,
        paddingBottom: 4,
    },
    chatIcon: {
        width: 44,
        height: 44,
    },
    userInfoInputGroup: {
        flexDirection: 'column',
        gap: 8,
        paddingLeft: 16,
        paddingRight: 16,
    },
    userInfoInput: {
        borderWidth: 1,
        borderRadius: 8,
        borderColor: '#00000088',
        paddingTop: 6,
        paddingBottom: 6,
        paddingLeft: 16,
        paddingRight: 16,
        fontSize: 16
    },
    userInfoInputBig: {
        fontWeight: 'bold'
    },
    infoText: {
        textAlign: 'center',
        fontWeight: 'bold',
        paddingVertical: 4
    },
    saveBtn: {
        marginVertical: 48,
        borderRadius: 8,
        paddingVertical: 12,
    },
    saveBtnText: {
        textAlign: 'center',
        color: '#fff',
    }
});

const modalStyles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        marginHorizontal: 4,
        gap: 16,
        marginVertical: 16
    },
    text: {
        fontSize: 20,
        marginVertical: 16
    },
    btn: {
        paddingVertical: 4,
        borderRadius: 8,
        borderWidth: 1,
        flex: 1
    },
    btnText: {
        fontSize: 18,
        fontWeight: '400',
        textAlign: 'center'
    }
})