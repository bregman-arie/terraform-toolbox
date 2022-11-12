fmt:
	terraform fmt -recursive

fmt-check:
	terraform fmt -recursive -check

validate:
	terraform validate

setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)
