import { useState } from "react";
import { Image } from "expo-image";
import { Ionicons } from '@expo/vector-icons';
import { ScrollView, StyleSheet, useColorScheme, TouchableOpacity } from "react-native";
import Colors from "../../../constants/Colors";
import { Text, View } from "../../Themed";
import { getDimention } from "../../../utils/dimentions";
import { AppModal } from "../../Modal";
import { ImageWidgetItem } from "../elements/ImageWidgetItem";
import { ActionButtons } from "../elements/ActionButtons";

const { windowWidth } = getDimention()

type TImgElementProps = {
    source: Image['props']['source'];
    title: string;
    description: string;
    onPress?: TouchableOpacity['props']['onPress'];
}
function ImgElement({ source, title, description, onPress }: TImgElementProps) {
    const colorTheme = useColorScheme()

    return (
        <TouchableOpacity
            style={[imgElementStyles.view, { backgroundColor: Colors[colorTheme ?? 'light'].blue3 }]}
            onPress={onPress}
        >
            <Image style={[imgElementStyles.img]} source={source} />
            <Text style={imgElementStyles.title}>{title}</Text>
            <Text style={imgElementStyles.desc}>{description}</Text>
        </TouchableOpacity>
    )
}

const imgElementStyles = StyleSheet.create({
    view: {
        borderRadius: 12,
        paddingVertical: 6,
        paddingHorizontal: 10,
        marginRight: 12,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        gap: 4
    },
    img: {
        width: (windowWidth - 160) / 3,
        height: 60,
        flex: 1
    },
    title: {
        fontSize: 9,
        color: '#fff'
    },
    desc: {
        fontSize: 5,
        color: '#fff'
    }
});
///////////////////////////////

type TImageWidgets = Omit<TImgElementProps, 'onPress'>[];
const placeHolderImg = require('../../../assets/images/img-placeholder.png');

const defaultImgWidget = {
    source: '',
    title: '',
    description: '',
}

export function ImageWidget() {
    const [widgets, setWidgets] = useState<TImageWidgets>([{
        source: require('../../../assets/images/widget-image.png'),
        title: '私の写真1',
        description: '私の写真のテキスト1',
    }, {
        source: require('../../../assets/images/widget-image.png'),
        title: '私の写真1',
        description: '私の写真のテキスト1',
    }, {
        source: require('../../../assets/images/widget-image.png'),
        title: '私の写真1',
        description: '私の写真のテキスト1'
    }])
    const [showModal, setShowModal] = useState(false);

    const handleOnPressImage = () => {
        setShowModal(true)
    }
    const handleOnRequestClose = () => {
        setShowModal(false)
    }
    const handleOnPressAdd = () => {
        setWidgets(p => {
            const _p = p.slice();
            _p.push(defaultImgWidget);
            return _p.slice();
        });
    }

    const handleOnPressTrash = () => {
        setWidgets([])
    }
    const removeWidget = (_index: number) => {
        const start = widgets.slice(0, _index);
        const end = widgets.slice(_index + 1, widgets.length);

        setWidgets([...start, ...end]);
    }

    return (
        <ScrollView style={styles.container}
            horizontal
        >
            {
                widgets.map((widget, idx) => (
                    <ImgElement key={idx} source={widget.source ?? placeHolderImg} title={widget.title} description={widget.description}
                        onPress={handleOnPressImage}
                    />
                ))
            }
            <AppModal
                isVisible={showModal}
                onRequestClose={handleOnRequestClose}
            >
                <View
                    style={styles.modalContainer}
                >
                    <ScrollView
                        style={styles.widgetScrollView}
                        horizontal
                    >
                        {
                            widgets.map((widget, idx) => (
                                <ImageWidgetItem
                                    img={widget.source}
                                    onPressClose={() => removeWidget(idx)}
                                />
                            ))
                        }
                        <TouchableOpacity
                            style={styles.addContainer}
                            onPress={handleOnPressAdd}
                        >
                            <Ionicons name="add-circle-outline" size={24} color="black" />
                        </TouchableOpacity>
                    </ScrollView>
                </View>
                <ActionButtons
                    onPressTrust={handleOnPressTrash}
                />
            </AppModal>
        </ScrollView>
    )
}

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        gap: 8
    },
    modalContainer: {
        height: 164
    },
    widgetScrollView: {
        width: 260,
        flexDirection: 'row'
    },
    addContainer: {
        marginVertical: 3,
        justifyContent: 'center',
        alignItems: 'center',
        paddingHorizontal: 12,
        borderRadius: 4,
        borderWidth: 2,
        borderColor: '#00000088'
    }
})
