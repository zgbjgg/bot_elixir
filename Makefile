all: deps compile

compile:
	@mix compile

deps:
	@mix deps.get

clean:
	@mix clean
