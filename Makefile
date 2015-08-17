all:
	valac sample.vala --pkg mruby --vapidir ./vapi -X -lm

clean:
	rm sample
