import React from 'react'
import { KeyboardAvoidingView, Platform, SafeAreaView, ScrollView, StyleSheet, TextInput } from 'react-native';
import { actions, RichEditor, RichToolbar } from "react-native-pell-rich-editor";
import { getDimention } from '../../../utils/dimentions';
import { ActionButtons } from '../elements/ActionButtons';

const { windowWidth } = getDimention()

function TextWidget() {
    const richText = React.useRef<any>();

    return (
        <SafeAreaView
            style={styles.container}
        >
            <RichToolbar
                editor={richText}
            // actions={[actions.setBold, actions.setItalic, actions.setUnderline, actions.heading1]}
            />
            <ScrollView
                style={styles.scrollView}
            >
                <KeyboardAvoidingView behavior={Platform.OS === "ios" ? "padding" : "height"} >
                    <RichEditor
                        ref={richText}
                        style={styles.richEditor}
                        onChange={descriptionText => {
                            console.log("descriptionText:", descriptionText);
                        }}
                        placeholder='テキスト追加'
                        useContainer={false}
                        containerStyle={styles.richContainer}
                    />
                </KeyboardAvoidingView>
            </ScrollView>

            <TextInput
                style={styles.url}
                placeholder='URL'
            />

            <ActionButtons />
        </SafeAreaView >
    )
}

export default TextWidget

const styles = StyleSheet.create({
    container: {
        width: windowWidth - 44,
        marginTop: 8,
    },
    scrollView: {
        // height: 60,
        // backgroundColor: 'red',
    },
    richEditor: {
    },
    richContainer: {
        height: 60,
        borderWidth: 1,
        borderColor: '#0008',
        borderRadius: 4,
    },
    url: {
        marginTop: 4,
        borderRadius: 4,
        borderWidth: 1,
        borderColor: '#0008',
        paddingHorizontal: 8,
        fontSize: 12,
        maxWidth: windowWidth / 3
    }
})
