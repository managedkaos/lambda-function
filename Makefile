FUNCTION = script
ZIP  = $(FUNCTION).zip
SRC  = $(FUNCTION).py
.PHONY: all plan $(AUTO)

$(ZIP): $(SRC)
	zip -X $(ZIP) $(SRC)

clean:
	rm -vf $(ZIP) response.json

invoke:
	aws lambda invoke --function-name $(FUNCTION) --invocation-type Event response.json

plan: $(ZIP)
	terraform $@

apply destroy:
	terraform $@ -auto-approve

all: $(ZIP) apply
