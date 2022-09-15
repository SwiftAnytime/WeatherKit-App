# Get started with WeatherKit

This year, we received a package of surprises from Apple at WWDC22. Out of these exciting announcements, we got a new framework entirely focused on fetching weather data to your app or website called "WeatherKit." We will go through the step-by-step process of importing this framework and covering its basic requirements and usage.

## Why use WeatherKit?

There are a bunch of reasons for using WeatherKit:
- Powered by Apple Weather Service.
- Easy to implement in your Xcode project, supports Swift syntax.
- It's customizable. 
- Comes with support of REST API for other platforms.
- It falls under Apple's commitment to privacy and only requires the user's location to provide weather forecasts without compromising personal information.
- Uses ML (Machine Learning) and algorithms to predict Weather.
- Gives access to six datasets, each having its different usage with a lot of data available.

## Requirements

In giving you access to an incredible set of data, Apple requires to meet the following requirements at least:
- **Apple Developer Program membership** You need one to register an App ID and enable WeatherKit.
- **Xcode 14** The WeatherKit Swift API requires iOS 16, iPadOS 16, macOS 13, tvOS 16, or watchOS 9 to run your app. The Xcode 14 satisfies this requirement, which is currently in beta.

### Pricing

The WeatherKit is undoubtedly a great framework, but its only usage is free to 500,000 API call requests per Apple Developer Program Membership. If you are considering building a Weather app or anything similar which requires more API calls, you may consider subscribing to one of the following plans:

- 500,000 calls/month: Included with membership
- 1 million calls/month: US$ 49.99
- 2 million calls/month: US$ 99.99
- 5 million calls/month: US$ 249.99
- 10 million calls/month: US$ 499.99
- 20 million calls/month: US$ 999.99

We believe that the service at this Pricing is decent compared to third-party Weather services.

## First things first

Before we create an Xcode project, let's register the app and turn on the WeatherKit capabilities and services from the Apple Developer account portal. In case you find yourself uncomfortable, we have got you covered with the instructions:

1. Sign in to developer.apple.com with your registered member account. 
2. Click on the specific section called **Certificates, Identifiers & Profiles** presented on the developer portal's side menu or welcome page.
3. Again, you will see several titles on the side menu. Click on **Identifiers** and then add a button with a plus symbol.
4. It will take you to the next step for registering a new identifier, and this time select **App ID**.
5. Later, you will be asked to select a type. Click on **app**.
6. Now, you will see some things requiring your entries and essential changes to make WeatherKit active. Fill out the required text details, scroll up till the end and click on the checkbox of WeatherKit under the **Capabilities** tab. Repeat the same for the **App Services** tab.
7. Click on **continue** and then **register** after verifying the details/entries you added. That's it.
8. Hooray! You are all set to create an Xcode project requiring a WeatherKit framework.

## Source files

We have a source code available for you to download to save some of your time. The link will take you to the GitHub Repository and contains an Xcode project with a User Interface built with SwiftUI.


## Setting up the Xcode project
The following steps are essential whether or not you tend to use the source files. Once you are done registering.


## Few lines of code & get the result

We need to request weather data through the WeatherKit framework. There is no better way to fetch weather results for an Xcode project targeting Apple platforms than using the framework. You can also use REST API to use it elsewhere. 

We are going to use the native framework. You'll first need to import `WeatherKit` and `CoreLocation`. 

Next, we will require to add a weather service object `WeatherService()`.

```swift
import WeatherKit
import CoreLocation
```

```swift
let weatherService = WeatherService()
```

As per your interested location, whether it may be your hometown or favorite spot, enter their coordinates to fetch weather results.

```swift
let sanFrancisco = CLLocation(latitude: 37.7749, longitude: longitude: 122.4194)
```

The SwiftAnytime team loves the Bay Area, so we have set our location to San Francisco. To make your search of coordinates easy, here is the link to the website:
[https://www.latlong.net/]

Now that we have a few lines of code allowing us to access weather data, we will call a weather service instance to pass the location.

```swift
let weather = try await service.weather(for: sanFrancisco)
```

```swift
func getWeather() async {
        
        do {
            
            let weather = try await service.weather(for: currentLocation)
            
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }       
```

If the call completes successfully, we can access the data from WeatherKit Swift API. From this sum of data, you can now provide information to users through your app. 

We are creating a model named **CurrentWeather** and inserting properties like `temperature`, ``condition` ,`symbolName`.

```swift
struct CurrentWeather {
    
    let temperature: Double
    let condition: String
    let symbolName: String

}
```

The beauty of the WeatherKit framework is that it fetches the data automatically. To include the fetched data, we must use the `currentWeather` class sampled with the **WeatherService**.

```swift
func getWeather() async {
        
        do {
            let weather = try await service.weather(for: currentLocation)
            
            self.currentWeather = CurrentWeather (
                temperature: weather.currentWeather.temperature.value,
                condition: weather.currentWeather.condition.rawValue,
                symbolName: weather.currentWeather.symbolName
            )
            
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }  
```

Try running your app with the code you wrote in a project we provided. Now, compare it with Apple's stock Weather app and award yourself a treat on this occasion.

```swift
import WeatherKit
import CoreLocation

public class WeatherViewModel: ObservableObject {

    let service = WeatherService()
    
    let currentLocation = CLLocation(latitude: 37.7749, longitude: 122.4194)

    func getWeather() async {
        
        do {
            
            let weather = try await service.weather(for: currentLocation)
            
            self.currentWeather = CurrentWeather(
                temperature: weather.currentWeather.temperature.value,
                condition: weather.currentWeather.condition.rawValue,
                symbolName: weather.currentWeather.symbolName
            )
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
}

struct CurrentWeather {
    
    let temperature: Double
    let condition: String
    let symbolName: String

}
```

We hope you enjoyed reading this article. 