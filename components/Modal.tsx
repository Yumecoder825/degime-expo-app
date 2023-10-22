import { Modal, StyleSheet } from 'react-native'
import { getDimention } from '../utils/dimentions';
import { View } from './Themed'

type TModalProps = {
    isVisible: boolean;
    onRequestClose: () => void;
    children: any;
}

const { windowHeight, windowWidth } = getDimention()

export function AppModal({ isVisible, onRequestClose, children }: TModalProps) {
    return (
        <Modal
            animationType="fade"
            transparent={true}
            visible={isVisible}
            onRequestClose={onRequestClose}
        >
            <View style={styles.centeredView}>
                <View style={styles.modalView}>
                    {children}
                </View>
            </View>
        </Modal>
    )
}

const styles = StyleSheet.create({
    centeredView: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        height: windowHeight,
        backgroundColor: '#00000044',
    },
    modalView: {
        margin: 20,
        backgroundColor: 'white',
        borderRadius: 8,
        padding: 16,
        alignItems: 'center',
        shadowColor: '#000',
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 4,
        elevation: 5,
    },
});
