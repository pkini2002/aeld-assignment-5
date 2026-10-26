##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = e90ff2311f9e285867ff4ba32811b5ad0135f13d

AESD_ASSIGNMENTS_SITE = \
        https://github.com/pkini2002/aeld-assignment-5.git

AESD_ASSIGNMENTS_SITE_METHOD = git

define AESD_ASSIGNMENTS_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC)" -C $(@D)/server all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS

        $(INSTALL) -D -m 0755 \
                $(@D)/server/aesdsocket \
                $(TARGET_DIR)/usr/bin/aesdsocket

        $(INSTALL) -D -m 0755 \
                $(@D)/server/aesdsocket-start-stop \
                $(TARGET_DIR)/etc/init.d/S99aesdsocket

endef

$(eval $(generic-package))
