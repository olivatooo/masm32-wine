# masm32-wine

This is a simple shell script that compile, link and execute masm32 programs with ml.exe

### Dependencies

- Bash
- Wine (I'm using wine-3.13)
- Readability

## Installation

```
$ git clone https://github.com/olivatooo/masm32-wine
```
```
$ cd masm32-wine
$ sh masm32.sh program_name_without_dot_asm
$ profit???
```
## Important
* Place your
* programs under the folder `programs`
* Place all your libs and includes under `libs`
	* You need to create this folder and put your `libs` and `inc` here (like `Irvine32.inc`)
* Run `masm32.sh` without .asm extension
* There are a few examples in this project, you can read them to see how it works


