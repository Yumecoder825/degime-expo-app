import { Modal, StyleSheet, TouchableOpacity, useColorScheme, View as RNView } from 'react-native'

import { getDimention } from '../utils/dimentions';
import { AntDesign } from '@expo/vector-icons';
import { View } from './Themed'
import Colors from '../constants/Colors';

const { windowHeight, /*windowWidth*/ } = getDimention()

type TModalProps = {
    isVisible: boolean;
    onRequestClose: () => void;
    borderColor?: string;
    showCloseBtn?: boolean;
    modalViewStyle?: RNView['props']['style'];
    children: any;
}

export function AppModal({ isVisible, onRequestClose, borderColor, showCloseBtn, children, modalViewStyle }: TModalProps) {
    const colorTheme = useColorScheme()

    return (
        <Modal
            animationType="fade"
            transparent={true}
            visible={isVisible}
            onRequestClose={onRequestClose}
            style={styles.modal}
        >
            <View style={styles.centeredView}>
                <View style={[modalViewStyle ? modalViewStyle : styles.modalView, { borderColor: borderColor || '#fff' }, modalViewStyle]}
                >
                    {
                        showCloseBtn && (
                            <TouchableOpacity style={[styles.closeButton, { backgroundColor: Colors[colorTheme ?? 'light'].grayMedium }]}
                                onPress={onRequestClose}
                            >
                                <AntDesign name="close" size={16} color="black" />
                            </TouchableOpacity>
                        )
                    }
                    {children}
                </View>
            </View>
        </Modal>
    )
}

const styles = StyleSheet.create({
    modal: {
    },
    centeredView: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        height: windowHeight,
        backgroundColor: '#00000044',
    },
    modalView: {
        position: 'relative',
        margin: 20,
        backgroundColor: 'white',
        borderRadius: 8,
        borderWidth: 1,
        padding: 16,
        shadowColor: '#000',
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 4,
        elevation: 5,
    },
    closeButton: {
        position: 'absolute',
        top: 10,
        right: 10,
        padding: 4,
        borderRadius: 999,
        zIndex: 1,
    }
});
