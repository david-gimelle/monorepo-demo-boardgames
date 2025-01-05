import subprocess
import sys
import os
import argparse

def run_command(command):
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    while True:
        output = process.stdout.readline()
        if output == '' and process.poll() is not None:
            break
        if output:
            print(output.strip())
    stderr = process.stderr.read()
    returncode = process.poll()
    if returncode != 0:
        print(f"Error running command: {command}")
        print(stderr)
        sys.exit(returncode)

def install_poetry(version):
    print(f"Installing Poetry version {version} with pip...")
    run_command(f"pip install poetry=={version}")

def verify_poetry_installation():
    print("Verifying Poetry installation...")
    run_command("poetry --version")

def delete_lock_file():
    if os.path.exists("poetry.lock"):
        print("Deleting existing poetry.lock file...")
        os.remove("poetry.lock")

def install_dependencies():
    print("Installing dependencies with Poetry...")
    run_command("poetry install --no-root -vv")

def run_tests():
    print("Running tests with pytest...")
    run_command("poetry run pytest -v")

def build_docker_image(image_name):
    print(f"Building Docker image {image_name}...")
    run_command(f"docker build --progress=plain -t {image_name} .")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Install poetry, run test and Build Docker image")
    parser.add_argument("--skip-tests", action="store_true", help="Skip running tests")
    parser.add_argument("--skip-install-poetry", action="store_true", help="Skip installing Poetry")
    parser.add_argument("--skip-build-images", action="store_true", help="Skip building Docker image")
    args = parser.parse_args()

    poetry_version = "1.1.11"  # Specify the desired Poetry version here
    docker_image_name = "python-boardgames-api"  # Specify the desired Docker image name here

    if not args.skip_install_poetry:
        install_poetry(poetry_version)
        verify_poetry_installation()
        delete_lock_file()
        
    install_dependencies()    

    if not args.skip_tests:
        run_tests()

    if not args.skip_build_images:
        build_docker_image(docker_image_name)    