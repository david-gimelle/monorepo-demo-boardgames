import subprocess

def run_command(command, cwd=None):
    result = subprocess.run(command, shell=True, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode != 0:
        print(f"Error running command: {command}")
        print(result.stdout.decode())
        print(result.stderr.decode())
        raise Exception(f"Command failed with return code {result.returncode}")
    else:
        print(result.stdout.decode())

def test_react_project():
    print("Running tests for React project...")
    run_command("npm install", cwd="reactjs-boardgames")
    run_command("npm test", cwd="reactjs-boardgames")

def test_nodejs_project():
    print("Running tests for Node.js project...")
    run_command("npm install", cwd="nodejs-boardgames-api")
    run_command("npm test", cwd="nodejs-boardgames-api")

def test_python_project():
    print("Running tests for Python project...")
    run_command("poetry install", cwd="python-boardgames-api")
    run_command("poetry run pytest", cwd="python-boardgames-api")

def test_java_project():
    print("Running tests for Java project...")
    run_command("./gradlew test", cwd="java-boardgames-api")

def main():
    try:
        test_react_project()
        test_nodejs_project()
        test_python_project()
        test_java_project()
        print("All tests completed successfully!")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()