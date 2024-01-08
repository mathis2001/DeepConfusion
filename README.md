# DeepConfusion
Simple bash dependency confusion checker that parse package.json, requirements.txt and Gemfile files and check if npm, python or ruby packages are public or private by searching them in npm, pypi and rubygems public registry.

## Prerequisites

- npm
- jq
- curl
- awk
- sort
- sed
- tr
- cut
- xargs
- httpx
  
## Install:
```bash
$ git clone https://github.com/mathis2001/DeepConfusion
$ cd DeepConfusion
$ chmod +x deepconfusion.sh
```

## Usage:
```bash
$ ./deepconfusion path/to/package.json or requirements.txt or Gemfile
```
## Screenshots

![image](https://github.com/mathis2001/DeepConfusion/assets/40497633/1407d924-b741-43b3-a970-50efc48dd6dd)
![image](https://github.com/mathis2001/DeepConfusion/assets/40497633/950eac0c-0457-4a13-8449-9e9f3c802221)


## Exploit (After finding a private module)

### npm
You can find the private packages found in the generated confusion.txt file, then:

- Check in the original package.json file if their is a ^ or a ~ before the version (if yes it is vulnerable)
- Take the package.json template prensent in the "ExploitFiles" directory.
- Replace the name by one of the packages found and preinstall value by your domain.
- Replace the version value by a latest than the private module.
- Publish it in the npm public registry.

### Python

- If one of the packages give an error 404, it might be vulnerable to dependency confusion.
- Go to the "ExploitPy" repository and build the package.
  
```bash
$ python3 setup.py sdist bdist_wheel
```
- Upload the file in https://pypi.org.
  
```bash
$ twin upload dist/*
``` 

Help: https://s1rn3tz.gitbook.io/notes/pentest-web/dependency-confusion

### Ruby

- If one of the packages give an error 404, it might be vulnerable to dependency confusion.
- Create a new package.
    
```bash
$ bundle gem <package_name>
```
- Go to the created repository.
    
```bash
$ cd <package_name>
```
- Copy the .gem file from the ExploitGem repository in the newly created file and replace the needed information.

- Then go to the lib repository.
 
 ```bash
 $ cd lib
 ```
 - Replace the content of the .rb file with the one of the "ExploitGem" repository.
 
 - Go back to the main repository and build the package.
 ```bash
 $ cd ..
 $ gem build <package_name>.gemspec
 ```
- Upload file publicly on https://rubygems.org/
    
 ```bash
 $ gem push <package_name>-9.9.9.gem 
 ```

## To Do

- ~~Addisionnal validation for depreciated packages~~
- Remove of false positives like (name, version detected as packages...)
- ~~Add requirements.txt check for python dependency confusion~~
- ~~Add Gemfile check for ruby dependency confusion~~
