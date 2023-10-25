import { useState } from "react";
import { Image } from "expo-image";
import { ScrollView, StyleSheet, useColorScheme } from "react-native";
import Colors from "../../../constants/Colors";
import { Text, View } from "../../Themed";
import { getDimention } from "../../../utils/dimentions";

const { windowWidth } = getDimention()

type TImgElementProps = {
    source: Image['props']['source'];
    title: string;
    description: string;
}
function ImgElement({ source, title, description }: TImgElementProps) {
    const colorTheme = useColorScheme()

    return (
        <View style={[imgElementStyles.view, { backgroundColor: Colors[colorTheme ?? 'light'].blue3 }]}>
            <Image style={[imgElementStyles.img]} source={source} />
            <Text style={imgElementStyles.title}>{title}</Text>
            <Text style={imgElementStyles.desc}>{description}</Text>
        </View>
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

export function ImageWidget() {
    const [widgets] = useState([{
        image: require('../../assets/images/widget-image.png'),
        title: '私の写真1',
        subTitle: '私の写真のテキスト1',
    }, {
        image: require('../../assets/images/widget-image.png'),
        title: '私の写真1',
        subTitle: '私の写真のテキスト1',
    }, {
        image: require('../../assets/images/widget-image.png'),
        title: '私の写真1',
        subTitle: '私の写真のテキスト1'
    }])
    return (
        <ScrollView style={styles.container}
            horizontal
        >
            {
                widgets.map((widget, idx) => (
                    <ImgElement key={idx} source={widget.image} title={widget.title} description={widget.subTitle} />
                ))
            }
        </ScrollView>
    )
}

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        gap: 8
    }
})