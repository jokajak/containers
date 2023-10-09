#!/usr/bin/env python3

import re
import argparse


def parse_dockerfile(dockerfile_path):
    # Read the Dockerfile content from the file
    with open(dockerfile_path, "r") as file:
        dockerfile = file.read()

    # Regular expression patterns to match version numbers
    terraform_pattern = r"hashicorp/terraform:(\d+\.\d+\.\d+)"
    tf_runner_pattern = r"ghcr.io/weaveworks/tf-runner:(\S+)"
    bw_cli_pattern = r"@bitwarden/cli@(\S+)"

    # Find the matches for each software
    terraform_match = re.search(terraform_pattern, dockerfile)
    tf_runner_match = re.search(tf_runner_pattern, dockerfile)
    bw_cli_match = re.search(bw_cli_pattern, dockerfile)

    # Extract the versions in the desired order
    terraform_version = terraform_match.group(1) if terraform_match else ""
    tf_runner_version = tf_runner_match.group(1) if tf_runner_match else ""
    bw_cli_version = bw_cli_match.group(1) if bw_cli_match else ""

    # Concatenate the versions with '+' sign in the desired order
    version_string = f"{tf_runner_version}+{terraform_version}+{bw_cli_version}"

    return version_string


def get_latest(channel_name):
    # channel_name is ignored
    return parse_dockerfile("../Dockerfile")


def main():
    parser = argparse.ArgumentParser(
        description="Parse Dockerfile for version numbers and join them with a + sign."
    )
    parser.add_argument(
        "dockerfile_path", help="Path to the Dockerfile", default="../Dockerfile"
    )

    args = parser.parse_args()
    dockerfile_path = args.dockerfile_path

    version_string = parse_dockerfile(dockerfile_path)
    print(version_string)


if __name__ == "__main__":
    main()
