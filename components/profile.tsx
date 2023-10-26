import { Feather, Ionicons } from '@expo/vector-icons';
import { Image } from 'expo-image';
import { router } from 'expo-router';
import { useState } from 'react';
import { Pressable, SafeAreaView, StyleSheet, useColorScheme, TouchableOpacity } from 'react-native';
import { AppModal } from './Modal';
import { SearchInput } from './SearchInput';

import { Text, View } from './Themed';
import Colors from '../constants/Colors';
import AppImages from '../constants/Images';
import { getDimention } from '../utils/dimentions';

const { windowWidth, windowHeight } = getDimention()

export default function ProfileScreen() {
  const colorScheme = useColorScheme();
  const [warningModalVisible, setWarningModalVisible] = useState(false);
  const [searchString, setSearchString] = useState('');

  const handleOnPressOnlineBusinessCard = () => {
    setWarningModalVisible(true)
  }

  const handleWarningModalOnRequestClose = () => {
    setWarningModalVisible(false)
  }

  const handleOnPressReturn = () => {
    setWarningModalVisible(false)
  }

  const handleOnChangeSearchText = (_text: string) => {
    setSearchString(_text)
  }

  const handleOnPressSnsProfile = () => {
    router.replace('/profileeditor')
  }
  const handleOnPressLandingPage = () => {
    router.replace('/savedprofiles')
  }
  const handleOnPressLogo = () => {
    router.replace('/home')
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.pageContainer}>
        <TouchableOpacity
          style={styles.logoContainer}
          onPress={handleOnPressLogo}
        >
          <Image style={styles.logo} source={AppImages.degimeLogo} />
        </TouchableOpacity>
        <Image style={[styles.profileBg, { width: windowWidth, height: windowHeight / 4 }]} source={AppImages.profileBg} />
        <View style={styles.profileContainer}>
          <View style={styles.avatarContainer}>
            <Image style={[styles.avatar]} source={AppImages.userAvatar} />
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
          <SearchInput placeholder='検索'
            onChangeText={handleOnChangeSearchText}
            value={searchString}
            onPressClose={() => handleOnChangeSearchText('')}
          />
          <View style={{ marginTop: 40, flexDirection: 'column', gap: 8 }}>
            <TouchableOpacity style={styles.button}
              onPress={handleOnPressOnlineBusinessCard}
            >
              <Text style={styles.buttonText}>オンライン名刺編集</Text>
              <Ionicons style={styles.buttonIcon} name="add-circle" size={26} color="black" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.button}
              onPress={handleOnPressSnsProfile}
            >
              <Text style={styles.buttonText}>SNS向けリンクツリー</Text>
              <Ionicons style={styles.buttonIcon} name="add-circle" size={26} color="black" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.button}
              onPress={handleOnPressLandingPage}
            >
              <Text style={styles.buttonText}>ランディングページ</Text>
              <Ionicons style={styles.buttonIcon} name="add-circle" size={26} color="black" />
            </TouchableOpacity>
          </View>

          <View style={styles.smallButtonsContainer}>
            <TouchableOpacity style={[styles.smallButton, { backgroundColor: Colors[colorScheme ?? 'light'].green1 }]}>
              <View style={styles.smallContainer}>
                <Text
                  style={styles.smallButtonText}
                >チャット</Text>
                <Text style={[styles.badge, { backgroundColor: Colors[colorScheme ?? 'light'].orange1 }]}>5</Text>
              </View>
            </TouchableOpacity>
            <TouchableOpacity style={[styles.smallButton, { backgroundColor: Colors[colorScheme ?? 'light'].orange1 }]}>
              <View style={styles.smallContainer}>
                <Text
                  style={styles.smallButtonText}
                >degimeカードに書き込む</Text>
              </View>
            </TouchableOpacity>
            <TouchableOpacity style={[styles.smallButton, { backgroundColor: Colors[colorScheme ?? 'light'].orange2 }]}>
              <View style={styles.smallContainer}>
                <Text
                  style={styles.smallButtonText}
                >degimeカード購入する</Text>
              </View>
            </TouchableOpacity>
          </View>
        </View>
      </View>
      <AppModal isVisible={warningModalVisible} onRequestClose={handleWarningModalOnRequestClose}>
        <Text
          style={modalStyles.modalHeaderText}
        >書き込むURLがありません。ページの   作成をお願いします。</Text>
        <View
          style={modalStyles.modalContainer}
        >
          <TouchableOpacity
            style={[modalStyles.modalButton, { backgroundColor: Colors[colorScheme ?? 'light'].green1 }]}
            onPress={handleOnPressReturn}
          >
            <Text
              style={modalStyles.modalButtonText}
            >戻る</Text>
          </TouchableOpacity>
        </View>
      </AppModal>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  pageContainer: {
    position: 'relative',
    height: windowHeight,
  },
  profileContainer: {
    zIndex: 10,
    position: 'relative',
  },
  logoContainer: {
    top: 0,
    left: 0,
    position: 'absolute',
    zIndex: 1,
  },
  logo: {
    width: 100,
    height: 100,
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
    paddingLeft: windowWidth / 8,
    paddingRight: windowWidth / 8,
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
  smallButtonText: {
    color: '#fff'
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
  },
});


const modalStyles = StyleSheet.create({
  modalContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
  },
  modalButton: {
    borderRadius: 8,
    marginTop: 20,
    paddingTop: 8,
    paddingBottom: 8,
    width: 78,
  },
  modalButtonText: {
    color: '#fff',
    textAlign: 'center',
  },
  modalHeaderText: {
    textAlign: 'center',
    fontWeight: '700',
    fontSize: 16
  }
})