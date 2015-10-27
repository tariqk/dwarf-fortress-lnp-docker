lnp-URL=http://lazynewbpack.com/linux/04024/download/x64/04024r3-x64.zip
lnp-zip=resources/install.zip
image-name=tariqk/dwarf-fortress-lnp

all: | resources/install.zip resources/df.tar.bz2 resources/PyLNP.user start-df-lnp-docker
	docker build -t $(image-name) .

resources/install.zip:
	curl -kL -o $$(lnp-zip) $$(lnp-URL) ;\
	unzip $$(lnp-zip) -d . ;\
	mv 04024r3-x64 df

.PHONY: clean
clean:
	rm -rf resources/install.zip df
