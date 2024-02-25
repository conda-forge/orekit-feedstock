if ($Env:JCC_JDK) {
    $Env:_JCC_JDK_CONDA_BACKUP = "$Env:JCC_JDK"
}
$Env:JCC_JDK = "$Env:CONDA_PREFIX\Library"

$Env:_JCC_PATH_CONDA_BACKUP = "$Env:PATH"
$Env:PATH = "$Env:JCC_JDK\jre\bin\server;$Env:JCC_JDK;$Env:JCC_JDK\jre\bin;$Env:PATH"