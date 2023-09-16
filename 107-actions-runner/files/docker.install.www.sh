#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env

cd ~
mkdir git
git clone --depth=1 https://github.com/actions/runner-images.git

cd runner-images
cd images/linux/

whoami
pwd
export path_root=$PWD


# 1
 # provisioner "shell" {
 #    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    script          = "${path.root}/scripts/base/apt-mock.sh"
 #  }

export DEBIAN_FRONTEND=noninteractive

export Vars="allowed_inbound_ip_addresses=[] azure_tags={} build_resource_group_name='build_resource_group_name'"
sudo sh -c "${Vars} ${path_root}/scripts/base/apt-mock.sh"


 #  provisioner "shell" {
 #    environment_vars = ["DEBIAN_FRONTEND=noninteractive"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/base/repos.sh"]
 #  }
sudo sh -c "${Vars} ${path_root}/scripts/base/repos.sh"


 #  provisioner "shell" {
 #    environment_vars = ["DEBIAN_FRONTEND=noninteractive"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/base/apt-ubuntu-archive.sh"]
 #  }
sudo sh -c "${Vars} ${path_root}/scripts/base/apt-ubuntu-archive.sh"

 #  provisioner "shell" {
 #    environment_vars = ["DEBIAN_FRONTEND=noninteractive"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    script           = "${path.root}/scripts/base/apt.sh"
 #  }
