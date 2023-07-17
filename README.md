# DeepConfusion
Simple bash dependency confusion checker that parse package.json files and check if npm packages are public or private by searching them in npm public registry.

## Prerequisites

- npm
- jq
  
## Install:
```bash
$ git clone https://github.com/mathis2001/DeepConfusion
$ cd DeepConfusion
$ chmod +x deepconfusion.sh
```

## Usage:
```bash
$ ./deepconfusion path/to/package.json
```
## Screenshots

![image](https://github.com/mathis2001/DeepConfusion/assets/40497633/1407d924-b741-43b3-a970-50efc48dd6dd)

## Exploit (After finding a private module)

- Take the package.json template
- Replace the name and preinstall value
- Replace the version value by a latest than the private module
- Publish it in the npm public registry

Help: https://s1rn3tz.gitbook.io/notes/pentest-web/dependency-confusion
