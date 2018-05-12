This is an overview of the features that need to be added, or things that need
to be changed, for the following steps of the pipeline:
1. File upload
2. OCR server
3. DocManager
4. LookingGlass
5. Catalyst
6. UDP server and other bits connecting the parts

It does NOT include any features for the account/project management system or
for generating the read-only published archive. These are the next steps
after most of the below features are working. This list is also focused on
backend software features, and not frontend or server setup. However, features
or changes required for those things should be added to this list.


## DocManager

### Dataspec Updates
These are features needed to make dataspecs work more smoothly, particularly
with Catalyst. It includes changes on both DocManager and Catalyst.

- [x] Change to use Postgres instead of Mongo
- [x] Review and possibly refactor dataspec (source and project) storage. Ensure
these persist between boots, and are only created using flat file JSONs due to
convenience rather than necessity (because long term, they will be passed from
the account/project manager).
- [x] Function to automatically add/remove fields from dataspecs. Ensure that
this also adds/removes fields on existing data.
- [x] Change catalyst to use DocManager directly as backend (incl remove any
leftover indexing code from LG)
- [x] Make Catalyst add fields to DocManager as needed for its output
(including specifying the type of the field/adding that to the db!)

### Misc Changes

- [ ] Add authentication for Elastic and Postgres on DocManager
- [ ] Add DateTime data type
- [ ] Upgrade to Elastic 6/7 (update code to deal with lack of doc types)


## LookingGlass

### Field Changes
This includes changes on both LG and DocManager to ensure content in a
document can be edited on LG and show up on DM.

- [ ] Ensure UI for editable fields can be turned on/off and shows up for
specified field types (title, description, notes, categories, etc)
- [ ] LG should pass changes to text fields to DocManager
- [ ] DocManager function to update text fields
- [ ] LG should pass additions to category/array fields to DM
- [ ] DM should append additions to category/array fields to the data
- [ ] Document deletion

### Misc Changes

- [ ] Use project index param in URL to show correct project
- [ ] Similar document suggestions
- [x] Debug issue with embedded Document Cloud docs


## Upload Form

### Multiple Document Uploads
- [ ] Figure out how to handle multiple docs- probably dynamic form with "add
doc" and implement on upload form server
- [ ] Modify backend of OCR server to handle batches of docs


## OCR Server
Mostly, these features consist of adding support for various file
types. Support means both OCR capability and ability to view on LookingGlass.

### Add More File Types
- [x] Add support for image file formats such as png, jpg/jpeg, tiff, gif,
bmp, etc.
- [x] Add support for text files with and without .txt extension
- [x] Add support (and views) for html files
- [ ] Allow upload of other formats, but no OCR/download only. Differentiate
binary from txt
- [ ] Add OCR for office formats (doc, docx, ppt, pptx, xls, xlsx, etc)

### Compressed Files

- [ ] Decompress compressed files such as zip, tar, etc. Should first make a
list of compressed files, then write decompression functions.
- [ ] Handle compressed files individually- set each title automatically based
on name. But indicate archive they were contained in.
- [ ] Figure out how to adapt document count for compressed formats

### Email

- [ ] Convert a variety of email file formats to JSON: mbox, pst, eml, msg
- [ ] Extract email attachments and associate with correct email
- [ ] Automatically determine the datasource spec based on file format: For
most a general document type will work, but some formats like email need
their own doc type format
- [ ] Threaded views for email in LG and ensure attachments are indexed and
linked to correct mail

### Machine-Readable Formats

- [ ] Support uploading of CSV and JSONs with homogenous fields
- [ ] Generate data source spec from fields
- [ ] Add a function for creating data source spec on DocManager- also good
for the generation of specs in the project/account manager later on. Includes
associating the spec with the project.

### OCR Optimization
- [ ] Clean up image- increase DPI, change contrast, add more languages. to improve image/PDF OCR
- [ ] Detect if other OCR methods should be used/if it failed (incl spellcheck+language detection)
- [ ] Consider other OCR methods


## Catalyst

### Integration with LookingGlass

- [ ] Ensure Catalyst params specified in LG are sent to Catalyst, and that
the appropriate methods are run in response
- [ ] Test all Catalyst methods when connected to LookingGlass
- [ ] Save Catalyst filters in DB to run on incoming documents
- [ ] Allow edits and deletion of these methods saved in the DB. Rerun
Catalyst after they are changed

### Additional Features

- [ ] Built-in extraction lists on Catalyst such as countries
- [ ] Change the machine learning categorization method to infer tags on
untagged docs by using existing, user-added tags as training data


## UDP, Doc Count, Verification

- [ ] Review UDP and doc count setup
- [ ] Merge all UDP code into single server
- [ ] Retransmit lost files somehow
- [ ] Test in real conditions

