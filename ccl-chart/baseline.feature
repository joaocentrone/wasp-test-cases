Feature: Baseline of CCL Chart

    Test scenarios for the baseline on the CCL Chart

    Background: Well on WASP

        Given I'm on a well
        And the well has the baseline of CCL Chart
        When the devices are running
        Then the CCL Chart is shown
    
        Scenario: Changing wells

            Given I have a baseline of CCL Chart on the current well
            When I change the well I'm at
            Then the previous well's baseline is replaced by the new well's baseline

        escolhe passes

        pode limpar o ccl