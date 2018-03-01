This is an outline of the server setup and automation considerations for the
first part of the project. It does not include the account/project management
system, read only published archives, or backups just yet. But this document
is an attempt to cover the setup needed for the full document upload, OCR,
indexing, search, and text mining pipeline.


## Automated Setup of Pipeline Components

We need to automate the setup of the following components-
* Upload form
* OCR server
* UDP server
* DocManager
* LookingGlass
* Catalyst

We need to be able to start these applications, as well as the databases and
other programs they depend on, automatically and easily.

In some of these cases, there may need to be environment variables set or
other configuration done. Some of this configuration is temporary and will be
reduced with changes to how dataspecs are manaaged. Some things need to be
manually configured now, but will eventually be sent from the account
management system. But there are some things, such as the PGP key ID data
should be encrypted to when sent between apps, that always will need to be set
at a server level.


## Server Setup

In addition to automatically installing, configuring, and starting each
application, we need to figure out how the servers should be setup, and
possibly automate parts of this process. Security concerns and managing the
secure but reliable communication between servers are the main issues here.

We decided to have the following servers-
1. Account/project management server. This may be the same server as
LookingGlass, DocManager, and Catalyst run on.
2. Document upload server
3. OCR Server: Only one-way communication
4. Read-only publicaton server (running LookingGlass and DocManager)
5. Backup server


## Document Count, UDP Data Transfers, and Verification of Receipt

We need to refine and test the document count and verification setup. We
should also test the transfer of data over UDP in real conditions and figure
out how we can transmit data reliably, but one-way.


## Application and Document Isolation

Each application in the pipeline can support multiple projects at once on a
single instance. But should it on the hosted archiving service? We need to
decide when a new instance of each component should be started. Should a new
instance be started per organization, per project, per batch of documents, per
document, or only once? The answer may be different for each component. Once
we've figured this out, we need an easy way to automate starting instances
when appropriate.

We also need to figure out where the document files themselves should be
stored, and how they should be containerized (if at all). Currently the
document files are stored in the following locations-
* Temporarily on the file upload server, and deleted when sent
* On the OCR server. These aren't deleted after being sent, but could be.
* On the DocManager/LookingGlass server, by the UDP server program. This is the
version of the files that is viewable on LookingGlass. The raw documents need
to be stored somewhere so they are viewable, but we could move them (even to
another server if needed).


## Future Considerations

These aren't the main things we need to consider now, but are worth thinking
about-
* Specs for servers we need to get, and any likely performance issues
* Backup system architecture and any changes to the application this will
require
* Authentication options for the account management system

