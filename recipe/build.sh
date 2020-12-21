#!/bin/bash

if [ "$(uname)" == "Darwin" ]
then
  export JCC_JDK=${PREFIX}
  export JCC_ARGSEP=";"
  export JCC_INCLUDES="${PREFIX}/include;${PREFIX}/include/darwin"
  export JCC_LFLAGS="-v;-L${PREFIX}/jre/lib;-ljava;-L${PREFIX}/jre/lib/server;-ljvm;-Wl,-rpath;-Wl,${PREFIX}/jre/lib;-Wl,-rpath;-Wl,${PREFIX}/jre/lib/server;-mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET"
	export JCC_CFLAGS="-fno-strict-aliasing;-Wno-write-strings;-Qunused-arguments;-mmacosx-version-min=10.9;-std=c++11;-stdlib=libc++"
  export JCC_DEBUG_CFLAGS="-O0;-g;-DDEBUG"
  export JCC_JAVAC="javac;-source;1.8;-target;1.8"
  export JCC_JAVADOC="javadoc"

else
  # GNU/Linux recipe
  export JCC_JDK=${PREFIX}
  export JCC_ARGSEP=";"
	export JCC_LFLAGS="-v;-Wl,-v;-L${PREFIX}/jre/lib/amd64;-ljava;-L${PREFIX}/jre/lib/amd64/server;-ljvm;-lverify;-Wl,-rpath=${PREFIX}/jre/lib/amd64:${PREFIX}/jre/lib/amd64/server"
  export JCC_INCLUDES="${PREFIX}/include;${PREFIX}/include/linux"
	export JCC_JAVAC=${PREFIX}/bin/javac
	export JCC_CFLAGS="-v;-fno-strict-aliasing;-Wno-write-strings;-D__STDC_FORMAT_MACROS"
  export JCC_DEBUG_CFLAGS="-O0;-g;-DDEBUG"
  export JCC_JAVADOC="javadoc"
fi

printenv


$PYTHON -m jcc \
--use_full_names \
--python orekit \
--version ${PKG_VERSION} \
--jar $SRC_DIR/orekit-10.3.jar \
--jar $SRC_DIR/hipparchus-clustering-1.8.jar \
--jar $SRC_DIR/hipparchus-core-1.8.jar \
--jar $SRC_DIR/hipparchus-fft-1.8.jar \
--jar $SRC_DIR/hipparchus-filtering-1.8.jar \
--jar $SRC_DIR/hipparchus-fitting-1.8.jar \
--jar $SRC_DIR/hipparchus-geometry-1.8.jar \
--jar $SRC_DIR/hipparchus-migration-1.8.jar \
--jar $SRC_DIR/hipparchus-ode-1.8.jar \
--jar $SRC_DIR/hipparchus-optim-1.8.jar \
--jar $SRC_DIR/hipparchus-stat-1.8.jar \
--jar $SRC_DIR/rugged-2.2.jar \
--package java.io \
--package java.util \
--package java.text \
--package org.orekit \
--package org.orekit.rugged \
java.io.BufferedReader \
java.io.FileInputStream \
java.io.FileOutputStream \
java.io.InputStream \
java.io.InputStreamReader \
java.io.ObjectInputStream \
java.io.ObjectOutputStream \
java.io.PrintStream \
java.io.StringReader \
java.io.StringWriter \
java.lang.System \
java.text.DecimalFormat \
java.text.DecimalFormatSymbols \
java.util.ArrayDeque  \
java.util.ArrayList \
java.util.Arrays \
java.util.Collection \
java.util.Collections \
java.util.Date \
java.util.HashMap \
java.util.HashSet \
java.util.List \
java.util.Locale \
java.util.Map \
java.util.Set \
java.util.TreeSet \
java.util.stream.Collectors \
java.util.stream.Stream \
java.util.stream.DoubleStream \
java.util.function.LongConsumer \
java.util.function.IntConsumer \
java.util.function.DoubleConsumer \
--module $SRC_DIR/pyhelpers.py \
--reserved INFINITE \
--reserved ERROR \
--reserved OVERFLOW \
--reserved NO_DATA \
--reserved NAN \
--reserved min \
--reserved max \
--reserved mean \
--reserved SNAN \
--classpath $PREFIX/lib/tools.jar \
--files 81 \
--build \
--install

# ensure that JCC_JDK is set correctly by invoking an activate script

ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp $RECIPE_DIR/scripts/activate.sh $ACTIVATE_DIR/orekit-activate.sh
cp $RECIPE_DIR/scripts/deactivate.sh $DEACTIVATE_DIR/orekit-deactivate.sh