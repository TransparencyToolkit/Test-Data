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
- [ ] Update to elasticsearch 6/7


## LookingGlass

### Field Changes
This includes changes on both LG and DocManager to ensure content in a
document can be edited on LG and show up on DM.

- [x] Ensure UI for editable fields can be turned on/off and shows up for
specified field types (title, description, notes, categories, etc)
- [x] LG should pass changes to text fields to DocManager
- [x] DocManager function to update text fields
- [ ] LG should pass additions to category/array fields to DM
- [ ] DM should append additions to category/array fields to the data
- [ ] Make add new field to document API method accessible on LG (and document params)
- [ ] Ensure refresh after edit is handled in reasonable way

### Add/Delete Documents
- [ ] Document deletion
- [ ] Entity dataspecs (for manually added)- company, person, location, event, note
- [ ] Automatically have entities available in spec and create entity button
- [ ] Ensure entity creation forms save in Harvester
- [ ] Link back to document upload form (ensure correct instance) button (for uploaded docs)

### Misc Changes

- [ ] Use project index param in URL to show correct project
- [ ] Similar document suggestions
- [x] Debug issue with embedded Document Cloud docs


## Catalyst

### Integration with LookingGlass

- [x] Clean up and test all Catalyst methods
- [ ] Save Catalyst recipes and annotators in database
- [ ] API methods to save, edit, delete, rerun filters
- [ ] Make Catalyst API methods accessible to LG

### Additional Features

- [ ] Built-in extraction lists on Catalyst such as countries
- [ ] Change the machine learning categorization method to infer tags on
untagged docs by using existing, user-added tags as training data


## Upload Form

### Update Inter-App Communication
- [x] Add send document API to upload server
- [x] Add receive/send document API to OCRServer
- [x] Replace UDP server with TCP server that indexes on DocManager
- [x] Change doc_integrity_check to verify signatures

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
- [x] Allow upload of other formats, but no OCR/download only. Differentiate
binary from txt
- [x] Add OCR for office formats (doc, docx, ppt, pptx, xls, xlsx, etc)

### OCR Optimization

- [ ] Add support for ABBYY (including setup instructions)
- [ ] Flag on upload form to use ABBYY by default
- [ ] Otherwise, run when other methods fail
- [ ] Extract metadata for certain file types (optional)

### Compressed Files

- [ ] Decompress compressed files such as zip, tar, etc. Should first make a
list of compressed files, then write decompression functions.
- [ ] Handle compressed files individually- set each title automatically based
on name. But indicate archive they were contained in.

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
- [ ] Generate data source spec from fields (infer types)
- [ ] Function to create whole data source (not just field) on DocManager and associate with project
