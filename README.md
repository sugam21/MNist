## Running in Collab
here goes how to run in collab.

## Running Locally
### Install Python and poetry
#### Using conda
This command will download programs specified in `environment.yml` and also creates a virtual environment.
```shell
make conda-update
```
#### Using asdf
Install asdf from website <br>
https://asdf-vm.com/guide/getting-started.html
This command will install packages from `.tool-versions`.
```shell
make asdf
```
### Creating a virtual env
```shell
make poetry
```