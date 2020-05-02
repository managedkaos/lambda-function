.PHONY: all plan apply
ZIP  = script.zip
SRC  = script.py
AUTO = apply destroy

$(ZIP): $(SRC)
	zip -X $(ZIP) $(SRC)

clean:
	rm $(ZIP)

plan: $(ZIP)
	terraform plan

$(AUTO):
	terraform $@ -auto-approve

all: $(ZIP) plan apply clean destroy
