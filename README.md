# Terraform Modules for Microsoft Fabric
Welcome to the Terraform Modules for Microsoft Fabric! This repository provides a curated collection of reusable Terraform modules designed to simplify and standardize the provisioning and management of Microsoft Fabric resources. Whether you’re a cloud architect, DevOps engineer, or IT administrator, this library aims to streamline your Infrastructure as Code (IaC) workflows and accelerate your Microsoft Fabric journey.
<!-- markdownlint-disable MD033 -->
<p align="center">
  <p align="center">
<!--    <a href="https://github.com/RuneORakeie/terraform-modules-fabric/actions/workflows/cd.yml"><img src="https://github.com/RuneORakeie/terraform-modules-fabric/actions/workflows/cd.yml/badge.svg?branch=main" alt="CD Tests"></a> -->
<!--    <a href="https://github.com/RuneORakeie/terraform-modules-fabric/actions/workflows/ci.yml"><img src="https://github.com/RuneORakeie/terraform-modules-fabric/actions/workflows/ci.yml/badge.svg" alt="CI Tests"></a></br> -->
<!--    <a href="https://github.com/RuneORakeie/terraform-modules-fabric/discussions"><img src="https://img.shields.io/badge/topic-discussions-yellowgreen.svg" alt="Go to topic discussions"></a> -->
    <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-orange.svg" alt="MIT License"></a>
    <a href="https://github.dev/RuneORakeie/terraform-modules-fabric"><img src="https://img.shields.io/static/v1?logo=visualstudiocode&label=&message=Open%20in%20Visual%20Studio%20Code&labelColor=2c2c32&color=007acc&logoColor=007acc" alt="Open in Visual Studio Code"></a>
    </br>
<!--    <a href="https://registry.terraform.io/modules/gettek/policy-as-code/azurerm/"><img src="https://img.shields.io/badge/dynamic/json?url=https://registry.terraform.io/v2/modules/gettek/policy-as-code/azurerm/downloads/summary&logo=terraform&label=Registry%20Downloads&query=$.data.attributes.total&color=844FBA&logoColor=844FBA" alt="Terraform Registry"></a> -->
  </p>
</p>
<!-- markdownlint-enable MD033 -->

## Mission Statement
Our mission is to empower organizations and individuals to efficiently deploy and manage Microsoft Fabric resources using Terraform by providing a well-structured, open-source library of high-quality, reusable modules.

We believe that adopting Infrastructure as Code and open standards is crucial to achieving consistent, secure, and maintainable cloud infrastructure. By making these modules freely available, we hope to foster a community-driven ecosystem where everyone can benefit from shared best practices, contribute innovative solutions, and help mature the use of Terraform within the Microsoft Fabric ecosystem.

### What This Repository Contains

	•	Modular Terraform Code: Each directory within the modules/ folder represents a standalone Terraform module designed to provision and manage a specific aspect of Microsoft Fabric infrastructure. These modules aim to be composable, well-documented, and easily integrated into new or existing Terraform configurations.
	•	Examples and Reference Architectures: In the examples/ directory, you’ll find reference implementations and sample Terraform configurations demonstrating how to use the modules. These examples serve as a starting point to understand common patterns, architectures, and best practices.
	•	Comprehensive Documentation: Every module includes detailed usage instructions, input/output variable definitions, and links to additional resources. The overarching documentation (found here in the README and in each module’s own README) ensures that both new users and seasoned practitioners can quickly understand and implement the modules.
	•	Testing and CI/CD Integrations: Automated testing and validation scripts ensure that modules maintain high quality and remain functional over time. Integration with popular CI/CD tools helps catch issues early, ensuring that contributed modules and updates continue to meet our standards.

## Getting Started

	1.	Browse the Modules: Explore the modules/ directory to find a suitable module for your use case.
	2.	Read the Documentation: Review each module’s README and consult the examples/ directory for guidance on usage and configuration.
	3.	Integrate into Your Codebase: Incorporate the modules into your Terraform stack by referencing them as a source, adjusting input variables, and running terraform apply.

## Contribution Guidelines

We warmly welcome contributions from the community! Your expertise and insights help keep this library robust, up-to-date, and relevant. To contribute:
	1.	Open an Issue: If you discover a bug, require a new feature, or want to propose an enhancement, please open a GitHub Issue.
	2.	Fork the Repository: Make changes in a dedicated branch of your forked repository.
	3.	Write Clear Documentation & Tests: Ensure your code is thoroughly documented and includes test cases where applicable.
	4.	Submit a Pull Request: Once your changes are complete, open a Pull Request (PR) for review. Include details on what was changed, why it’s important, and how to test it.
	5.	Address Feedback: Our maintainers and community members will review your PR. Please be open to feedback and responsive to requested changes.

For more detailed guidelines, including style conventions, code quality standards, and testing procedures, refer to the CONTRIBUTING.md file.

## Open Source Licensing
This project is licensed under the MIT License. You are free to use, modify, and distribute this software as permitted under the license terms. We encourage users to contribute back any improvements, bug fixes, or enhancements to benefit the wider community.
By working together, we can build a reliable, production-ready set of Terraform modules for Microsoft Fabric resources that will help organizations of all sizes succeed in the cloud. Thank you for your interest, and happy building!