import React, { useMemo, useState } from 'react'
import { StyleSheet, StatusBar, SafeAreaView, ScrollView } from 'react-native'

import TabSidebar from '../components/Tab/TabSidebar'
import ProfileSection from '../components/profile'
// import ChatRequestView from '../components/chat/ChatRequestView'
// import ChatListView from '../components/chat/ChatListView'
// import AddNewGroupView from '../components/chat/AddNewGroupView'
import ChatView from '../components/chat/ChatView'
import { View } from '../components/Themed'
import { getDimention } from '../utils/dimentions'
import { TabHeight } from '../components/Tab/Constant'
import { HomeContext } from '../Context/HomeContext'

const { windowHeight } = getDimention()

function home() {
    const [tab, setTab] = useState(0)
    const [showMenu, setShowMenu] = useState(false)

    const handleOnChangeTab = (_tab: number) => {
        setTab(_tab)
    }

    const component = useMemo(() => {
        if (tab === 0) {
            return <ChatView />
        } else if (tab === 3) {
            return <ProfileSection />
        }
    }, [tab])

    return (
        <HomeContext.Provider
            value={{
                showMenu: showMenu,
                setShowMenu: setShowMenu
            }}
        >
            <SafeAreaView
                style={styles.container}
            >
                <View
                    style={styles.body}
                >
                    {component}
                </View>
                {
                    showMenu && (
                        <View
                            style={styles.tabSection}
                        >
                            <TabSidebar
                                onChangeTab={handleOnChangeTab}
                            />
                        </View>
                    )
                }
            </SafeAreaView>
        </HomeContext.Provider>

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
        // backgroundColor: 'red',
        height: windowHeight - TabHeight,// - (StatusBar.currentHeight || 0)
    },
    tabSection: {
        position: 'absolute',
        bottom: 0
    }
})