sudo sh -c "${Vars} ${path_root}/scripts/base/apt.sh"


 #  provisioner "shell" {
 #    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    script          = "${path.root}/scripts/base/limits.sh"
 #  }

 #  provisioner "file" {
 #    destination = "${var.helper_script_folder}"
 #    source      = "${path.root}/scripts/helpers"
 #  }

 #  provisioner "file" {
 #    destination = "${var.installer_script_folder}"
 #    source      = "${path.root}/scripts/installers"
 #  }

 #  provisioner "file" {
 #    destination = "${var.image_folder}"
 #    source      = "${path.root}/post-generation"
 #  }

 #  provisioner "file" {
 #    destination = "${var.image_folder}"
 #    source      = "${path.root}/scripts/tests"
 #  }

 #  provisioner "file" {
 #    destination = "${var.image_folder}"
 #    source      = "${path.root}/scripts/SoftwareReport"
 #  }

 #  provisioner "file" {
 #    destination = "${var.image_folder}/SoftwareReport/"
 #    source      = "${path.root}/../../helpers/software-report-base"
 #  }

 #  provisioner "file" {
 #    destination = "${var.installer_script_folder}/toolset.json"
 #    source      = "${path.root}/toolsets/toolset-2204.json"
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["IMAGE_VERSION=${var.image_version}", "IMAGEDATA_FILE=${var.imagedata_file}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/preimagedata.sh"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["IMAGE_VERSION=${var.image_version}", "IMAGE_OS=${var.image_os}", "HELPER_SCRIPTS=${var.helper_script_folder}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/configure-environment.sh"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["DEBIAN_FRONTEND=noninteractive", "HELPER_SCRIPTS=${var.helper_script_folder}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/apt-vital.sh"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPTS=${var.helper_script_folder}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/complete-snap-setup.sh", "${path.root}/scripts/installers/powershellcore.sh"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPTS=${var.helper_script_folder}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} pwsh -f {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/Install-PowerShellModules.ps1", "${path.root}/scripts/installers/Install-AzureModules.ps1"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPTS=${var.helper_script_folder}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}", "DEBIAN_FRONTEND=noninteractive"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = [
 #                        "${path.root}/scripts/installers/apt-common.sh",
 #                        "${path.root}/scripts/installers/azcopy.sh",
 #                        "${path.root}/scripts/installers/azure-cli.sh",
 #                        "${path.root}/scripts/installers/azure-devops-cli.sh",
 #                        "${path.root}/scripts/installers/bicep.sh",
 #                        "${path.root}/scripts/installers/aliyun-cli.sh",
 #                        "${path.root}/scripts/installers/apache.sh",
 #                        "${path.root}/scripts/installers/aws.sh",
 #                        "${path.root}/scripts/installers/clang.sh",
 #                        "${path.root}/scripts/installers/swift.sh",
 #                        "${path.root}/scripts/installers/cmake.sh",
 #                        "${path.root}/scripts/installers/codeql-bundle.sh",
 #                        "${path.root}/scripts/installers/containers.sh",
 #                        "${path.root}/scripts/installers/dotnetcore-sdk.sh",
 #                        "${path.root}/scripts/installers/firefox.sh",
 #                        "${path.root}/scripts/installers/microsoft-edge.sh",
 #                        "${path.root}/scripts/installers/gcc.sh",
 #                        "${path.root}/scripts/installers/gfortran.sh",
 #                        "${path.root}/scripts/installers/git.sh",
 #                        "${path.root}/scripts/installers/github-cli.sh",
 #                        "${path.root}/scripts/installers/google-chrome.sh",
 #                        "${path.root}/scripts/installers/google-cloud-sdk.sh",
 #                        "${path.root}/scripts/installers/haskell.sh",
 #                        "${path.root}/scripts/installers/heroku.sh",
 #                        "${path.root}/scripts/installers/java-tools.sh",
 #                        "${path.root}/scripts/installers/kubernetes-tools.sh",
 #                        "${path.root}/scripts/installers/oc.sh",
 #                        "${path.root}/scripts/installers/leiningen.sh",
 #                        "${path.root}/scripts/installers/miniconda.sh",
 #                        "${path.root}/scripts/installers/mono.sh",
 #                        "${path.root}/scripts/installers/kotlin.sh",
 #                        "${path.root}/scripts/installers/mysql.sh",
 #                        "${path.root}/scripts/installers/mssql-cmd-tools.sh",
 #                        "${path.root}/scripts/installers/sqlpackage.sh",
 #                        "${path.root}/scripts/installers/nginx.sh",
 #                        "${path.root}/scripts/installers/nvm.sh",
 #                        "${path.root}/scripts/installers/nodejs.sh",
 #                        "${path.root}/scripts/installers/bazel.sh",
 #                        "${path.root}/scripts/installers/oras-cli.sh",
 #                        "${path.root}/scripts/installers/php.sh",
 #                        "${path.root}/scripts/installers/postgresql.sh",
 #                        "${path.root}/scripts/installers/pulumi.sh",
 #                        "${path.root}/scripts/installers/ruby.sh",
 #                        "${path.root}/scripts/installers/r.sh",
 #                        "${path.root}/scripts/installers/rust.sh",
 #                        "${path.root}/scripts/installers/julia.sh",
 #                        "${path.root}/scripts/installers/sbt.sh",
 #                        "${path.root}/scripts/installers/selenium.sh",
 #                        "${path.root}/scripts/installers/terraform.sh",
 #                        "${path.root}/scripts/installers/packer.sh",
 #                        "${path.root}/scripts/installers/vcpkg.sh",
 #                        "${path.root}/scripts/installers/dpkg-config.sh",
 #                        "${path.root}/scripts/installers/yq.sh",
 #                        "${path.root}/scripts/installers/android.sh",
 #                        "${path.root}/scripts/installers/pypy.sh",
 #                        "${path.root}/scripts/installers/python.sh",
 #                        "${path.root}/scripts/installers/zstd.sh"
 #                        ]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPTS=${var.helper_script_folder}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}", "DOCKERHUB_LOGIN=${var.dockerhub_login}", "DOCKERHUB_PASSWORD=${var.dockerhub_password}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/docker-compose.sh", "${path.root}/scripts/installers/docker.sh"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPTS=${var.helper_script_folder}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} pwsh -f {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/Install-Toolset.ps1", "${path.root}/scripts/installers/Configure-Toolset.ps1"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPTS=${var.helper_script_folder}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/pipx-packages.sh"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPTS=${var.helper_script_folder}", "DEBIAN_FRONTEND=noninteractive", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}"]
 #    execute_command  = "/bin/sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/homebrew.sh"]
 #  }

 #  provisioner "shell" {
 #    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    script          = "${path.root}/scripts/base/snap.sh"
 #  }

 #  provisioner "shell" {
 #    execute_command   = "/bin/sh -c '{{ .Vars }} {{ .Path }}'"
 #    expect_disconnect = true
 #    scripts           = ["${path.root}/scripts/base/reboot.sh"]
 #  }

 #  provisioner "shell" {
 #    execute_command     = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    pause_before        = "1m0s"
 #    scripts             = ["${path.root}/scripts/installers/cleanup.sh"]
 #    start_retry_timeout = "10m"
 #  }

 #  provisioner "shell" {
 #    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    script          = "${path.root}/scripts/base/apt-mock-remove.sh"
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["IMAGE_VERSION=${var.image_version}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}"]
 #    inline           = ["pwsh -File ${var.image_folder}/SoftwareReport/SoftwareReport.Generator.ps1 -OutputDirectory ${var.image_folder}", "pwsh -File ${var.image_folder}/tests/RunAll-Tests.ps1 -OutputDirectory ${var.image_folder}"]
 #  }

 #  provisioner "file" {
 #    destination = "${path.root}/Ubuntu2204-Readme.md"
 #    direction   = "download"
 #    source      = "${var.image_folder}/software-report.md"
 #  }

 #  provisioner "file" {
 #    destination = "${path.root}/software-report.json"
 #    direction   = "download"
 #    source      = "${var.image_folder}/software-report.json"
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["HELPER_SCRIPT_FOLDER=${var.helper_script_folder}", "INSTALLER_SCRIPT_FOLDER=${var.installer_script_folder}", "IMAGE_FOLDER=${var.image_folder}"]
 #    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    scripts          = ["${path.root}/scripts/installers/post-deployment.sh"]
 #  }

 #  provisioner "shell" {
 #    environment_vars = ["RUN_VALIDATION=${var.run_validation_diskspace}"]
 #    scripts          = ["${path.root}/scripts/installers/validate-disk-space.sh"]
 #  }

 #  provisioner "file" {
 #    destination = "/tmp/"
 #    source      = "${path.root}/config/ubuntu2204.conf"
 #  }

 #  provisioner "shell" {
 #    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    inline          = ["mkdir -p /etc/vsts", "cp /tmp/ubuntu2204.conf /etc/vsts/machine_instance.conf"]
 #  }

 #  provisioner "shell" {
 #    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
 #    inline          = ["sleep 30", "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"]
 #  }





mkdir dev
rm -rf versions
mkdir versions
cd versions
apt list > apt.list.origin.txt
apt list --installed > apt.list.installed.origin.txt
