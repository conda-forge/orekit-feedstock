#!/bin/bash

$PYTHON -m jcc \
--use_full_names \
--python orekit \
--version ${PKG_VERSION} \
--jar $SRC_DIR/orekit-10.1.jar \
--jar $SRC_DIR/hipparchus-core-1.6.jar \
--jar $SRC_DIR/hipparchus-filtering-1.6.jar \
--jar $SRC_DIR/hipparchus-fitting-1.6.jar \
--jar $SRC_DIR/hipparchus-geometry-1.6.jar \
--jar $SRC_DIR/hipparchus-ode-1.6.jar \
--jar $SRC_DIR/hipparchus-optim-1.6.jar \
--jar $SRC_DIR/hipparchus-stat-1.6.jar \
--jar $SRC_DIR/rugged-2.1.jar \
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