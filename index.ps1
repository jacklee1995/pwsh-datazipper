#*****************************************************************************
# Copyright Jack Lee. All rights reserved.
# Licensed under the MIT License.
# Email: 291148484@163.com
# https://blog.csdn.net/qq_28550263?spm=1001.2101.3001.5343
#*****************************************************************************

using module .\pwsh-utils\src\path.psm1
using module .\pwsh-utils\src\iniconf.psm1
using module .\pwsh-utils\src\logger.psm1
using module .\pwsh-utils\src\fs.psm1

$BASE_DIR = [Path]::get_dirpath($MyInvocation.MyCommand.source)
$INI_PATH = [Path]::join($BASE_DIR,'conf.ini')
$params = (Read-Ini -Path $INI_PATH).params
$SOURCES_DIR = $params.SOURCES_DIR.Replace('"','')
$ARCHIVES_DIR = $params.ARCHIVES_DIR.Replace('"','')
$ARCHIVES_FOLDER_NAME = $params.ARCHIVES_FOLDER_NAME
$ARCHIVES_FILE_NAME = $params.ARCHIVES_FILE_NAME

function main(){
    $logger = [Logger]::new($SavePath);
    $items = [Path]::get_items($SOURCES_DIR)
    Check-Folder -Path $ARCHIVES_DIR
    $timeMap = @{}
    # 
    foreach ($item in $items) {
        $Modifytime = Get-Modifytime -Path $item
        if(!$timeMap.Contains($Modifytime)){
            $timeMap[$Modifytime]=[System.Collections.ArrayList]@($item)
        }
        else{
            $timeMap[$Modifytime].Add($item)
        }
    }
    # add to zip
    foreach ($daytime in $timeMap.Keys) {
        $sources = $timeMap[$daytime]
        Zip-Items -Sources $sources -DestDir $ARCHIVES_DIR -Title $daytime
        if($?){
            $logger.trace("[OK] Archive `""+$sources+"`" success.")
            foreach ($source in $sources) {
                $logger.Info("Remove item `""+$source+"`"")
                Remove-Item $source
                $logger.Debug("Item `""+$source+"`" has been remove.")
            }
        }
    }
}

$m = main
