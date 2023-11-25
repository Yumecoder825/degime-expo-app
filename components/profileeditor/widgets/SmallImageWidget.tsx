import { StyleSheet, SafeAreaView, TouchableOpacity, TextInput } from 'react-native'
import { Ionicons, MaterialCommunityIcons } from '@expo/vector-icons'
import { View } from '../../Themed'
import { ProfileInput } from '../elements/Input'
import { ActionButtons } from '../elements/ActionButtons'
import GlobalStyles from '../../../constants/GlobalStyles'

type TSmallImageWidgetProps = {

}

function SmallImageWidget({}: TSmallImageWidgetProps) {
    return (
        <SafeAreaView>
            <View
                style={[styles.container, GlobalStyles.primaryBoxShadow]}
            >
                <View
                    style={styles.imageBtn}
                >
                    <MaterialCommunityIcons name="image-plus" size={35} color="#0008" />
                </View>
                <View
                    style={{
                        marginLeft: 8
                    }}
                >
                    <View
                        style={styles.inputGroup}
                    >
                        <ProfileInput
                            placeholder='タイトル'
                        />
                        <ProfileInput
                            placeholder='テキスト'
                        />
                    </View>
                </View>
            </View>

            <View
                style={[styles.actionContainer, GlobalStyles.primaryBoxShadow]}
            >
                <View
                    style={styles.urlGroup}
                >
                    <TouchableOpacity>
                        <Ionicons name="trash-outline" size={24} color="black" />
                    </TouchableOpacity>
                    <TextInput
                        style={styles.url}
                        placeholder='https://degime.net'
                    />
                </View>
                <ActionButtons hideTrash />
            </View>
        </SafeAreaView>
    )
}

export default SmallImageWidget

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        gap: 4,
        borderRadius: 8,
        paddingVertical: 12,
        paddingHorizontal: 12,
    },
    imageBtn: {
        padding: 16,

        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 4,
        },
        shadowOpacity: 0.30,
        shadowRadius: 4.65,
        elevation: 8,
    },
    inputGroup: {
        flexDirection: 'column',
        gap: 4,
        width: 260
    },
    actionContainer: {
        marginTop: 12,
        borderRadius: 8,
        flexDirection: 'row',
        justifyContent: 'space-between',
        paddingVertical: 12,
        paddingHorizontal: 8,
    },
    urlGroup: {
        flexDirection: 'row',
        alignItems: 'center',
    },
    url: {
        marginLeft: 4,
        fontSize: 12,
        paddingHorizontal: 4,
        fontWeight: '400',
        borderWidth: 1,
        borderRadius: 0,
        borderColor: '#0008',
        minWidth: 136
    }
})