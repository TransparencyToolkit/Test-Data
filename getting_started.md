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
are configured to work with your chosen test dataset. If you want to upload
raw documents rather than index pre-provided JSON, continue to the next
section after starting LookingGlass and DocManager


## Doc Upload and OCR Setup
This includes setup instructions for the document upload form and OCR
server. Following these, in addition to those above, will enable you to
upload a document and view the OCRed output and document in LookingGlass.

7. Clone the respository for the document upload form
(https://github.com/TransparencyToolkit/DocUpload) on the server documents
will be uploaded on. Follow the setup instructions in the repository and start
the document upload form.

8. Clone the OCR server repository
(https://github.com/TransparencyToolkit/OCRServer) on the OCR server. Follow
the setup instructions in the repository and start the OCR server.

9. Clone the UDP server (https://github.com/TransparencyToolkit/UDPServer) on
the same server DocManager and LookingGlass are running on. Folow the setup
instructions in the README and start the UDP server.

10. Once everything is setup and running, go to
http://localhost:9292/upload/archive_test/ArchiveTestDoc and upload
documents. They should appear on LookingGlass lateron.


## Additional Setup for Catalyst
This includes additional instructions for setting up Catalyst and is only
necessary if testing Catalyst specifically. They should be completed after
attempting steps 1-6 above. If using pre-processed JSON test data, this can be
done without following steps 7-10. However, you may need to set the variable
in initializers/project_config.rb in LookingGlass to the appropriate index
name for the dataset.

11. Clone the Catalyst repository
(https://github.com/TransparencyToolkit/Catalyst)

12. Follow the instructions for setup/installation in the Catalyst README.

13. Start Catalyst following the instructions in the Catalyst README.

14. Run Catalyst by using an example script, such as by running:
cd sidtoday_test_set/catalyst_scripts/
ruby sidtoday_catalyst_script.rb
(if, for example, you are using the sidtoday test dataset)

15. Wait a minute and then reload LookingGlass to check that it worked

16. Now, you can customize this script to do more things, using any of the
methods outlined at
https://github.com/TransparencyToolkit/Catalyst/blob/master/db/seeds.rb. Please
note that any fields Catalyst has in the output_param_names need to be
specified in the DocManager data source spec for the data source and that some
methods require lists of terms or other parameters as input.
