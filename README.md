# terraform-opa-simple-example
[![python](https://img.shields.io/badge/terraform-v0.14.8-blueviolet.svg)](https://www.terraform.io/)
[![pip](https://img.shields.io/badge/conftest-v0.23.0-yellow.svg)](https://www.conftest.dev/)

terraform-opa-simple-example is a project that show people how to create an always compliance infrastructure as code.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Quickstart](#quickstart)
- [Contributing](#contributing)
- [Further reading / Useful links](#further-reading--useful-links)
- [Contact](#Contact)

## Prerequisites

Before you begin, ensure you have met the following requirements:
* You have installed the latest version of [Terraform](https://www.terraform.io/)
* You have installed the latest version of [Conftest](https://www.conftest.dev/)
* You have read about [Open Policy Agent and Rego](https://www.openpolicyagent.org/).

## Quickstart

Clone this repo into new project folder (e.g., my-proj).

```bash
git clone https://github.com/macuartin/terraform-opa-simple-example.git  my-proj
cd my-proj
```
Discard the .git folder.

```bash
rm -rf .git 
```

Edit variables.tf with your aws account_id, aws profile, aws region and a stack_id for your infrastructure

```hcl
stack_id = ""
account_id = ""
profile = ""
region = ""
```

Initialize Terraform and ask it to calculate what changes it will make and store the output in plan.binary
```bash
terraform init
terraform plan --out tfplan.binary
```

Use the command terraform show to convert the Terraform plan into JSON so that OPA can read the plan.
```bash
terraform show -json tfplan.binary > tfplan.json
```

To evaluate the policy against that plan, you hand OPA the policy, the Terraform plan as input, and ask conftest to evaluate.

Policies by default should be placed in a directory called policy, but this can be overridden with the --policy flag.

```bash
conftest test tfplan.json
conftest test tfplan.json --policy policy/main.rego
```

## Contributing

To contribute to <project_name>, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Further reading / Useful links

* [Conftest](https://www.conftest.dev/)
* [Open Policy Agent and Rego](https://www.openpolicyagent.org/).

## Contact

If you want to contact me you can reach me at <macuartin@gmail.com>.

