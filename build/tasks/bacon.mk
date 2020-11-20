# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Lineage OTA update package

LINEAGE_TARGET_PACKAGE := $(PRODUCT_OUT)/lightning-$(LINEAGE_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(LINEAGE_TARGET_PACKAGE)
	$(hide) $(MD5) $(LINEAGE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(LINEAGE_TARGET_PACKAGE).md5sum
	@echo "Package Complete: $(LINEAGE_TARGET_PACKAGE)" >&2

	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}" _     _       _     _         _             _____         _   ____ "
	@echo -e ${CL_CYN}"| |   (_) __ _| |__ | |_ _ __ (_)_ __   __ _|  ___|_ _ ___| |_|  _ \ ___  _ __ ___ "
	@echo -e ${CL_CYN}"| |   | |/ _\` | '_ \| __| '_ \| | '_ \ / _\` | |_ / _\` / __| __| |_) / _ \| '_ \` _ \\"
	@echo -e ${CL_CYN}"| |___| | (_| | | | | |_| | | | | | | | (_| |  _| (_| \__ \ |_|  _ < (_) | | | | | |"
	@echo -e ${CL_CYN}"|_____|_|\__, |_| |_|\__|_| |_|_|_| |_|\__, |_|  \__,_|___/\__|_| \_\___/|_| |_| |_|"
	@echo -e ${CL_CYN}"          |___/                         |___/"
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}"=================================-Package Completed-================================"${CL_RST}
	@echo -e ""
