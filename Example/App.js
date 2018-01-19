/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View
} from 'react-native';
import resolveAssetSource from 'react-native/Libraries/Image/resolveAssetSource';

import DocPreview from 'react-native-doc-preview';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    marginVertical: 40
  },
  preview: {
    flex: 1,
    width: '100%'
  },
});

export default class App extends Component<{}> {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <DocPreview
          style={styles.preview}
          filePath={resolveAssetSource(require('./assets/Instruments.pdf')).uri}
        />
      </View>
    );
  }
}
