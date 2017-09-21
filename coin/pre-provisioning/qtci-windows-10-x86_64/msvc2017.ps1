############################################################################
##
## Copyright (C) 2017 The Qt Company Ltd.
## Contact: http://www.qt.io/licensing/
##
## This file is part of the provisioning scripts of the Qt Toolkit.
##
## $QT_BEGIN_LICENSE:LGPL21$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see http://www.qt.io/terms-conditions. For further
## information use the contact form at http://www.qt.io/contact-us.
##
## GNU Lesser General Public License Usage
## Alternatively, this file may be used under the terms of the GNU Lesser
## General Public License version 2.1 or version 3 as published by the Free
## Software Foundation and appearing in the file LICENSE.LGPLv21 and
## LICENSE.LGPLv3 included in the packaging of this file. Please review the
## following information to ensure the GNU Lesser General Public License
## requirements will be met: https://www.gnu.org/licenses/lgpl.html and
## http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
##
## As a special exception, The Qt Company gives you certain additional
## rights. These rights are described in The Qt Company LGPL Exception
## version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
##
## $QT_END_LICENSE$
##
#############################################################################

. "$PSScriptRoot\..\..\provisioning\common\windows\helpers.ps1"

# This script will install Visual Studio 2017

$version = "2017"
$url_cache = "http://ci-files01-hki.ci.local/input/windows/mu_visual_studio_professional_" + $version + "_x86_x64_10049787.exe"
$sha1 = "8d678d27735018a99dc22ddb5412e4e6868991ae"
$msvcPackage = "C:\Windows\Temp\$version.exe"


Download $url_cache $url_cache $msvcPackage
Verify-Checksum $msvcPackage $sha1
cmd /c "$msvcPackage --all --norestart --quiet --wait --add Microsoft.VisualStudio.Component.VC.Tools.ARM"
echo "Cleaning $msvcPackage.."
Remove-Item -Recurse -Force "$msvcPackage"
echo "Visual Studio = $version" >> ~\versions.txt
