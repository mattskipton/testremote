# lab-repo-template
Template for all resources related to a platform lab in the atc

## Repository Structure

The repository holds all the files related to a platform lab.  

The initial contents are as follows:

- ansible - keep ansible scripts here
- as-built - place as-built documentation for the lab in this director
- collections - used by ansible
- labdocs - directory for lab user guides
- roles - used by ansible
- terraform - directory for terraform plans to be spun up during lab launch
- Codeowners - do not edit, used by the CI/CD process
- Jenkinsfile.labdoc - do not edit, symlink used by the CI/CD process
- License - GNU Public License
- NOTICE - WWT Property Statement
- README.MD - this file
- ansible.cfg - used by ansible
- metadata.yml - optional file used for cataloging repositories

The ansible, collections, roles, and terraform directories are used with ansible and terraform automation tools respectively.  Their use is optional.
