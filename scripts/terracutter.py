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
import argparse


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


def main():
    parser = create_parser()
    parser.parse_args()


if __name__ == '__main__':
    main()
