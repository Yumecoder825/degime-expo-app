import { Image } from 'expo-image'
import React from 'react'
import { StyleSheet } from 'react-native'
import GlobalStyles from '../../../constants/GlobalStyles'
import { View } from '../../Themed'

type TChanelMembersViewProps = {
    userAvatars: string[];
    isGroup?: boolean;
}

function ChanelMembersView({ userAvatars, isGroup = false }: TChanelMembersViewProps) {
    return (
        <View
            style={[
                styles.container, {
                    gap: userAvatars.length > 5 ? 4 : 12
                }
            ]}
        >
            {userAvatars.map((avatar, idx) => (
                <View
                    key={idx}
                    style={[
                        styles.imageShadow,
                        isGroup && {
                            marginTop: idx % 2 === 0 ? 0 : 16,
                            marginBottom: idx % 2 === 0 ? 16 : 0,
                        }
                    ]}
                >
                    <Image
                        style={[
                            isGroup ? styles.groupImage : styles.image,
                        ]}
                        source={avatar}
                    />
                </View>
            ))}
        </View>
    )
}

export default ChanelMembersView

const styles = StyleSheet.create({
    image: {
        width: 44,
        height: 44,
        borderRadius: 999
    },
    groupImage: {
        width: 34,
        height: 34,
        borderRadius: 999,
        borderWidth: 1,
        borderColor: '#0004'
    },
    container: {
        flexDirection: 'row',
        gap: 8,
        paddingVertical: 16,
    },
    imageShadow: {
        borderRadius: 999,

        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 5,
        },
        shadowOpacity: 0.36,
        shadowRadius: 6.68,
        
        elevation: 11,
        
    }
})
