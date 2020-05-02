ZIP  = script.zip
SRC  = script.py
.PHONY: all plan $(AUTO)

$(ZIP): $(SRC)
	zip -X $(ZIP) $(SRC)

clean:
	rm $(ZIP)

plan: $(ZIP)
	terraform $@

apply destroy:
	terraform $@ -auto-approve

all: $(ZIP) apply
