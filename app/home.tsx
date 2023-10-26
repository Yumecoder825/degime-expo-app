import React, { useMemo, useState } from 'react'
import { StyleSheet, StatusBar, SafeAreaView, ScrollView } from 'react-native'

import TabSidebar from '../components/Tab/TabSidebar'
import ProfileSection from '../components/profile'
import { View } from '../components/Themed'
import { getDimention } from '../utils/dimentions'
import { TabHeight } from '../components/Tab/Constant'

const { windowHeight } = getDimention()

function home() {
    const [tab, setTab] = useState(0)

    const handleOnChangeTab = (_tab: number) => {
        setTab(_tab)
    }

    const component = useMemo(() => {
        if (tab === 0) {
            return <ProfileSection />
        } else if (tab === 3) {
            return <ProfileSection />
        }
    }, [tab])

    return (
        <SafeAreaView
            style={styles.container}
        >
            <View
                style={styles.body}
            >
                <ScrollView>
                    {component}
                </ScrollView>
            </View>
            <View
                style={styles.tabSection}
            >
                <TabSidebar
                    onChangeTab={handleOnChangeTab}
                />
            </View>
        </SafeAreaView>
    )
}

export default home

const styles = StyleSheet.create({
    container: {
        marginTop: StatusBar.currentHeight,
        flex: 1,
        // position: 'relative',
    },
    body: {
        backgroundColor: 'red',
        height: windowHeight - TabHeight// - (StatusBar.currentHeight || 0)
    },
    tabSection: {
        position: 'absolute',
        bottom: 0
    }
})
