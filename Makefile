py-reqs:
	python -m venv venv && \
		source venv/bin/activate && \
		pip install -r requirements.txt

py-proto: py-reqs
	python -m grpc_tools.protoc \
		-I./proto \
		--python_out=py/ \
		--grpc_python_out=py/ \
		ping.proto

build-py: py-proto

run-server: py-reqs build-py
	python -m venv venv && \
		source venv/bin/activate && \
		python py/server.py


js-reqs:
	npm i
	
js-proto:
	npx protoc --ts_out ./src/ --proto_path ./proto ping.proto

run-client: js-reqs js-proto
	npx ts-node src/index.ts


clean: clean-py clean-js

clean-py:
	rm -f py/*pb2*
	rm -rf venv

clean-js:
	rm -rf node_modules
	rm -f src/ping*



