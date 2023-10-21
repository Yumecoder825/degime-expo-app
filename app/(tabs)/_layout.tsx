import { AntDesign, FontAwesome, MaterialCommunityIcons, MaterialIcons } from '@expo/vector-icons';
import { Tabs } from 'expo-router';
import { StyleSheet, useColorScheme } from 'react-native';

import Colors from '../../constants/Colors';
import { Text, View } from '../../components/Themed';

export default function TabLayout() {
  const colorScheme = useColorScheme();

  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: Colors[colorScheme ?? 'light'].white,
        tabBarActiveBackgroundColor: Colors[colorScheme ?? 'light'].secondary,
        tabBarStyle: {
          flexDirection: 'row',
          justifyContent: 'flex-end'
        },
        tabBarItemStyle: {
          // flex: 0,
          // width: windowWidth / 6
        }
      }}>
      <Tabs.Screen
        name="index"
        options={{
          title: '',
          tabBarIcon: ({ color, focused }) => (
            <View style={styles.tab}>
              <MaterialCommunityIcons name="message-processing-outline" style={{ marginBottom: -3 }} size={28} color={focused ? 'white' : "black"} />
              {
                focused && (
                  <Text style={styles.tabText}>
                    チャット
                  </Text>
                )
              }
            </View>
          ),
          headerShown: false
        }}
      />

      <Tabs.Screen
        name="bookmark"
        options={{
          title: '',
          tabBarIcon: ({ color, focused }) => (
            <View style={styles.tab}>
              <MaterialCommunityIcons name="bookmark-multiple-outline" style={{ marginBottom: -3 }} size={28} color={focused ? 'white' : "black"} />
              {
                focused && (
                  <Text style={styles.tabText}>
                    チャット
                  </Text>
                )
              }
            </View>
          ),
          headerShown: false,
        }}
      />
      <Tabs.Screen
        name="contact"
        options={{
          title: '',
          tabBarIcon: ({ color, focused }) => (
            <View style={styles.tab}>
              <MaterialIcons name="perm-contact-calendar" style={{ marginBottom: -3 }} size={28} color={focused ? 'white' : "black"} />
              {
                focused && (
                  <Text style={styles.tabText}>
                    チャット
                  </Text>
                )
              }
            </View>
          ),
          headerShown: false,
        }}
      />
      <Tabs.Screen
        name="profile"
        options={{
          title: '',
          tabBarIcon: ({ color, focused }) => (
            <View style={styles.tab}>
              <AntDesign name="user" style={{ marginBottom: -3 }} size={28} color={focused ? 'white' : "black"} />
              {
                focused && (
                  <Text style={styles.tabText}>
                    チャット
                  </Text>
                )
              }
            </View>
          ),
          headerShown: false,
        }}
      />
       <Tabs.Screen
        name="charts"
        options={{
          title: '',
          tabBarIcon: ({ color, focused }) => (
            <View style={styles.tab}>
              <FontAwesome name="line-chart" style={{ marginBottom: -3 }} size={28} color="black" />
              {
                focused && (
                  <Text style={styles.tabText}>
                    チャット
                  </Text>
                )
              }
            </View>
          ),
          headerShown: false,
        }}
      />
    </Tabs>
  );
}

const styles = StyleSheet.create({
  tab: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'transparent',
    marginTop: 8
  },
  tabText: {
    marginLeft: 4,
    color: '#fff'
  }
})