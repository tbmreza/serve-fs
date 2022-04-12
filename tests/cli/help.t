  $ cd "$TESTDIR" && cd ../.. && raco exe serve-fs.rkt

  $ ./serve-fs --help
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
    --
       Do not treat any remaining argument as a switch (at this level)
  
   Multiple single-letter switches can be combined after
   one `-`. For example, `-h-` is the same as `-h --`.

  $ ./serve-fs -h
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
    --
       Do not treat any remaining argument as a switch (at this level)
  
   Multiple single-letter switches can be combined after
   one `-`. For example, `-h-` is the same as `-h --`.
