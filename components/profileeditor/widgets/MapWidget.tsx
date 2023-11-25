import React from 'react'
import { StyleSheet } from 'react-native'
import { Image } from 'expo-image';
import { View } from '../../Themed'
import AppImages from '../../../constants/Images';
import { ProfileInput } from '../elements/Input';
import { ActionButtons } from '../elements/ActionButtons';

function MapWidget() {
  return (
    <View
      style={styles.container}
    >
      <Image
        style={styles.mapImg}
        source={AppImages.mapTempImg}
      />
      <ProfileInput
        style={styles.profileInput}
        textContentType='URL'
        placeholder='住所'
      />
      <View
        style={styles.actionContainer}
      >
        <ActionButtons />
      </View>
    </View>
  )
}

export default MapWidget;

const styles = StyleSheet.create({
  container: {
  },
  mapImg: {
    width: 300,
    height: 160,
  },
  profileInput: {
    marginTop: 12,
    borderWidth: 1,
    fontSize: 14,
    paddingHorizontal: 8,
  },
  actionContainer: {
    marginTop: 8
  }
})