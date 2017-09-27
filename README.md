# React Native Segment SDK

Updates the existing React Native Analytics project with support for Alias API.

Originally written by Tal Kain <tal@kain.net>, Tony Xiao <tonyx.ca@gmail.com> and other contributors.

Based on Segment (https://segment.com) Analytics project.
See [iOS SDK](https://github.com/segmentio/analytics-ios) and [Android SDK](https://github.com/segmentio/analytics-android).


## iOS Installation
1. Download and install the npm package by running `npm install --save react-native-segment-sdk`.
2. In your Podfile, add `pod "Analytics"` to your project.
3. Inside Xcode (make sure you've opened your `.xcworkspace` file), go to the project navigator and right click `Libraries` -> `Add Files to [your project's name]`.
4. Go to `node_modules/react-native-segment-sdk/ios` -> and add `RNSegmentIOAnalytics.h` and `RNSegmentIOAnalytics.m` to your project.
5. Make sure your project links to *libAnalytics.a* (The libraries should be listed under "Build Phases -> Link Binary With Libraries". Should happen automatically if you use cocoapods).

## Android Installation
1. Download and install the npm package by running `npm install --save react-native-segment-sdk`.
2. If using [rnpm](https://github.com/rnpm/rnpm), run `rnpm link`. Otherwise add to `android/app/src/main/java/com/<your-app-name>/MainActivity.java`:

```java
import com.facebook.react.ReactPackage;
import com.smore.RNSegmentIOAnalytics.RNSegmentIOAnalyticsPackage; // <-- add this
...

      return Arrays.<ReactPackage>asList(
        new MainReactPackage(),
        new RNSegmentIOAnalyticsPackage(), // <-- add this
        ...
      );
```

## Usage sample
```javascript
import Analytics from 'react-native-segment-sdk'

const segmentIOWriteKey = "SEGMENT_IO_WRITE_KEY"
const flushEverySecondsCount = 1
Analytics.setup(segmentIOWriteKey, flushEverySecondsCount)
Analytics.identify("abc123", {"email":"john.smith@aol.com"})
Analytics.alias("abc123")
Analytics.track("Item Purchased", {"item":"Sword of Heracles", "revenue":2.95})
Analytics.screen("Photo Feed", {"Feed Type":"private"})
Analytics.flush()
Analytics.reset()
```

## Documentation
https://segment.com/docs/libraries/ios/#getting-started
https://segment.com/docs/libraries/android/#getting-started

## Handling possible issues
### Google SDK BitCode issue
```
ld: '......./Pods/GoogleIDFASupport/Libraries/libAdIdAccessLibrary.a(TAGActualAdIdAccess.o)' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), obtain an updated library from the vendor, or disable bitcode for this target. for architecture arm64
```
There are instructions for fixing it here: https://stackoverflow.com/questions/31395260/google-analytics-libadidaccess-a-does-not-contain-bitcode

## License

This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).
