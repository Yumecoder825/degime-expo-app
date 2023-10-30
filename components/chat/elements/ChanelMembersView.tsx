import { Image } from 'expo-image'
import React from 'react'
import { StyleSheet } from 'react-native'
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
                <Image style={[
                    isGroup ? styles.groupImage : styles.image,
                    isGroup && {
                        marginTop: idx % 2 === 0 ? 0 : 16,
                        marginBottom: idx % 2 === 0 ? 16 : 0,
                    }
                ]} key={idx} source={avatar} />
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
        borderRadius: 999
    },
    container: {
        flexDirection: 'row',
        gap: 8,
        paddingVertical: 16
        // backgroundColor: 'red'
    }
})
