import { Feather, Ionicons } from '@expo/vector-icons';
import { Image } from 'expo-image';
import { Pressable, StyleSheet, useColorScheme } from 'react-native';
import { TouchableOpacity } from 'react-native-gesture-handler';
import { SearchInput } from '../../components/SearchInput';

import { Text, View } from '../../components/Themed';
import Colors from '../../constants/Colors';
import { getDimention } from '../../utils/dimentions';

const { windowWidth, windowHeight } = getDimention()

export default function TabProfileScreen() {
  const colorScheme = useColorScheme();

  return (
    <View style={styles.container}>
      <View style={styles.pageContainer}>
        <Image style={styles.logo} source={require('../../assets/images/degime-logo.png')} />
        <Image style={[styles.profileBg, { width: windowWidth, height: windowHeight / 4 }]} source={require('../../assets/images/profile-bg.png')} />
        <View style={styles.profileContainer}>
          <View style={styles.avatarContainer}>
            <Image style={[styles.avatar]} source={require('../../assets/images/user-avatar.png')} />
            <Text style={{ fontWeight: 'bold' }}>はるこ</Text>
            <Text style={{ fontWeight: 'bold' }}>https://myprofile.co</Text>
          </View>
          <View style={styles.menuContainer}>
            <Pressable>
              <Feather name="menu" size={24} color="black" />
            </Pressable>
          </View>
        </View>
        <View style={styles.subContainer}>
          <SearchInput placeholder='検索' />
          <View style={{ marginTop: 40, flexDirection: 'column', gap: 8 }}>
            <TouchableOpacity style={styles.button}>
              <Text style={styles.buttonText}>オンライン名刺編集</Text>
              <Ionicons style={styles.buttonIcon} name="add-circle" size={26} color="black" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.button}>
              <Text style={styles.buttonText}>SNS向けリンクツリー</Text>
              <Ionicons style={styles.buttonIcon} name="add-circle" size={26} color="black" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.button}>
              <Text style={styles.buttonText}>ランディングページ</Text>
              <Ionicons style={styles.buttonIcon} name="add-circle" size={26} color="black" />
            </TouchableOpacity>
          </View>

          <View style={styles.smallButtonsContainer}>
            <TouchableOpacity style={[styles.smallButton, { backgroundColor:  Colors[colorScheme ?? 'light'].green1 }]}>
              <View style={styles.smallContainer}>
                <Text>チャット</Text>
                <Text style={[styles.badge, { backgroundColor: Colors[colorScheme ?? 'light'].orange1 }]}>5</Text>
              </View>
            </TouchableOpacity>
            <TouchableOpacity style={[styles.smallButton, { backgroundColor:  Colors[colorScheme ?? 'light'].orange1 }]}>
              <View style={styles.smallContainer}>
                <Text>degimeカードに書き込む</Text>
              </View>
            </TouchableOpacity>
            <TouchableOpacity style={[styles.smallButton, { backgroundColor:  Colors[colorScheme ?? 'light'].orange2 }]}>
              <View style={styles.smallContainer}>
                <Text>degimeカード購入する</Text>
              </View>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  pageContainer: {
    position: 'relative'
  },
  profileContainer: {
    zIndex: 10,
    position: 'relative',
  },
  logo: {
    width: 100,
    height: 100,
    zIndex: 1,
    position: 'absolute',
    left: 0,
    top: 0
  },
  profileBg: {
    width: 'auto'
  },
  avatarContainer: {
    alignItems: 'center',
    justifyContent: 'center',
    gap: 4
  },
  avatar: {
    width: 80,
    height: 80,
    zIndex: 100,
    marginTop: -30,
    borderRadius: 999
  },
  menuContainer: {
    justifyContent: 'flex-end',
    alignItems: 'flex-end',
    position: 'absolute',
    right: 8,
    top: 8
  },
  subContainer: {
    marginTop: 20,
    paddingLeft: 24,
    paddingRight: 24,
  },
  button: {
    backgroundColor: Colors.dark.primary,
    borderRadius: 8,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingTop: 12,
    paddingBottom: 12,
    position: 'relative'
  },
  buttonText: {
    color: 'white'
  },
  buttonIcon: {
    color: 'white',
    position: 'absolute',
    right: 8
  },
  smallButtonsContainer: {
    marginTop: 40,
    paddingLeft: windowWidth  / 8,
    paddingRight: windowWidth  / 8,
    flexDirection: 'column',
    gap: 8
  },
  smallContainer: {
    position: 'relative',
    backgroundColor: 'transparent',
  },
  smallButton: {
    borderRadius: 8,
    paddingTop: 8,
    paddingBottom: 8,
    flexDirection: 'row',
    justifyContent: 'center',
  },
  badge: {
    marginTop: 12,
    borderRadius: 999,
    paddingLeft: 4,
    paddingRight: 4,
    position: 'absolute',
    fontSize: 10,
    right: -20,
    bottom: -4
  }
});
