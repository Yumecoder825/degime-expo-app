import { AntDesign, FontAwesome, MaterialCommunityIcons, MaterialIcons } from '@expo/vector-icons';
import React, { useState } from 'react'
import { TouchableOpacity, StyleSheet } from 'react-native'
import { Text, View } from '../Themed'

type TTabItemProps = TouchableOpacity['props'] & {
    actived: boolean;
    renderChildren: (_actived: boolean) => TouchableOpacity['props']['children'];
}
function TabItem({ actived, renderChildren }: TTabItemProps) {
    return (
        <TouchableOpacity>
            {renderChildren(actived)}
        </TouchableOpacity>
    )
}

function TabSidebar() {
    const [tab, setTab] = useState(0);

    return (
        <View
            style={styles.container}
        >
            <TabItem
                actived={tab === 0}
                renderChildren={(active) => {
                    return (
                        <View>
                            <MaterialCommunityIcons name="message-processing-outline" style={{ marginBottom: -3 }} size={28} color={active ? 'white' : "black"} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </View>
                    )
                }}
            />
            <TabItem
                actived={tab === 1}
                renderChildren={(active) => {
                    return (
                        <View>
                            <MaterialCommunityIcons name="bookmark-multiple-outline" style={{ marginBottom: -3 }} size={28} color={active ? 'white' : "black"} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </View>
                    )
                }}
            />
            <TabItem
                actived={tab === 2}
                renderChildren={(active) => {
                    return (
                        <View>
                            <MaterialIcons name="perm-contact-calendar" style={{ marginBottom: -3 }} size={28} color={active ? 'white' : "black"} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </View>
                    )
                }}
            />
            <TabItem
                actived={tab === 3}
                renderChildren={(active) => {
                    return (
                        <View>
                            <AntDesign name="user" style={{ marginBottom: -3 }} size={28} color={active ? 'white' : "black"} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </View>
                    )
                }}
            />
            <TabItem
                actived={tab === 4}
                renderChildren={(active) => {
                    return (
                        <View>
                            <FontAwesome name="line-chart" style={{ marginBottom: -3 }} size={28} color={active ? 'white' : "black"} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </View>
                    )
                }}
            />
        </View>
    )
}

export default TabSidebar

const styles = StyleSheet.create({
    container: {

    },
    tabText: {
        marginLeft: 4,
        color: '#fff'
    }
})