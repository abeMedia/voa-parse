install:
	go get

build:
	GOOS=linux GOARCH=amd64 go build -o build/linux-amd64/voa-parse
	GOOS=linux GOARCH=386 go build -o build/linux-386/voa-parse
	GOOS=windows GOARCH=amd64 go build -o build/win64/voa-parse.exe
	GOOS=windows GOARCH=386 go build -o build/win32/voa-parse.exe

release: build
	mkdir release
	echo $(pwd)
	for d in build/*; do cp README.md $$d; done
	tar -zcvf "release/voa-parse-linux-amd64.tar.gz" build/linux-amd64/*
	tar -zcvf "release/voa-parse-linux-386.tar.gz" build/linux-386/*
	tar -zcvf "release/voa-parse-win64.tar.gz" build/win64/*
	tar -zcvf "release/voa-parse-win32.tar.gz" build/win32/*

clean:
	rm -rf build
	rm -rf release