Feature: Depth Chart

    Test scenarios for Depth Charts

    Background: Well on WASP

        Given I'm on a well
        And the well has a Deviation Chart
        When the devices are running
        Then the Depth Chart is shown

        Scenario: Depth Chart on a run

            Given the devices are running
            When the Depth value is received properly
            Then the Depth Chart shows depth value
            And the Depth Chart shows well's deviation
            And the Depth Chart shows a red dot on the deviation line
            And the red dot moves on the deviation line based on depth position
        
        Scenario: Depth Chart with a negative depth value

            Given the devices are running
            When the Depth value is received properly
            And the Depth value is negative
            Then the Depth Chart shows depth value
            And the Depth Chart shows well's deviation
            And the Depth Chart shows a red dot on the deviation line
            But the red dot won't move from the upper end of the deviation line while Depth is negative

        Scenario: Depth Chart without devices running
    
            Given the devices are not running
            When the Depth Chart has no Depth value
            Then the Depth Chart shows depth value as "-"
            And the Depth Chart shows well's deviation
            But the Depth Chart doesn't show the red dot on the deviation line

        Scenario: Depth Chart changing deviation

            Given the Depth Chart is illustrating the deviation
            When I change the Deviation Chart of the well on Orbit
            Then the Depth Chart changes the illustration of the deviation properly

        Scenario: Depth Chart without deviation

            Given I'm on a well with a Deviation Chart
            When I change to a well without deviation
            Then the Depth Chart shows the Depth value of new well
            But the Depth Chart doesn't show any illustration

            