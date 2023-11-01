import { useState } from "react"
import { SafeAreaView, ScrollView, StatusBar, StyleSheet, TouchableOpacity, useColorScheme } from "react-native"
import { Image } from "expo-image"
import { Ionicons } from "@expo/vector-icons"
import { router } from "expo-router"
import { Text, View } from "../components/Themed"
import { getDimention } from "../utils/dimentions"
import Colors from "../constants/Colors"
import { ProfileItemView, TProfileItemViewProps } from "../components/savedProfile/ProfileItem"
import { AppModal } from "../components/Modal"
import AppImages from "../constants/Images"

const { windowWidth, windowHeight } = getDimention()

enum Tab {
    private,
    business,
}

type Profile = Omit<TProfileItemViewProps, 'onPressChat'>

function SavedProfilesScreen() {
    const [isModalShow, setIsModalShow] = useState(false)
    const [tab, setTab] = useState(Tab.business)
    const [profiles] = useState<Profile[]>([
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date1: '2022/11/20保存',
            date2: '2022/11/20更新',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date1: '2022/11/20保存',
            date2: '2022/11/20更新',
        },
        {
            source: AppImages.savedItemAvatar,
            title: 'Jane Cooper',
            date1: '2022/11/20保存',
            date2: '2022/11/20更新',
        },
    ])
    const colorTheme = useColorScheme()

    const handleOnPressBack = () => {
        router.replace('/home')
    }

    const handleOnClickTab = (_tab: Tab) => {
        setTab(_tab);
    }

    const handleOnRequestClose = () => {
        setIsModalShow(false)
    }

    const handleOnPressEdit = () => {
        setIsModalShow(true)
    }

    return (
        <SafeAreaView style={styles.safeAreaView}>
            <View style={styles.container}>
                <View style={styles.actionContainer}>
                    <View style={styles.actionSubContainer}>
                        <TouchableOpacity
                            style={styles.backBtn}
                            onPress={handleOnPressBack}
                        >
                            <Ionicons name="md-return-down-back-sharp" size={24} color="#fff" />
                        </TouchableOpacity>
                        <Text style={styles.title}>パブリック</Text>
                    </View>
                </View>
                <Image style={[styles.profileBg, { width: windowWidth, height: windowHeight / 4 }]} source={AppImages.savedProfileBG} />

                <View style={styles.profileContainer}>
                    <View style={styles.avatarContainer}>
                        <Image style={[styles.avatar]} source={AppImages.userAvatar} />
                        <Text style={{ fontWeight: 'bold' }}>はるこ</Text>
                    </View>
                </View>
                <View style={styles.tabList}>
                    <View style={styles.tabHeader}>
                        <TouchableOpacity
                            style={[
                                styles.tabButton,
                                {
                                    borderBottomColor: tab === Tab.business ? Colors[colorTheme ?? 'light'].purple1 : 'transparent',
                                }
                            ]}
                            onPress={() => handleOnClickTab(Tab.business)}
                        >
                            <Text
                                style={[
                                    styles.tabButtonText,
                                    {
                                        color: tab === Tab.business ? Colors[colorTheme ?? 'light'].purple1 : '#000',
                                    }
                                ]}
                            >ビジネス</Text>
                        </TouchableOpacity>
                        <TouchableOpacity
                            style={[
                                styles.tabButton,
                                {
                                    borderBottomColor: tab === Tab.private ? Colors[colorTheme ?? 'light'].purple1 : 'transparent',
                                }
                            ]}
                            onPress={() => handleOnClickTab(Tab.private)}
                        >
                            <Text
                                style={[
                                    styles.tabButtonText,
                                    {
                                        color: tab === Tab.private ? Colors[colorTheme ?? 'light'].purple1 : '#000',
                                    }
                                ]}
                            >プライベート</Text>
                        </TouchableOpacity>
                    </View>
                    <ScrollView
                        style={styles.scollView}
                    >
                        {
                            profiles.map((p, idx) => (
                                <ProfileItemView key={idx} date1={p.date1} date2={p.date2} title={p.title} source={p.source} />
                            ))
                        }
                    </ScrollView>
                </View>
                <View
                    style={styles.buttonContainer}
                >
                    <TouchableOpacity
                        style={[
                            styles.editBtn, {
                                backgroundColor: Colors[colorTheme ?? 'light'].green1
                            }
                        ]}
                        onPress={handleOnPressEdit}
                    >
                        <Text
                            style={styles.editBtnText}
                        >
                            マイページの作成・編集
                        </Text>
                    </TouchableOpacity>
                </View>
            </View>
            <AppModal
                isVisible={isModalShow}
                onRequestClose={handleOnRequestClose}
                showCloseBtn
            >
                <Text
                    style={modalStyles.title}
                >テンプレートを選択する</Text>
                <View
                    style={modalStyles.actionGroup}
                >
                    <TouchableOpacity
                        style={[
                            modalStyles.button, {
                                borderColor: Colors[colorTheme ?? 'light'].gray2
                            }
                        ]}
                    >
                        <Text
                            style={modalStyles.buttonText}
                        >ビジネス名刺</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={[
                            modalStyles.button, {
                                backgroundColor: Colors[colorTheme ?? 'light'].orange1
                            }
                        ]}
                    >
                        <Text
                            style={[
                                modalStyles.buttonText, {
                                    color: Colors[colorTheme ?? 'light'].white
                                }
                            ]}
                        >SNS名刺</Text>
                    </TouchableOpacity>
                </View>
            </AppModal>
        </SafeAreaView>
    )
}

