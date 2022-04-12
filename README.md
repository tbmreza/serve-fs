[![Racket](https://img.shields.io/badge/-Made%20with%20Racket%20Templates-lightgrey?logo=racket)](https://github.com/racket-templates)

serve-fs
========

A CLI app that serves files in working directory. While this program's initial motivation was as an example Racket program, serve-fs can be
occasionally [practical](https://stackoverflow.com/q/3108395).

```bash
usage: serve-fs [ <option> ... ]

<option> is one of

--port <port>, -p <port>
Specify port number
--dir <dir>, -d <dir>
Specify directory to serve
--headless, -s
Do not open a browser
--help, -h
Show this help
...
```

## Usage

Either download the serve-fs executable, or invoke serve-fs as a raco (comes with the Racket [installation](https://download.racket-lang.org/)) command.

```bash
raco pkg install serve-fs
raco serve-fs
```

## Development status

The app is installable, but far from finish.

- [X] implement main functionality
- [ ] publish package
- [ ] properly test
- [ ] ...

## Testing

- [cram](https://github.com/brodie/cram)
