DIRS=src


all: $(DIRS)

run: $(DIRS)

build: $(DIRS)

clean: $(DIRS)

clobber: $(DIRS)

check.deps: $(DIRS)

$(DIRS):
	$(MAKE) -C "$@" $(MAKEFLAGS) $(MAKECMDGOALS)

.PHONY: all run build clean clobber check.deps $(DIRS)
