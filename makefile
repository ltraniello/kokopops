BIN_DIR = /usr/local/bin
LOCAL_COMPLETIONS_DIR = ~/.local/share/bash-completion/completions

all:
	echo "No!"

install: kops.sh _kops_complete.sh
	install -m 0777 kops.sh $(BIN_DIR)/kops
	mkdir -p $(LOCAL_COMPLETIONS_DIR)/completions
	install -m 0777 _kops_complete.sh $(LOCAL_COMPLETIONS_DIR)/kops

uninstall:
	rm -f $(BIN_DIR)/kops
	rm -f $(LOCAL_COMPLETIONS_DIR)/kops