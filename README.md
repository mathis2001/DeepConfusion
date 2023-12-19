# DeepConfusion
Simple bash dependency confusion checker that parse package.json and requirements.txt files and check if npm or python packages are public or private by searching them in npm and pypi public registry.

## Prerequisites

- npm
- jq
- curl
  
## Install:
```bash
$ git clone https://github.com/mathis2001/DeepConfusion
$ cd DeepConfusion
$ chmod +x deepconfusion.sh
```

## Usage:
```bash
$ ./deepconfusion path/to/package.json or requirements.txt
```
## Screenshots

![image](https://github.com/mathis2001/DeepConfusion/assets/40497633/1407d924-b741-43b3-a970-50efc48dd6dd)
![image](https://github.com/mathis2001/DeepConfusion/assets/40497633/950eac0c-0457-4a13-8449-9e9f3c802221)


## Exploit (After finding a private module)

You can find the private packages found in the generated confusion.txt file, then:

- Check in the original package.json file if their is a ^ or a ~ before the version (if yes it is vulnerable)
- Take the package.json template prensent in the "ExploitFiles" directory.
- Replace the name by one of the packages found and preinstall value by your domain.
- Replace the version value by a latest than the private module.
- Publish it in the npm public registry.

Help: https://s1rn3tz.gitbook.io/notes/pentest-web/dependency-confusion

## To Do

- ~~Addisionnal validation for depreciated packages~~
- Remove of false positives like (name, version...)
- ~~Add requirements.txt check for python dependency confusion~~
