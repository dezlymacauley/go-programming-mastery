# Go Programming Mastery Setup
_______________________________________________________________________________

Create a directory for the workspace
```sh
mkdir go-programming-mastery
```

Enter the directory
```sh
cd go-programming-mastery
```
_______________________________________________________________________________

Use mise to check which versions of Go are available
```sh
mise ls-remote go
```

Use this command if you just want to check what is the latest version of Go 
```sh
mise latest go
```

This is how to set a specific version of Go in your project
```sh
mise use go@1.25.7
```
_______________________________________________________________________________

You should have a `mise.toml` file that looks like this:

```toml
[tools]
go = "1.25.7"
```
_______________________________________________________________________________

### Create a `.gitignore` file

```sh
touch .gitignore
```
_______________________________________________________________________________

### How to add a Go project to the repo

```sh
mkdir name-of-project
```

Initialize the project
```sh
go mod init name-of-project
```

This will create a `go.mod` file that contains the version of Go that was
used to initialize the project.

The convention in Go is to use the GitHub url where you intend to save
your project. It's fine if you have not created this repo on GitHub yet,
or don't have a GitHub account created yet.

_______________________________________________________________________________

```sh
touch main.go
```
_______________________________________________________________________________

Add this to the main.go file
```go
package main

import "fmt"

func main() {
	fmt.Println("Go Programming Mastery")
}
```
_______________________________________________________________________________

### Run your program

To run your program use this command:
```sh
go run .
```
_______________________________________________________________________________
