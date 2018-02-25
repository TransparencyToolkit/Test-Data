This is a test data set for Transparency Toolkit's software. The goal of this
repository to build up a variety of test datasets over time, of varying sizes
and including many file formats, so that we can test our software in a variety
of circumstances. Some of these test datasets are subsets of documents from
our existing archives, and some are solely for testing purposes.

This repository is solely for testing the software we are developing. If you
want to download a copy of the data for one of our existing archives, these
are all available in full in their own git repositories.


## Test Dataset Structure

We offer the test data in three formats, depending on what parts of the
software pipeline need testing.

1. Raw Documents: Raw, un-OCRed documents. These can be used to test the full
pipeline, or the OCR component specifically. For testing specific components
further down the pipeline such as LookingGlass or Catalyst, it is probably
faster to use one of the other formats to avoid a possibly time-consuming OCR
process.

2. Text: The OCRed text of the documents. Adding this to the OCR server can
speed up tests of the full pipeline when the OCR software itself does not need
to be tested. This is because the OCR software checks if a document has been
OCRed already and, if so, uses the text from the previous run rather than
re-OCRing the document.

3. JSON: Fully processed JSON files for the document that can be imported
directly into DocManager for use with LookingGlass and Catalyst. This has the
document title, text, file path, and possibly description and other fields all
separated out into their own fields in a machine readable format. The JSON is
the best way to test later parts of the pipeline, but requires running an
additional input script.

In the case of documents that do not need to be OCRed (such as txt files, csv,
or email), we may only have two formats: the raw documents and JSON. In some
cases we may offer multiple JSON formats (some with Catalyst run over them
already, for example).



## Using Test Datasets

### Raw Documents

Upload them using the upload form or pass the path to the docs to the OCR
server (manually via a script) or Harvester (via the interface). Not
recommended until we have the upload form and OCR server fully working, unless
you are working on getting these working.


### Text Data

When testing the OCR server: put both the text and document directories on the
OCR server and pass the OCR server the path of the documents manually (via a
script or similar).

When testing the full pipeline: Put text and documents on OCR server, then
upload documents as in the raw documents instructions. Only suggested after
upload form and OCR server are fully working.


### JSON

This is the type of test data you should be using for now. Instructions-
1. Clone this repository and decide which test data you want to use

2. cd into the directory of the test data you want to use and check that there
is a ruby script for indexing (should end in '_index_script.rb')

3. Check that DocManager has an appropriate data source and project spec for
the indexing script. I've pre-created them in this case, but these are the
things that need to match up-

       a. Check that the index_name field from the script matches the
       index_name of a project spec json in DocManager/dataspec_files/projects/
       
       b. Check that the item_type field from the script matches the
       class_name field (under index_details) for a data source spec json in
       DocManager/dataspec_files/data_sources/
       
       c. In that same data source spec, change the "prefix" field (under
       the field for the files attached) to be the path to the directory with
       the files. Some test data sets have the prefix set to files on a
       webserver, in which case this doesn't need to be changed.

4. Start DocManager (following the instructions at
https://github.com/TransparencyToolkit/DocManager) and LookingGlass (following
the instructions at https://github.com/TransparencyToolkit/LookingGlass)

Pay special attention that the `PROJECT_INDEX` env variable in
LookingGlass/config/initializers/project_config.rb is set to be the index_name
from the indexing script (same value as step #3 part a)! This determines what
project LookingGlass shows, so if it is not correctly set it will show the
wrong project, which may not exist.

5. Run the script with ruby *_index_script.rb

6. Open LookingGlass. It may take a little bit for the documents to load, but
they should soon appear.



## Other Possibilities for Test Data

If you have a working Harvester setup, you can simply collect your own test
data, which should be automatically loaded into DocManager (and thus
accessible from LookingGlass and Catalyst immediately).
