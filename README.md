# react-native-doc-preview

A document previewer for react native.

## Installation

```sh
$ npm i --save react-native-doc-preview
$ react-native link react-native-doc-preview
```

## Usage

```js
import DocPreview from 'react-native-doc-preview';

export default class App extends Component<{}> {
  render() {
    return (
      <View style={styles.container}>
        <DocPreview
          style={styles.preview}
          filePath={resolveAssetSource(require('./assets/Instruments.pdf')).uri}
        />
      </View>
    );
  }
}
```
