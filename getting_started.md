This is an overview of how to get Transparency Toolkit setup for development
and testing. Mostly it links to the instructions for each individual
component.

## Basic Setup
This includes the basic setup procedure for LookingGlass.

1. Clone the DocManager repository
(https://github.com/TransparencyToolkit/DocManager)

2. Clone the LookingGlass repository
(https://github.com/TransparencyToolkit/LookingGlass)

3. Follow the instructions for setup/installation in the DocManager README.

4. Follow the instructions for setup/installation in the LookingGlass README.

5. Clone this repository.

6. Follow the instructions under "Using Test Datasets" for the JSON data type
in the README for this repository, including those that direct you to the
instructions for how to start DocManager and LookingGlass after ensuring they
are configured to work with your chosen test dataset.


## Additional Setup for Catalyst
This includes additional instructions for setting up Catalyst and is only
necessary if testing Catalyst specifically. They should be completed after
attempting steps 1-6 above.

7. Clone the Catalyst repository
(https://github.com/TransparencyToolkit/Catalyst)

8. Follow the instructions for setup/installation in the Catalyst README.

9. Start Catalyst following the instructions in the Catalyst README.

10. Run Catalyst by using an example script, such as by running:
cd sidtoday_test_set/catalyst_scripts/
ruby sidtoday_catalyst_script.rb
(if, for example, you are using the sidtoday test dataset)

11. Wait a minute and then reload LookingGlass to check that it worked

12. Now, you can customize this script to do more things, using any of the
methods outlined at
https://github.com/TransparencyToolkit/Catalyst/blob/master/db/seeds.rb. Please
note that any fields Catalyst has in the output_param_names need to be
specified in the DocManager data source spec for the data source and that some
methods require lists of terms or other parameters as input.
