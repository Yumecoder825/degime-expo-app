import { useState } from 'react';
import { StyleSheet, TouchableOpacity } from 'react-native';
import { Image } from 'expo-image';
import { Entypo, MaterialCommunityIcons, SimpleLineIcons, Fontisto } from '@expo/vector-icons';
import { Pressable } from 'react-native';
import { Link, router } from 'expo-router';

import { Text, View } from '../components/Themed';
import { InputGroup } from '../components/InputGroup';
import { Button } from '../components/Button';

export default function LoginScreen() {
  const [isShowPasswordPreview, setIsShowPasswordPreview] = useState(false)

  const handleOnPressViewPassword = () => {
    setIsShowPasswordPreview(p => !p)
  }
  const handleOnPressLogin = () => {
    router.replace('/(tabs)')
  }

  return (
    <View style={styles.container}>
      <Image style={styles.logo} source={require('../assets/images/degime-logo.png')} />
      <View style={styles.pageContainer}>
        <View style={styles.inputGroup}>
          <Text style={styles.title}>ログイン</Text>
          <Link href="/register" asChild>
            <Pressable>
              <Text style={styles.registerMessage}>アカウント登録がお済みでない方は、こちらから新規登録できます</Text>
            </Pressable>
          </Link>
          <InputGroup
            title='Eメール'
            keyboardType='email-address'
            leftIcon={<Fontisto name="email" size={20} color="black" />}
            placeholder='ユーザー名かメールアドレスを入力してください'
          />
          <View>
            <InputGroup
              title='パスワード'
              leftIcon={<SimpleLineIcons name="lock" size={20} color="black" />}
              secureTextEntry={isShowPasswordPreview}
              rightIcon={isShowPasswordPreview ? <MaterialCommunityIcons name="eye-off" size={24} color="black" /> : <Entypo name="eye" size={20} color="black" />}
              onPressRightIcon={handleOnPressViewPassword}
              placeholder='パスワードを入力してください'
            />
            <View style={styles.forgotPasswordButton}>
              <TouchableOpacity>
                <Text>パスワードを忘れた</Text>
              </TouchableOpacity>
            </View>
          </View>
          <Button color='white' bgColor='primary' text='ログイン' onPress={handleOnPressLogin} />
        </View>
        <View style={styles.socialIconGroup}>
          <TouchableOpacity>
            <Image style={styles.socialIcon} source={require('../assets/images/facebook-icon.png')} />
          </TouchableOpacity>
          <TouchableOpacity>
            <Image style={styles.socialIcon} source={require('../assets/images/apple-icon.png')} />
          </TouchableOpacity>
          <TouchableOpacity>
            <Image style={styles.socialIcon} source={require('../assets/images/google-icon.png')} />
          </TouchableOpacity>
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
    marginTop: -30,
    paddingLeft: 12,
    paddingRight: 12,
  },
  inputGroup: {
    flexDirection: 'column',
    gap: 50
  },
  logo: {
    width: 100,
    height: 100,
    zIndex: 1
  },
  title: {
    textAlign: 'center',
    fontSize: 20,
    fontWeight: 'bold'
  },
  registerMessage: {
    fontWeight: 'bold'
  },
  socialIconGroup: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'center',
    gap: 10,
    padding: 20,
  },
  socialIcon: {
    width: 30,
    height: 30,
    borderRadius: 999,
  },
  forgotPasswordButton: {
    alignItems: 'flex-end',
    marginTop: 12,
    paddingRight: 30
  }
});
