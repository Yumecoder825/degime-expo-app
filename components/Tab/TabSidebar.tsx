import React, { useState } from 'react'
import { TouchableOpacity, StyleSheet, useColorScheme } from 'react-native'
import { Feather, FontAwesome, MaterialCommunityIcons, MaterialIcons } from '@expo/vector-icons';
import { getDimention } from '../../utils/dimentions';
import { Text, View } from '../Themed'
import Colors from '../../constants/Colors';
import { TabHeight } from './Constant';
import GlobalStyles from '../../constants/GlobalStyles';


const { windowWidth } = getDimention()

type TTabItemProps = TouchableOpacity['props'] & {
    actived: boolean;
    renderChildren: (_actived: boolean) => TouchableOpacity['props']['children'];
}
function TabItem({ actived, renderChildren, ...props }: TTabItemProps) {
    return (
        <TouchableOpacity
            {...props}
        >
            {renderChildren(actived)}
        </TouchableOpacity>
    )
}
type TTabSidebarProps = {
    onChangeTab?: (tabIndex: number) => void;
}
function TabSidebar({ onChangeTab }: TTabSidebarProps) {
    const colorScheme = useColorScheme() || 'light';
    const [tab, setTab] = useState(0);

    const tabIconColor = Colors[colorScheme].secondary;

    const handleOnPressTab = (_newTab: number) => {
        setTab(_newTab)
        onChangeTab && onChangeTab(_newTab)
    }

    return (
        <View
            style={[
                styles.container,
                GlobalStyles.primaryBoxShadow
            ]}
        >
            <TabItem
                actived={tab === 0}
                onPress={() => handleOnPressTab(0)}
                style={[
                    tab === 0 && {
                        backgroundColor: Colors[colorScheme].secondary
                    },
                    styles.tab
                ]}
                renderChildren={(active) => {
                    return (
                        <>
                            <MaterialCommunityIcons name="message-processing-outline" style={{ marginBottom: -3 }} size={32} color={active ? 'white' : tabIconColor} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </>
                    )
                }}
            />
            <TabItem
                actived={tab === 1}
                onPress={() => handleOnPressTab(1)}
                style={[
                    tab === 1 && {
                        backgroundColor: Colors[colorScheme].secondary
                    },
                    styles.tab
                ]}
                renderChildren={(active) => {
                    return (
                        <>
                            <MaterialIcons name="perm-contact-calendar" style={{ marginBottom: -3 }} size={32} color={active ? 'white' : tabIconColor} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </>
                    )
                }}
            />
            <TabItem
                actived={tab === 2}
                onPress={() => handleOnPressTab(2)}
                style={[
                    tab === 2 && {
                        backgroundColor: Colors[colorScheme].secondary
                    },
                    styles.tab
                ]}
                renderChildren={(active) => {
                    return (
                        <>
                            <FontAwesome name="line-chart" style={{ marginBottom: -3 }} size={32} color={active ? 'white' : tabIconColor} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </>
                    )
                }}
            />
            <TabItem
                actived={tab === 3}
                onPress={() => handleOnPressTab(3)}
                style={[
                    tab === 3 && {
                        backgroundColor: Colors[colorScheme].secondary
                    },
                    styles.tab
                ]}
                renderChildren={(active) => {
                    return (
                        <>
                            <Feather name="settings" style={{ marginBottom: -3 }} size={32} color={active ? 'white' : tabIconColor} />
                            {
                                active && (
                                    <Text style={styles.tabText}>
                                        チャット
                                    </Text>
                                )
                            }
                        </>
                    )
                }}
            />
        </View>
    )
}

export default TabSidebar

const styles = StyleSheet.create({
    container: {
        width: windowWidth,
        height: TabHeight,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        paddingHorizontal: 12,
    },
    tab: {
        flexDirection: 'row',
        alignItems: 'center',
        paddingHorizontal: 4,
        paddingVertical: 4,
        borderRadius: 4,
    },
    tabText: {
        marginLeft: 4,
        color: '#fff'
    }
})