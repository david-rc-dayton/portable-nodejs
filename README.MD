# portable-nodejs

Create a portable Node.js runtime for Win32; Bundled with NPM for both CMD and
Bash.

## Usage

Run the `portable-nodejs.sh` script using `bash`, providing the desired version
number as an argument. For example:

    bash portable-nodejs.sh 6.5.0

The terminal will display the script's status:

    Setting up build environment...

    Downloading SHA256 Checksums:
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
    100  3576    0  3576    0     0   9762      0 --:--:-- --:--:-- --:--:--  9743

    Downloading NodeJS archive: node-v6.5.0-linux-x86.tar.gz
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
    100 12.7M  100 12.7M    0     0  1110k      0  0:00:11  0:00:11 --:--:-- 1202k

    Downloading NodeJS binary: win-x86/node.exe
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
    100 14.0M  100 14.0M    0     0   753k      0  0:00:19  0:00:19 --:--:-- 1171k

    Checking file integrity...
    node-v6.5.0-linux-x86.tar.gz: OK
    win-x86/node.exe: OK

    Adjusting file structure...

    Creating standalone archive: nodejs-v6.5.0-win32.tar.gz
    method  crc     date  time           compressed        uncompressed  ratio uncompressed_name
    defla 922bf357 Nov 30 14:19             8569848            28160000  69.6% nodejs-v6.5.0-win32.tar
    nodejs-v6.5.0-win32.tar.gz:	 OK

    Performing cleanup actions...

    ---- DONE ----

## License

Copyright (c) 2016 David RC Dayton

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.