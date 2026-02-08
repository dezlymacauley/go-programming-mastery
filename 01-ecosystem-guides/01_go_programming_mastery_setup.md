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

When you install Go tools using `go install`, 
the location where those binaries are installed is determined by the the
variables `GOPATH` and  `GOBIN`

_______________________________________________________________________________

I want my Go dev tools to be scoped to the project repository

```sh
mkdir -p .go-dev-tools/bin/
```

Add this the end of to your `mise.toml` file:
```toml
[env]
GOPATH = "{{cwd}}/.go-dev-tools"
GOBIN = "{{cwd}}/.go-dev-tools/bin"
GOPLS_LSP_BIN = "{{cwd}}/.go-dev-tools/bin/gopls"
```

I have also added a custom environment variable `GOPLS_LSP_BIN`,
for Neovim to use.
_______________________________________________________________________________

### Create a `.gitignore` file

```sh
touch .gitignore
```

Add this to the file
```gitignore
# This is a custom location for the executable binaries of Go dev tools
# that will be installed with `go install` and a custom `GOBIN` path.
.go-dev-tools/
```
_______________________________________________________________________________

Initialize the root of this workspace:
```sh
go mod init go-programming-mastery
```

This will create a `go.mod` file that contains the version number of Go 
_______________________________________________________________________________

### Setup `gopls` (The language server for Go)

You can check what is the latest version of `gopls`, 
by going to the `pkg.go` website.

```
https://pkg.go.dev/golang.org/x/tools/gopls
```

```sh
go get -tool golang.org/x/tools/gopls@v0.21.0
```
_______________________________________________________________________________

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

Run this command to install the binary for the lsp
```sh
go install golang.org/x/tools/gopls@v0.21.0
```
_______________________________________________________________________________

```sh
mkdir .mise-tasks
```

```sh
touch .mise-tasks/setup.sh
touch .mise-tasks/clean.sh
```

Add this to `clean.sh` file
```sh
#!/usr/bin/env bash
#MISE description="Delete the .go-dev-tools directory"
#MISE quiet=true

# Attempting to delete this without sudo will lead to permission errors
sudo rm -rf .go-dev-tools
```
_______________________________________________________________________________

Add this to `setup.sh` file
```sh
#!/usr/bin/env bash
#MISE description="Install Go and Go dev tools"
#MISE quiet=true

# Delete any existing `.go-dev-tools` directory
# Attempting to delete this without sudo will lead to permission errors
sudo rm -rf .go-dev-tools

# Create a new one
mkdir .go-dev-tools

# Install project dependencies
go install $(go list tool)
```
_______________________________________________________________________________

Give mise permission to execute the bash scripts inside,
the mise-tasks directory.
```sh
chmod +x .mise-tasks/*.sh
```
_______________________________________________________________________________

To view the list of available commands:
```sh
mise tasks
```

You'll get this back:
```
Name   Description
clean  Delete the .go-dev-tools directory
setup  Install Go and Go dev tools
```
_______________________________________________________________________________

```sh
mise trust
```

```sh
mise setup
```
_______________________________________________________________________________

### How to create a Go project inside this repo


_______________________________________________________________________________
