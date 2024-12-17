Feature: Header notification bar

    Test scenarios for the notification bar on the Header

    Background: Being on WASP

        Given I'm on WASP
        When the devices are running
        Then the Main Chart shows the data

    Scenario: Notification bar has no notifications

        Given I don't have any running devices
        When no notifications were received
        Then the message "No new notifications" is shown

    Scenario: Notification bar didn't have a notification and gets a new notification

        Given I'm running the devices
        And the notification bar has the message "No new notifications"
        When a new notification is generated
        Then the new notification is read out loud
        And this notification is shown in the notification bar
        And this notification's time and date show properly

    Scenario: Notification bar had a notification and a new notification is generated

        Given I'm running the devices
        And the notification bar has a notification "x"
        When it is generated a new notification "y"
        Then the notification "y" is read out loud
        And the notification "y" is shown in the notification bar
        And the "y" notification's time and date show properly

    Scenario: A repeated notification is generated under the limit time

        Given I'm running the devices
        And the notification bar has a notification "x"
        When it is generated a new notification "x"
        And the time between the old notification "x"  and the new notification "x" is under the limit time
        Then the new notification "x" must be created
        But it won't show in the notification bar

    Scenario: A repeated notification is generated after the limit time

        Given I'm running the devices
        And the notification bar has a notification "x"
        When it is generated a new notification "x"
        And the time between the old notification "x" and the new notification "x" is over the limit time
        Then the new notification "x" must be shown with its new date and time

    Scenario: "Max Speed Limit" notification

        Given I'm running the devices
        When the Direction is U
        And the Depth is > 480 (Canada) or 1550 (USA)
        And the Speed is > 600 (Canada) or 2000 (USA)
        Then the notification "Max Speed Limit" is read out loud
        And the notification "Max Speed Limit" is shown in the notification bar
        And the "Max Speed Limit" notification's time and date show properly

    Scenario: "Adhere to Speed Limit" notification

        Given I'm running the devices
        When the Direction is U
        And the Depth is between 15 and 70 (Canada) or 50 and 231 (USA)
        And the Speed is > 75 (Canada) or 248 (USA)
        Then the notification "Adhere to Speed Limit" is read out loud
        And the notification "Adhere to Speed Limit" is shown in the notification bar
        And the "Adhere to Speed Limit" notification's time and date show properly

    Scenario: "Surface Speed Limit" notification

        Given I'm running the devices
        When the Direction is U
        And the Depth is < 15 (Canada) or 50 (USA)
        And the Speed is > 10 (Canada) or 34 (USA)
        Then the notification "Surface Speed Limit" is read out loud
        And the notification "Surface Speed Limit" is shown in the notification bar
        And the "Surface Speed Limit" notification's time and date show properly

    Scenario: "Depth Alarm" notification

        Given I'm running the devices
        When the difference between the Benchmark Depth and the Warrior Depth is greater than "X" (X being the value setted in settings)
        Then WASP emits an audible alarm
        And "Depth doesn't match" is read out loud
        And the notification "Depth Alarm" is shown in the notification bar
        And the "Depth Alarm" notification's time and date show properly
        And a scatter is generated on the Main Chart properly

    Scenario: "X Ft to the Pumpout" notification

        Given I'm running the devices
        When the Depth is "X" Ft to reach Pumpout Depth (X being the value setted in settings)
        Then the notification "X Ft to the Pump Out" is read out loud
        And the notification "X Ft to the Pump Out" is shown in the notification bar
        And the "X Ft to the Pump Out" notification's time and date show properly

    Scenario: "Did not reach the Pumpout" notification

        Given I'm running the devices
        And the gun is "X" Ft to the Pumpout Depth (X being the value setted in settings)
        When the gun is stopped before reaching the Pumpout
        Then the notification "Did not reach the Pumpout" is read out loud
        And the notification "Did not reach the Pumpout" is shown in the notification bar
        And the "Did not reach the Pumpout" notification's time and date show properly

    Scenario: "Did not stop at the Pumpout" notification

        Given I'm running the devices
        When the Depth reaches the Pumpout Depth
        And the gun keeps going down
        Then the notification "Did not stop at the Pumpout" is read out loud
        And the notification "Did not reach the Pumpout" is shown in the notification bar
        And the "Did not reach the Pumpout" notification's time and date show properly

    Scenario: "You reached the Pumpout Depth" notification

        Given I'm running the devices
        And the Depth reaches the Pumpout Depth
        When the gun is stopped at the Pumpout Depth
        Then the notificaiton "You reached the Pumpout Depth" is read out loud
        And the notificaiton "You reached the Pumpout Depth" is shown in the notification bar
        And the "You reached the Pumpout Depth" notification's time and date show properly

