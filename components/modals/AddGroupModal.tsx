import { useState } from 'react';
import { Image } from 'expo-image';
import { useColorScheme, StyleSheet, Button, TouchableOpacity, TextInput, Platform } from 'react-native'
import { launchImageLibraryAsync, MediaTypeOptions } from 'expo-image-picker';

import Colors from '../../constants/Colors';
import { getDimention } from '../../utils/dimentions';
import { AppModal } from '../Modal'
import { Text, View } from '../Themed'
import { Ionicons } from '@expo/vector-icons';

const { windowWidth } = getDimention()

// const SERVER_URL = 'http://localhost:3000';

// const createFormData = (photo: Asset, body = {}) => {
//     const data = new FormData();

//     // @ts-ignore
//     data.append('photo', {
//         // @ts-ignore
//         name: photo.fileName,
//         type: photo.type as string,
//         uri: Platform.OS === 'ios' ? photo.uri?.replace('file://', '') : photo.uri,
//     });

//     Object.keys(body).forEach((key) => {
//         // @ts-ignore
//         data.append(key, body[key]);
//     });

//     return data;
// };


type TAddGroupModalProps = {
    showModal: boolean;
    onRequestClose: () => void;
}

function AddGroupModal({ onRequestClose, showModal }: TAddGroupModalProps) {
    const colorScheme = useColorScheme() || 'light';

    const [image, setImage] = useState<string | null>(null);

    const handleOnAddChannel = () => {

    }

    const handleUploadPhoto = () => {
        // fetch(`${SERVER_URL}/api/upload`, {
        //     method: 'POST',
        //     body: createFormData(photo as Asset, { userId: '123' }),
        // })
        //     .then((response) => response.json())
        //     .then((response) => {
        //         console.log('response', response);
        //     })
        //     .catch((error) => {
        //         console.log('error', error);
        //     });
    };

    const pickImage = async () => {
        // No permissions request is necessary for launching the image library
        let result = await launchImageLibraryAsync({
            mediaTypes: MediaTypeOptions.Images,
            allowsEditing: true,
            aspect: [4, 3],
            quality: 1,
        });

        console.log(result);

        if (!result.canceled) {
            setImage(result.assets[0].uri);
        }
    };


    return (
        <AppModal
            isVisible={showModal}
            onRequestClose={onRequestClose}
            borderColor='#000'
        >
            <View
                style={styles.container}
            >
                <View
                    style={styles.subContainer}
                >
                    {image ? (
                        <>
                            <TouchableOpacity
                                onPress={pickImage}
                            >
                                <Image
                                    source={{ uri: image }}
                                    style={{ width: 300, height: 300 }}
                                />
                            </TouchableOpacity>

                            <View
                                style={{
                                    paddingVertical: 8
                                }}
                            >
                                <Button title="Upload Photo" onPress={handleUploadPhoto} />
                            </View>
                        </>
                    ) : (
                        <TouchableOpacity
                            style={styles.selectImageBtn}
                            onPress={pickImage}
                        >
                            <Ionicons name="ios-image-outline" size={48} color="black" />
                        </TouchableOpacity>
                    )}

                </View>
                <TextInput
                    style={styles.groupTitle}
                    placeholder='グループ名を入力'
                />
                <View
                    style={styles.actionSection}
                >
                    <TouchableOpacity
                        style={[
                            styles.button, {
                                borderColor: '#0008'
                            }
                        ]}
                        onPress={handleOnAddChannel}
                    >
                        <Text
                            style={styles.buttonText}
                        >はい</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={[
                            styles.button, {
                                backgroundColor: Colors[colorScheme].orange1,
                                borderColor: Colors[colorScheme].orange1,
                            }
                        ]}
                        onPress={onRequestClose}
                    >
                        <Text
                            style={[
                                styles.buttonText, {
                                    color: '#fff'
                                }
                            ]}
                        >いいえ</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </AppModal>
    )
}

export default AddGroupModal



const styles = StyleSheet.create({
    container: {
        paddingVertical: 12,
        paddingHorizontal: 8,
        width: windowWidth - 60
    },
    subContainer: {
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center'
    },
    actionSection: {
        marginTop: 20,
        flexDirection: 'row',
        justifyContent: 'space-between',
        gap: 20,
    },
    button: {
        flex: 1,
        paddingVertical: 4,
        borderRadius: 4,
        borderWidth: 1,
    },
    buttonText: {
        textAlign: 'center'
    },
    groupTitle: {
        borderRadius: 8,
        borderWidth: 1,
        borderColor: '#0008',
        color: '#000',
        fontSize: 14,
        fontWeight: '200',
        paddingHorizontal: 8
    },
    selectImageBtn: {
        paddingVertical: 24,
        paddingHorizontal: 24,
    }
})