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

- [x] User
- [x] Project/Archive


### Basic Archive Creation

- [x] Archive creation (form and save on account system)
- [x] Archive show page
- [x] Save archive settings on DocManager
- [x] Archive index page
- [x] Generate file with env var settings on create


### Basic User Creation

- [x] Figure out authentication system plan
- [x] Basic registration form/saving
- [x] Login/logout and access control on account system
- [x] Edit user settings (check permissions)


### Archive Permissions

- [x] On creation, user added to admin&access users
- [x] Users only see archives in list if they have access
- [x] Add user to access list option (only accessible for admins)


### Archive Access Control

- [x] Authentication works on upload form
- [x] Authentication works on LookingGlass


### Clean Up Communication Within Pipeline

- [x] Remove encryption of files on upload form, OCR server
- [x] OCR server only loads from flat files
- [x] Integrate IndexServer with DocManager- upload script check for new



## 2. Instance Management

This is the phase where the different instances of the software are setup to
be automatically created in VMs/containers and start/stop as they will in production.

### Initial Containerization Setup

- [ ] Generate VM/container using env variables specified
- [ ] Start all pipeline components automatically when VM/container starts
- [ ] Start/stop scripts for VM/container


### Integration of Container with ArchiveAdministrator

- [ ] Create a new container when archive created
- [ ] Ensure post to DocManager to create archive still works
- [ ] Track last visit to archive
- [ ] Stop archive container if not visited for a certain period of time
- [ ] Start archive container on link click if not already started
- [ ] Update URLs to archive components/preset URLs


### Updates and Deletion

- [ ] Deleting an archive also deletes archive container
- [ ] Deleting a user also deletes archives (where they are admin)
- [ ] Updating archive settings on ArchiveAdmin sends update to DM


### Automate Starting/Stopping OCR server

- [ ] Script to create OCR server VM
- [ ] Start OCR server when documents received
- [ ] Stop and destroy OCR server when it finishes processing


### Cleaning Up

- [ ] Refactor ArchiveAdministrator
- [ ] ArchiveAdministrator UI
- [ ] Review authentication system



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
