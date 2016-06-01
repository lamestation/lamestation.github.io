
# Nightmare Wind(`res`)

Some time ago, I discovered that PropellerIDE would no longer build on my main Windows machine. It always got hung up on some strange error that didn't seem to relate to what I was actually building, but since it still built fine everywhere else, I largely ignored it. Well, today, I decided to try and fix it.

### The Error

The error doesn't happen until `make` attempts to build the first executable, which happens to be `propman` inside the PropellerManager project.

```
PS D:\Projects\PropellerIDE\src\propellermanager> mingw32-make.exe
cd src\ && ( if not exist Makefile C:\Qt\Qt5.5.0\5.5\mingw492_32\bin\qmake.exe D:\Projects\PropellerIDE\src\propellerman
ager\src\src.pro -spec win32-g++ -o Makefile ) && C:/Qt/Qt5.5.0/Tools/mingw492_32/bin/mingw32-make -f Makefile
mingw32-make[1]: Entering directory 'D:/Projects/PropellerIDE/src/propellermanager/src'
mingw32-make[1]: Nothing to be done for 'first'.
mingw32-make[1]: Leaving directory 'D:/Projects/PropellerIDE/src/propellermanager/src'
cd app\ && ( if not exist Makefile C:\Qt\Qt5.5.0\5.5\mingw492_32\bin\qmake.exe D:\Projects\PropellerIDE\src\propellerman
ager\app\app.pro -spec win32-g++ -o Makefile ) && C:/Qt/Qt5.5.0/Tools/mingw492_32/bin/mingw32-make -f Makefile
mingw32-make[1]: Entering directory 'D:/Projects/PropellerIDE/src/propellermanager/app'
cd propman\ && ( if not exist Makefile C:\Qt\Qt5.5.0\5.5\mingw492_32\bin\qmake.exe D:\Projects\PropellerIDE\src\propelle
rmanager\app\propman\propman.pro -spec win32-g++ -o Makefile ) && C:/Qt/Qt5.5.0/Tools/mingw492_32/bin/mingw32-make -f Ma
kefile
mingw32-make[2]: Entering directory 'D:/Projects/PropellerIDE/src/propellermanager/app/propman'
windres -i propman_resource.rc -o propman_resource_res.o --include-dir=. -DUNICODE -DQT_SERIALPORT_LIB -DQT_CORE_LIB
propman_resource.rc:4: windows.h: No such file or directory
windres: propman_resource.rc:16: syntax error
windres: preprocessing failed.
Makefile:81: recipe for target 'propman_resource_res.o' failed
mingw32-make[2]: *** [propman_resource_res.o] Error 1
mingw32-make[2]: Leaving directory 'D:/Projects/PropellerIDE/src/propellermanager/app/propman'
Makefile:38: recipe for target 'sub-propman-make_first' failed
mingw32-make[1]: *** [sub-propman-make_first] Error 2
mingw32-make[1]: Leaving directory 'D:/Projects/PropellerIDE/src/propellermanager/app'
makefile:65: recipe for target 'sub-app-make_first' failed
mingw32-make: *** [sub-app-make_first] Error 2
```

Calling `mingw32-make.exe` one more time so I can see the error up close and personal...

```
PS D:\Projects\PropellerIDE\src\propellermanager\app\propman> mingw32-make.exe
windres -i propman_resource.rc -o propman_resource_res.o --include-dir=. -DUNICODE -DQT_SERIALPORT_LIB -DQT_CORE_LIB
propman_resource.rc:4: windows.h: No such file or directory
windres: propman_resource.rc:16: syntax error
windres: preprocessing failed.
makefile:81: recipe for target 'propman_resource_res.o' failed
mingw32-make: *** [propman_resource_res.o] Error 1
```

