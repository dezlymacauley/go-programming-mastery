# Go Programming Mastery Setup
_______________________________________________________________________________

Create the root directory
```sh
mkdir go-programming-mastery
```

Enter the root directory
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

Add this to the file
```gitignore
# Go dev tools (installed via go install)
go-dev-tools/
```
_______________________________________________________________________________

When you install Go tools using `go install`, 
the location where those binaries are installed is determined by the the
variable `$GOPATH`

You can check what this is set to by running this command:
```sh
echo $GOBIN
```

```
/home/dezlymacauley/.local/share/mise/installs/go/1.25.7/bin
```
_______________________________________________________________________________

I want my Go dev tools to be scoped to the project repository

```sh
mkdir -p go-dev-tools/bin/
```

Add this the end of to your `mise.toml` file:
```toml
[env]
GOBIN = "{{cwd}}/go-dev-tools/bin"
GOPLS_LSP_BIN = "{{cwd}}/go-dev-tools/bin/gopls"
```
_______________________________________________________________________________

Initialize the root of this repo:
```sh
go mod init go-programming-mastery
```

This will create a `go.mod` file for dependency tracking.
_______________________________________________________________________________

You can check what is the latest version of `gopls`

This is the language server for Go:
```
https://pkg.go.dev/golang.org/x/tools/gopls
```

Run this command to declare gopls as a development dependency 
and not a runtime dependency.

Tip: Don't forget the `v` before the version.
So its not `0.21.0`, its `v0.21.0`

```sh
go get -tool golang.org/x/tools/gopls@v0.21.0
```

Note: This will not install the executable binary.

_______________________________________________________________________________

Run this command and you should see a list of installed packages:
```sh
go list tool | xargs go list -m
```

You should see something like this:
```
golang.org/x/tools/gopls v0.21.0
```
_______________________________________________________________________________

Run this command to install the executable binary in the location specified 
by the `GOBIN` environment variable.

```sh
go install golang.org/x/tools/gopls@v0.21.0
```
_______________________________________________________________________________

```sh
mise trust
```

```sh
go mod tidy
```
_______________________________________________________________________________

### How to create a Go project inside this repo


_______________________________________________________________________________
