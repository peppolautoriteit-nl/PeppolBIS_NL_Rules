# Peppol BIS 3 Country-specific Rules for NL Draft

This repository contains the work-in-progress specification and validation
rules to add country-specific rules for the Netherlands to Peppol BIS 3.

The documents and validation artefacts in this repository do NOT represent
a final specification, and should NOT be used in production.

Once the specification is complete and approved, it will be published
separately, and the validation rules will be submitted to Peppol. This
repository will then be archived.

# Contents of this repository

| Directory | Description |
| --------- | ----------- |
| documents | The specification itself, including a description of the business rules and the relevant references to NLCIUS. Converted to Markdown for the purpose of this repository |
| validation | The work-in-progress validation files |
| validation/schematron | The schematron source files |
| validation/xsl | The XSLT(2) style sheets generated from the schematron files |
| tests | Test XML documents to check the validation files |


# Reporting issues or requests

You can report issues or requests with either the Issues link above, or by forking the repository and creating a Pull Request. Alternatively, you can send a direct request to the [NPa](https://peppolautoriteit.nl/cms/view/11833f70-8653-41f6-804c-7265982fe174/contact). No rights can be derived from submissions.

Change requests can consist of:
1. A change in both the specification and the schematron validation, i.e. removal, addition, or full change of a business rule
2. A change in the specification, but not in the schematron validation, i.e. a clarification or change of description
3. A change in a schematron validation rule, but not in the specification, i.e. a bug in the implementation

The final result of this process will be submitted to the Service Provider community for approval.

*Copyright 2021, Netherlands Peppol Authority. All rights reserved*