lnp-URL=http://lazynewbpack.com/linux/04024/download/x64/04024r3-x64.zip
lnp-zip=resources/install.zip
image-name=tariqk/dwarf-fortress-lnp
xdg-terminal-location=df/xdg-terminal
xdg-terminal-URL=https://raw.githubusercontent.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux/master/pack/xdg-terminal

all: | start-df-lnp-docker df df/xdg-terminal
	docker build -t $(image-name) .

resources/install.zip:
	curl -kL -o $(lnp-zip) $(lnp-URL)

df: | resources/install.zip
	unzip $(lnp-zip) -d . && \
	mv 04024r3-x64 df && \
	rm df/xdg-terminal

df/xdg-terminal: | df
	curl -kL -o $(xdg-terminal-location) $(xdg-terminal-URL)

.PHONY: clean
clean:
	rm -rf resources/install.zip df
