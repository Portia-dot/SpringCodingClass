StudyTimer iOS App

StudyTimer is an iOS app built using SwiftUI, which helps users set up custom study timers. The app features a visually appealing countdown timer with a progress ring and a knob for a better user experience.
Features

    Customizable study timer duration in hours, minutes, and seconds
    Visually appealing timer ring with progress indication
    Start, stop, and reset timer functionality
    Context menus for easy time selection
    Dark mode support
    Alert notifications upon timer completion

How to use

    Launch the StudyTimer app.
    Use the "Add New Timer" button to configure the timer duration in hours, minutes, and seconds.
    Tap the "Save" button to set the timer.
    Press the timer button to start the countdown.
    Tap the timer button again to stop the timer if needed.
    Upon completion, the app will display an alert with options to start a new timer or close the alert.

Main Components
Home.swift

Home.swift contains the main view of the app, which includes the timer ring, the start/stop button, and the timer settings. The view is connected to the TimerModel environment object to manage the timer state and user interactions.
TimerModel.swift

TimerModel.swift is a SwiftUI ObservableObject that manages the timer state, user interactions, and timer updates.
Preview

To preview the app, use Home_Previews in the Home.swift file. This will allow you to see how the app looks and functions within Xcode's Preview feature.
Notes

    Make sure to set up the necessary permissions for notifications if you plan to use alert notifications upon timer completion.
    Feel free to customize the color scheme and design elements to match your preferences.
