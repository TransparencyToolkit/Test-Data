This is an overview of the features that need to be added to create the
account system/system for managing the other components. They are divided into
phases:
1. Basic account system structure
2. Instance management
3. Publication and backup
4. Next steps


## 1. Basic Account System Structure

This is the core of the account system that allows the creating, reading,
editing, and deleting of users and projects/instances and the related
settings.

### Models
These are the different entities saved in the account system. The fields and
relations between these need to be determined and then they need to be create
(models and DB migrations).

- [ ] User
- [ ] Project/Archive

### Users

-[ ] Registration form and save registered users
-[ ] Show user details page
-[ ] Edit user settings (form and save)
-[ ] Delete user (button and delete in DB)
-[ ] When a user is created, create a DM instance/index server and save with user

### Projects/Archives
Everything about managing archives. The below assumes a shared DM setup, or
one per account which is handled at the user stage.

-[ ] Create new archive form (with fields same as project config json) 
-[ ] When new archive is created, save settings in DM
-[ ] When archive is created, start upload form for archive
-[ ] When archive is created, start LG for archive (with appropriate env vars)
-[ ] List of all archives user has access to (API method and page)
-[ ] Archive show page with settings, links to upload form+LG for instance
-[ ] Update archive (form, save on DM, and restart instances)
-[ ] Delete archive (button, on DM, and shutdown instances)

### Archive/Project Permissions
These allow adding multiple users with access to an archive and multiple
administrators.

-[ ] Add/remove users with access to archive
-[ ] Ensure that only users on access list can access
-[ ] Add/remove administrators archive
-[ ] Ensure that only administrators can change settings/add users

### Login System
This should work both on the account system as well as across apps.

-[ ] Basic login system (just for account system)
-[ ] Ensure that login system works on upload form
-[ ] Ensure that login system works on LG
-[ ] Ensure that backend- Catalyst, index server, DM only update data for archive with valid login



## 2. Instance Management

This is the phase where the different instances of the software are setup to
automatically start on servers as they will in production. This may mean
copying a VM or it may mean automating install.

At this stage the following needs to be determined-
* What runs on what server
* When new instances are started
* How new instances are created (copying a template vs. new install)
* Config files set for each instance (and how all set automatically) vs. account system
* Data passed from instance to instance
* Finalization of authentication settings

For each of the following applications-
* Upload form
* OCR server (and related such as Tika): May be per-batch of docs
* Index server
* Elasticsearch
* DocManager
* LookingGlass
* Catalyst (and related such as Stanford-NER)

This phase may also involve finishing the UI for the account system and making
small changes there.



## 3. Publication and Backup

This last phase enables users to create a separate, read-only instance of the
data and also covers automated backups (as some of the backend features may be
similar).

### Archive Publication
The creation of a read-only public archive. It involves the following
components:
* A button on each project/instance that allows admins to publish a read-only version
* Forms allowing the admin to choose what fields should be in the read-only version
* Backend for transmitting config files with selected fields to public server
* Backend for transmitting data (w/o history and unselected fields to public server)
* Settings so it is clear where the public read-only server is
* Management of instances on public server
* Setting the URL/domain for both private and public instances (including avoiding
name collisions)

### Backup
The data, raw documents, DM settings, and account system all need
backups. These should be automated to happen on a regular schedule and be
stored on other servers.



## 4. Next Steps
These are some things that would be nice to add in the future:
* Billing system
* Raw documents stored in distributed fashion
* Machine learning training system
* Hosted scraping
* Metadata cleaning

Plus, adding more filteypes (and better support for those we do have), adding
more text mining methods, and generally improving the components of the
pipeline that already exist.
