.PHONY: test.pdf watch

test.pdf: test.md
	pandoc	--template=template/template \
			--chapter \
			test.md \
			-o "build/test.pdf"
	xdg-open build/test.pdf

watch:
	while true; do inotifywait -e close_write . && make test.pdf; done
