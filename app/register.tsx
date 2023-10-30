import { useState } from 'react';
import { StyleSheet, TouchableOpacity } from 'react-native';
import { router } from 'expo-router';
import { Image } from 'expo-image';
import { Entypo, MaterialCommunityIcons, SimpleLineIcons, Fontisto, Feather } from '@expo/vector-icons';

import { Text, View } from '../components/Themed';
import { InputGroup } from '../components/InputGroup';
import { Button } from '../components/Button';
import AppImages from '../constants/Images';

export default function RegisterScreen() {
  const [isShowPasswordPreview, setIsShowPasswordPreview] = useState(false)

  const handleOnPressViewPassword = () => {
    setIsShowPasswordPreview(p => !p)
  }

  const handleOnPressRegister = () => {
    router.replace('/home')
  }

  return (
    <View style={styles.container}>
      <Image style={styles.logo} source={AppImages.degimeLogo} />
      <View style={styles.pageContainer}>
        <View style={styles.inputGroup}>
          <Text style={styles.title}>新規登録</Text>
          <Text style={styles.registerMessage}>すでに登録済みの方は、こちらからログインできます</Text>
          <InputGroup
            title='Eメール'
            keyboardType='email-address'
            leftIcon={<Fontisto name="email" size={20} color="black" />}
            placeholder='メールアドレスを入力してください'
          />
          <InputGroup
            title='ユーザー名(半角英数字４文字以上)'
            keyboardType='default'
            leftIcon={<Feather name="user" size={24} style={{ marginLeft: -2 }} color="black" />}
            placeholder='ユーザー名を入力してください'
          />
          {/* password */}
          <InputGroup
            title='パスワード'
            leftIcon={<SimpleLineIcons name="lock" size={20} color="black" />}
            secureTextEntry={isShowPasswordPreview}
            rightIcon={isShowPasswordPreview ? <MaterialCommunityIcons name="eye-off" size={24} color="black" /> : <Entypo name="eye" size={20} color="black" />}
            onPressRightIcon={handleOnPressViewPassword}
            placeholder='半角英数字６文字以上'
          />
          <InputGroup
            title='パスワードを再入力してください'
            leftIcon={<SimpleLineIcons name="lock" size={20} color="black" />}
            secureTextEntry={isShowPasswordPreview}
            rightIcon={isShowPasswordPreview ? <MaterialCommunityIcons name="eye-off" size={24} color="black" /> : <Entypo name="eye" size={20} color="black" />}
            onPressRightIcon={handleOnPressViewPassword}
            placeholder='パスワード再入力'
          />
          <Button color='white' bgColor='primary' text='新規登録' onPress={handleOnPressRegister} />
        </View>
        <View style={styles.socialIconGroup}>
          <TouchableOpacity>
            <Image style={styles.socialIcon} source={AppImages.facebookIcon} />
          </TouchableOpacity>
          <TouchableOpacity>
            <Image style={styles.socialIcon} source={AppImages.appleIcon} />
          </TouchableOpacity>
          <TouchableOpacity>
            <Image style={styles.socialIcon} source={AppImages.googleIcon} />
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
});
