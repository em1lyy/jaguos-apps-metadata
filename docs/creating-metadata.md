# Creating metadata for an application
### File structure
Application metadata is stored in the `applications` directory.  
Every application has its own folder. The name of the folder is a unique ID.  
It must contain only ASCII characters, dots, hyphens and numbers.  
Spaces are not allowed.  
The `template` application can be used as a starting point.
  
Every application requires:
* `metadata.conf` (Explained in the template)
* `icon.png` (Application's icon that is PNG or SVG and exactly 64x64, if you don't include this file, the Theme Icon is forced.)
* `screenshot-0.jpg` (Screenshot of the application. More can be added by incrementing the number)
  
These optional scripts can also be included:
* `postinstall.sh` (executed after installation)
* `postremove.sh` (executed after removal)

### Adding Apps via script
This repository includes a file called `add-app.sh`.
If you don't want to create all the files manually,
just run it, provide the information needed and
voila! You're done!