Okay, first of all, what is `windres.exe`? This isn't part of the build on any other platform, so I guess it's some weird Windows thing. [A quick Google search](https://sourceware.org/binutils/docs/binutils/windres.html) doesn't tell me much about what it's for or why I need it because `propman` doesn't include any resource files in its build.

But apparently I need it and apparently it can't find `windows.h`. Great.

### The Setup

The build was using Qt 5.5 (with MinGW), Python 2.7, Inno Setup 5, and... that's about it. I was using the same path I always did.

```
C:\Qt\Qt5.5.0\5.5\mingw492_32\bin;C:\Qt\Qt5.5.0\Tools\mingw492_32\bin;C:\Python27\Scripts;C:\Program Files (x86)\Inno Setup 5;C:\Program Files\7-Zip`
```

I was running the build through PowerShell, but I was getting the same issue in Qt Creator.

### The Investigation

Thinking back though, I had made system changes recently. The chain of events:

- I had installed Visual Studio to try it out.
- I removed Visual Studio (because I still don't like it!)
- I installed FreePascal to test out building the PropBASIC compiler.

Now, FreePascal isn't C at all, so I didn't think much about that one. But Visual Studio, with its huge size and massive claws digging into my system, was sure to have messed up something I uninstalled it.

So I tried lots of things:

- I tried reinstalling Visual Studio, because I figure it might have deleted `windows.h` somehow. No luck.
- I tried installing the Windows SDK because StackOverflow told me it might contain the fabled header. I've never installed the SDK before so I didn't have high hopes for this one.
- I tried reinstalling MinGW because may it was corrupted somehow.
- I tried reinstalling Qt because it had provided the MinGW installation to begin with, so maybe something was wrong with it.

But none of these seemed to work!

So I thought about it for awhile longer, and I don't know why I didn't think of this sooner, but I decided to check out the `windres.exe` itself. Every command has (or *should* have) a `-h` or `--help` option. This one was no exception.

```
PS D:\Projects\PropellerIDE\src\propellermanager\app\propman> windres.exe -h
Usage: C:\FPC\3.0.0\bin\i386-Win32\windres.exe [option(s)] [input-file] [output-file]
 The options are:
  -i --input=<file>            Name input file
  -o --output=<file>           Name output file
  -J --input-format=<format>   Specify input format
  -O --output-format=<format>  Specify output format
  -F --target=<target>         Specify COFF target
     --preprocessor=<program>  Program to use to preprocess rc file
  -I --include-dir=<dir>       Include directory when preprocessing rc file
  -D --define <sym>[=<val>]    Define SYM when preprocessing rc file
  -U --undefine <sym>          Undefine SYM when preprocessing rc file
  -v --verbose                 Verbose - tells you what it's doing
  -c --codepage=<codepage>     Specify default codepage
  -l --language=<val>          Set language when reading rc file
     --use-temp-file           Use a temporary file instead of popen to read
                               the preprocessor output
     --no-use-temp-file        Use popen (default)
  -r                           Ignored for compatibility with rc
  @<file>                      Read options from <file>
  -h --help                    Print this help message
  -V --version                 Print version information
FORMAT is one of rc, res, or coff, and is deduced from the file name
extension if not specified.  A single file name is an input file.
No input-file is stdin, default rc.  No output-file is stdout, default rc.
C:\FPC\3.0.0\bin\i386-Win32\windres.exe: supported targets: pe-i386 pei-i386 elf32-i386 elf32-little elf32-big srec symb
olsrec verilog tekhex binary ihex
Report bugs to <http://www.sourceware.org/bugzilla/>
```

There was something wrong right off the bat. Let's take a closer look.

```
...
Usage: C:\FPC\3.0.0\bin\i386-Win32\windres.exe
...
```

AHHHHHH!!!! WHY, oh WHY is `windres.exe` coming from the FreePascal (`FPC`) installation directory?

### The Fix

As it turns out, FreePascal was apparently providing its own copy of `windres.exe`, which is clearly not the same one that Qt provided. Not only that, but I guess I had clicked an option at some point to install FreePascal into the system path, which apparently supersedes the environment `PATH` variable set by the user. That means that any executables with the same name in the FreePascal and Qt installations would **always** be provided by FreePascal, which is absolutely NOT what we want.

So I uninstalled FreePascal, and look at this fabulous result. `windres.exe` is immediately provided by Qt. =|

```
PS D:\Projects\PropellerIDE\src\propellermanager\app\propman> windres.exe -h
Usage: C:\Qt\Qt5.5.0\Tools\mingw492_32\bin\windres.exe [option(s)] [input-file] [output-file]
 The options are:
  -i --input=<file>            Name input file
  -o --output=<file>           Name output file
  -J --input-format=<format>   Specify input format
  -O --output-format=<format>  Specify output format
  -F --target=<target>         Specify COFF target
     --preprocessor=<program>  Program to use to preprocess rc file
     --preprocessor-arg=<arg>  Additional preprocessor argument
  -I --include-dir=<dir>       Include directory when preprocessing rc file
  -D --define <sym>[=<val>]    Define SYM when preprocessing rc file
  -U --undefine <sym>          Undefine SYM when preprocessing rc file
  -v --verbose                 Verbose - tells you what it's doing
  -c --codepage=<codepage>     Specify default codepage
  -l --language=<val>          Set language when reading rc file
     --use-temp-file           Use a temporary file instead of popen to read
                               the preprocessor output
     --no-use-temp-file        Use popen (default)
  -r                           Ignored for compatibility with rc
  @<file>                      Read options from <file>
  -h --help                    Print this help message
  -V --version                 Print version information
FORMAT is one of rc, res, or coff, and is deduced from the file name
extension if not specified.  A single file name is an input file.
No input-file is stdin, default rc.  No output-file is stdout, default rc.
C:\Qt\Qt5.5.0\Tools\mingw492_32\bin\windres.exe: supported targets: pe-i386 pei-i386 elf32-i386 elf32-little elf32-big s
rec symbolsrec verilog tekhex binary ihex
Report bugs to <http://www.sourceware.org/bugzilla/>
```

And I'm able to build the `propman` executable just fine.

```
PS D:\Projects\PropellerIDE\src\propellermanager\app\propman> mingw32-make.exe
windres -i propman_resource.rc -o propman_resource_res.o --include-dir=. -DUNICODE -DQT_SERIALPORT_LIB -DQT_CORE_LIB
g++ -Wl,-subsystem,console -mthreads -o ..\..\bin\propman.exe main.o  -LD:/Projects/PropellerIDE/src/propellermanager/li
b/ -lpropellermanager -LC:/Qt/Qt5.5.0/5.5/mingw492_32/lib -lQt5SerialPortd -lQt5Cored propman_resource_res.o
```

Woohoo!

### Conclusion

I'll have to set up FreePascal again, and this time I have to be careful not to install it into the system path, but my Qt setup works great and now I can finally do some *real work*.

However, there's a lesson that we should all take home from this experience.

**ALWAYS CHECK THE PATH!**
