:: adding compile parameters explicitly as relocation for conda does not seem to detect JCC  path under windows
@set "JCC_JDK=%PREFIX%\Library"
@set "JCC_INCLUDES=%PREFIX%\Library\include\win32;%PREFIX%\Library\include"
@set "JCC_CFLAGS=/EHsc;/D_CRT_SECURE_NO_WARNINGS"
@set "JCC_LFLAGS=/DLL;/LIBPATH:%PREFIX%\Library\lib;Ws2_32.lib;jvm.lib"
@set "JCC_DEBUG_CFLAGS=/Od;/DDEBUG"
@set "JCC_JAVAC=%PREFIX%\Library\bin\javac.exe"
@set "JCC_JAVADOC=%PREFIX%\Library\bin\javadoc.exe"

"%PYTHON%" -m jcc  ^
--use_full_names ^
--python orekit ^
--version %PKG_VERSION% ^
--jar %SRC_DIR%\orekit-11.0.jar ^
--jar %SRC_DIR%\hipparchus-core-2.0.jar ^
--jar %SRC_DIR%\hipparchus-filtering-2.0.jar ^
--jar %SRC_DIR%\hipparchus-geometry-2.0.jar ^
--jar %SRC_DIR%\hipparchus-ode-2.0.jar ^
--jar %SRC_DIR%\hipparchus-optim-2.0.jar ^
--jar %SRC_DIR%\hipparchus-stat-2.0.jar ^
--package java.io ^
--package java.util ^
--package java.text ^
--package org.orekit ^
--package org.orekit.rugged ^
java.io.BufferedReader ^
java.io.FileInputStream ^
java.io.FileOutputStream ^
java.io.InputStream ^
java.io.InputStreamReader ^
java.io.ObjectInputStream ^
java.io.ObjectOutputStream ^
java.io.PrintStream ^
java.io.StringReader ^
java.io.StringWriter ^
java.lang.System ^
java.text.DecimalFormat ^
java.text.DecimalFormatSymbols ^
java.util.ArrayDeque  ^
java.util.ArrayList  ^
java.util.Arrays  ^
java.util.Collection  ^
java.util.Collections ^
java.util.Date ^
java.util.HashMap ^
java.util.HashSet ^
java.util.List  ^
java.util.Locale ^
java.util.Map ^
java.util.Set ^
java.util.TreeSet ^
java.util.stream.Collectors ^
java.util.stream.Stream ^
java.util.stream.DoubleStream ^
java.util.function.LongConsumer ^
java.util.function.IntConsumer ^
java.util.function.DoubleConsumer ^
--module %SRC_DIR%\pyhelpers.py ^
--reserved INFINITE ^
--reserved ERROR ^
--reserved NAN ^
--reserved OVERFLOW ^
--reserved NO_DATA ^
--reserved min ^
--reserved max ^
--reserved mean ^
--reserved SNAN ^
--classpath %PREFIX%\Library\lib\tools.jar ^
--files 81 ^
--build ^
--install
if errorlevel 1 exit 1

:: ensure that JCC_JDK is set correctly by invoking an activate script
set ACTIVATE_DIR=%PREFIX%\etc\conda\activate.d
set DEACTIVATE_DIR=%PREFIX%\etc\conda\deactivate.d
mkdir %ACTIVATE_DIR%
mkdir %DEACTIVATE_DIR%

copy %RECIPE_DIR%\scripts\activate.bat %ACTIVATE_DIR%\orekit-activate.bat
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.bat %DEACTIVATE_DIR%\orekit-deactivate.bat
if errorlevel 1 exit 1
