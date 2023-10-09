#!/usr/bin/env python3

import re
import argparse


def parse_dockerfile(dockerfile_path):
    # Read the Dockerfile content from the file
    with open(dockerfile_path, "r") as file:
        dockerfile = file.read()

    # Regular expression pattern to match version numbers
    pattern = r"([\w.-]+:\d+\.\d+\.\d+)"

    # Find all matches in the Dockerfile
    matches = re.findall(pattern, dockerfile)

    # Join the matches with '+' sign
    version_string = "+".join(matches)

    return version_string


def get_latest():
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
