### Installation

[https://pub.dev/packages/get_cli/install](https://pub.dev/packages/get_cli/install)

[https://github.com/jonataslaw/get_cli](https://github.com/jonataslaw/get_cli)

- If dart is installed on your machine just run the command below

```bash
dart pub global activate get_cli
flutter pub global activate get_cli
```

- on `.zshrc`

```bash
# Flutter - GetX
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

### Create Project

```bash
get create project:paige_get_cli_test_project
```

### Create the structure

```bash
get init 
```

### Create a page

```bash
get create page:login
get create page:another {on login}
```

### Create Controller

```bash
get create controller:login
get create controller:another {on login}
```

### Create View

```bash
get create view:login
get create view:another {on login}
```

### Create Provider

```bash
get create provider:covid 
get create provider:covid {on login} 
```

### Create localization file

- Prepare for the files

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b2e3b2a1-d593-4996-a92b-5d21d3ac87a0/Untitled.png)

```bash
get generate locales assets/locales
```

### Generate Model with provider

```bash
get generate model with assets/models/user.json
get generate model {on home} with assets/models/user.json
```

### Skip the provider generation

```bash
get generate model with assets/models/user.json --skipProvider
get generate model {on home} with assets/models/user.json --skipProvider
```

### Install a package

```bash
get install camera
```

### install several packages

```bash
get install http path camera 
```

### install with specific version

```bash
get install path:1.6.4
```

### remove package

```bash
get remove http
```

### Others

```bash
get update [Update the CLI]
get -v [CLI version]
get help 
```