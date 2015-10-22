lnp-URL=http://dffd.bay12games.com/download.php?id=8936&f=04024r3-x64.zip
lnp-zip=resources/install.zip
df-URL=http://www.bay12games.com/dwarves/df_40_24_linux.tar.bz2
df-zip=resources/df.tar.bz2
image-name=tariqk/dwarf-fortress-lnp

all: | resources/install.zip resources/df.tar.bz2 resources/PyLNP.user start-df-lnp-docker
	docker build -t $(image-name) .

resources/install.zip:
	curl -kL -o $(lnp-zip) $(lnp-URL)

resources/df.tar.bz2:
	curl -kL -o $(df-zip) $(df-URL)

.PHONY: clean
clean:
	rm resources/install.zip resources/df.tar.bz2