export default SavedProfilesScreen

const styles = StyleSheet.create({
    safeAreaView: {
        flex: 1,
        paddingTop: StatusBar.currentHeight,
    },
    container: {
        height: windowHeight,
    },
    actionContainer: {
        position: 'absolute',
        paddingVertical: 8,
        zIndex: 1,
        backgroundColor: 'transparent',
        width: windowWidth
    },
    actionSubContainer: {
        position: 'relative',
        backgroundColor: 'transparent',
    },
    backBtn: {
        position: 'absolute',
        zIndex: 1,
        left: 12,
        top: -4
    },
    title: {
        textAlign: 'center',
        backgroundColor: 'transparent',
        color: '#fff'
    },
    profileContainer: {
        zIndex: 10,
        position: 'relative',
    },
    avatarContainer: {
        alignItems: 'center',
        justifyContent: 'center',
        gap: 4
    },
    avatar: {
        width: 80,
        height: 80,
        zIndex: 100,
        marginTop: -30,
        borderRadius: 999
    },
    profileBg: {
        width: 'auto'
    },
    tabList: {
        marginTop: 16
    },
    tabHeader: {
        flexDirection: 'row',
        justifyContent: 'center',
        gap: 16,
        marginBottom: 4
    },
    tabButton: {
        borderBottomWidth: 1,
        paddingHorizontal: 8,
        paddingBottom: 2,
    },
    tabButtonText: {
        fontSize: 16,
        fontWeight: 'bold',
    },
    scollView: {
        height: 360,
        paddingTop: 8,
    },
    buttonContainer: {
        justifyContent: 'center',
        alignItems: 'center',
    },
    editBtn: {
        borderRadius: 8,
        paddingVertical: 8,
        paddingHorizontal: 14,
    },
    editBtnText: {
        fontSize: 10,
        fontWeight: '400',
        color: '#fff',
    },
})

const modalStyles = StyleSheet.create({
    title: {
        fontSize: 20,
        fontWeight: '700',
        marginVertical: 12,
        textAlign: 'center',
    },
    actionGroup: {
        flexDirection: 'row',
        gap: 12,
        marginVertical: 18,
    },
    button: {
        flex: 1,
        borderWidth: 1,
        borderRadius: 4,
        borderColor: 'transparent',
    },
    buttonText: {
        textAlign: 'center',
        fontFamily: 'Poppins',
        fontSize: 18,
    }
})