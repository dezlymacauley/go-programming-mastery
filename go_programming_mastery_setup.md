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

When you install Go tools using `go install`, 
the location where those binaries are installed is determined by the the
variable `$GOPATH`

You can check what this is set to by running this command:
```sh
echo $GOBIN
```

_______________________________________________________________________________

I want my tools to be scoped to the project repository

Add this the end of to your `mise.toml` file:
```toml

```
_______________________________________________________________________________
