# Copyright 2022 Arie Bregman
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
# ================================================
# A script for creating Terraform project template
#
# Usage: terracutter --project NAME
# ================================================
import argparse
import os


def create_parser():
    """Returns parser with several predefined app arguments.

    Returns:
        argparse.ArgumentParser: argument parser instance
    """
    parser = argparse.ArgumentParser(
        description='Generate Terraform project skeleton')
    parser.add_argument('--project', type=str,
                        nargs=1, help='The name of the project', required=True)
    return parser


def create_project_root(project):
    """Creates project root directory with sub-directories.

    Args:
        project (str): the name of the project
    """
    os.makedirs(project)


def main():
    parser = create_parser()
    args = parser.parse_args()

    create_project_root(args.project)


if __name__ == '__main__':
    main()
