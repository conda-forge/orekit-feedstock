"%PYTHON%" -m jcc  ^
--use_full_names ^
--python orekit ^
--version %PKG_VERSION% ^
--jar %SRC_DIR%\orekit-9.3.jar ^
--jar %SRC_DIR%\hipparchus-core-1.4.jar ^
--jar %SRC_DIR%\hipparchus-filtering-1.4.jar ^
--jar %SRC_DIR%\hipparchus-fitting-1.4.jar ^
--jar %SRC_DIR%\hipparchus-geometry-1.4.jar ^
--jar %SRC_DIR%\hipparchus-ode-1.4.jar ^
--jar %SRC_DIR%\hipparchus-optim-1.4.jar ^
--jar %SRC_DIR%\hipparchus-stat-1.4.jar ^
--package java.io ^
--package java.util ^
--package java.text ^
--package org.orekit ^
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
--module %SRC_DIR%\pyhelpers.py ^
--reserved INFINITE ^
--reserved ERROR ^
--reserved NAN ^
--reserved OVERFLOW ^
--reserved NO_DATA ^
--reserved min ^
--reserved max ^
--reserved mean ^
--files 10 ^
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