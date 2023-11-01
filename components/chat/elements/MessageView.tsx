import { Image } from 'expo-image';
import { StyleSheet, useColorScheme } from 'react-native'
import Colors from '../../../constants/Colors';
import { Text, View } from '../../Themed'

export type TMessageViewProps = {
    text: string;
    senderAvatar?: string;
    byMe?: boolean;
}

function MessageView({ text, senderAvatar, byMe }: TMessageViewProps) {
    const colorScheme = useColorScheme() || 'light';

    return (
        <View
            style={styles.container}
        >
            <View
                style={[styles.subContainer, byMe ? {
                    backgroundColor: Colors[colorScheme].red1,
                    marginLeft: 40,
                    alignSelf: 'flex-end'
                } : {
                    backgroundColor: Colors[colorScheme].green1,
                    marginRight: 40,
                    alignSelf: 'flex-start'
                }]}
            >
                <Text
                    style={[
                        styles.message
                    ]}
                >{text}</Text>
                {
                    senderAvatar && (
                        <Image
                            style={styles.image}
                            source={senderAvatar}
                        />
                    )
                }
            </View>
        </View>
    )
}

export default MessageView

const styles = StyleSheet.create({
    container: {
        position: 'relative',
        marginTop: 12
    },
    subContainer: {
        position: 'relative',
        padding: 16,
        paddingVertical: 12,
        borderRadius: 24,
    },
    image: {
        width: 24,
        height: 24,
        position: "absolute",
        right: -10,
        bottom: 2,
    },
    message: {
        color: '#fff'
    }
})