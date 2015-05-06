# a*git*ate

Provides git status summary for all user git repositories.

## Usage

Default option shows status for all projects under user `$HOME`

```bash
$ ./agitate.sh
Agitating all git repositories under /Users/scott ...
.external/coreos-vagrant        clean        [ahead 2]
.external/workman               clean
Projects/agitate                1 change
algs4/w1                        1 change
Projects/async-channels         clean
Projects/blaze-snmp             clean
Projects/docker-debian          clean
Projects/dot-files              clean
Projects/ebol                   4 changes
Projects/ebol-client            4 changes
Projects/homebrew               clean        [ahead 1]
Projects/onelink                3 changes    [ahead 5]
Projects/onelore                clean
revoir/client                   2 changes
revoir/service                  clean
Projects/scala-async            clean
Projects/squirt                 1 change     [ahead 23, behind 1]
```

Or specify a directory to scan in

```bash
$ ./agitate.sh ~/Projects/.external
Agitating all git repositories under /Users/scott/Projects/.external ...
.external/coreos-vagrant        clean        [ahead 2]
.external/workman               clean
```

With `-q` flag (quiet) only shows changed repositories

```bash
$ ./agitate.sh -q
.external/coreos-vagrant        clean        [ahead 2]
Projects/agitate                1 change
algs4/w1                        1 change
Projects/ebol                   4 changes
Projects/ebol-client            4 changes
Projects/homebrew               clean        [ahead 1]
Projects/onelink                3 changes    [ahead 5]
revoir/client                   2 changes
Projects/squirt                 1 change     [ahead 23, behind 1]
```
