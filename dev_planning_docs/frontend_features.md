This is an overview of some of the features that need to be added and things
that need to be figured out for the frontend. This document does not cover the
account/project management system or read-only published archive version, but
is an attempt to create a comprehensive outline of what frontend changes are
needed on the following components-
1. File upload
2. LookingGlass
3. Catalyst


## Editing Fields on LookingGlass

We want the hosted archiving service to be useful for people who are trying to
build an archive of documents as a group, which means that there needs to be a
way to edit document fields directly on LookingGlass after upload. Certain
field types should be editable: Title, Description, Note, and Category
fields at least. We may also want to add support for adding URLs to a list of
links or similar.

Support for editing these fields likely includes some sort of Edit button, an
interface for changing the content, and a save button. The Category field
(often arrays of items/tags) or link fields maybe should have special forms that
nicely display those particular data types.

There needs to be a flag to turn all editing of fields off for the published
version.


## Catalyst Integration

This is the biggest, most complex frontend consideration for this component of
the project. We decided that we should have the Catalyst UI directly available
on LookingGlass, with people being able to add additional facets on the
sidebar. When people choose to add a facet by running Catalyst, these are the
types of input the UI needs to be able to accept/considerations for the UI-

* Catalyst has many methods ("annotators") that can be run to extract terms,
  entities, etc. There is a full list of those at
  https://github.com/TransparencyToolkit/Catalyst/blob/master/db/seeds.rb. The
  input form needs to allow users to choose which annotator to run.

* After the user chooses the annotator, they sometimes need to input parameters
  or settings. A form for each annotator should be generated. These could be
  dynamically generated based on the input parameters specified in the
  database, or manually generated templates.

* There is also the special case of extraction lists, where the user makes
  lists of terms to extract. There should be a way to easily add (or remove)
  terms to be extracted.

* Catalyst can run on one or more fields in the document. It only extracts
  things from or processes the text in fields it runs on. There should be a
  way for users to choose what fields Catalyst methods run on.

* Catalyst often generates another field as output (such as "countries
  mentioned" or "organizations mentioned"). Users should be able to
  choose the name of this field.

* It should be possible to edit or delete the parameters in Catalyst methods.

* There should be a button to manually rerun or delete the Catalyst methods
  set by the user.

All of the above could perhaps be incorporated into the LookingGlass sidebar
for fields that output a facet field. But there are also Catalyst functions
that may, say, extract all URLs from text and should output a different type
of field. So I'm not sure if those should be on the sidebar or elsewhere.


## Templates for Document Views

Most document types should work well with the current document view which
supports PDFs, images, text, download of files, etc. But some formats like
email may need specific templates. We have a nice flexible templating system
since the update last spring, so adding new templates that only apply to
certain document types should be easy. We probably need one for email (that
works with threading).


## Upload Form Frontend

There's a rough frontend for the document upload form, but it needs some
styling to make it look decent. We also should setup the form to allow
uploading of multiple documents (perhaps with an "add another document"
button).


## Handling Loading, Wait Time, and Data Changes

I'm not sure how best to handle these things, but sometimes there is a delay
when documents are being OCRed or processed by Catalyst. This wait time has
the potential to be confusing, and it is worth thinking about how we may
handle this from a UI perspective.

Similarly, we should ensure that the page refreshes after people edit data and
shows the most recent version with their changes.


## Future Considerations

This is something we don't need to think about too much for now, but it is
probably worth starting to consider what the UI for the project/account
manager app should look like. This will allow people to create new projects
and data sources, create accounts, view a list of their projects, etc.
