import { StyleSheet, TextInput, TouchableOpacity } from 'react-native'
import { Image } from 'expo-image'
import React, { useState } from 'react'
import AppImages from '../../../constants/Images'
import { View } from '../../Themed'
import { getDimention } from '../../../utils/dimentions'
import { ActionButtons } from '../elements/ActionButtons'

const { windowHeight, windowWidth } = getDimention()

function YoutubeWidget() {
    const [url, setUrl] = useState('');

    return (
        <View
            style={styles.container}
        >
            <View
                style={styles.section}
            >
                <TouchableOpacity
                    style={styles.subSection}
                >
                    <Image
                        style={styles.placeHolderImg}
                        source={AppImages.imagePlaceHolder}
                    />
                </TouchableOpacity>
                <TextInput 
                    style={styles.url}
                    placeholder='Youtube URL'
                />
            </View>
            <View
                style={styles.actionGroup}
            >
                <ActionButtons />
            </View>
        </View>
    )
}

export default YoutubeWidget

const styles = StyleSheet.create({
    container: {
        width: windowWidth - 60
    },
    section: {
        borderWidth: 1,
        borderColor: '#0008'
    },
    subSection: {
        paddingHorizontal: (windowWidth - 100) / 2,
        paddingVertical: windowHeight / 20,
    },
    placeHolderImg: {
        width: 22,
        height: 22,
    },
    url: {
        borderTopWidth: 1,
        borderTopColor: '#0008',
        paddingHorizontal: 8,
        fontSize: 14
    },
    actionGroup: {
        marginTop: 12
    }
})