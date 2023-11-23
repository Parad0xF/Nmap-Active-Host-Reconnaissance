import subprocess

def run_nmap(command_number, scan_type, output_file):
    """
    Function to run an nmap command and check its success.
    """
    command = f"nmap {scan_type} {ip} -oN {output_file}"
    print(f"Running command {command_number}: {command}")

    try:
        subprocess.run(command, check=True, shell=True)
        print(f"Command {command_number} successful.")
    except subprocess.CalledProcessError:
        print(f"Command {command_number} failed. Exiting.")
        exit(1)

# IP Address Range
ip = "192.168.1.1/24"

# Run the commands
commands = [
    (1, "-sn -PA", "arp-scan-results.txt"),
    (2, "-sn -PU", "UDP-scan-results.txt"),
    (3, "-sn -PE", "ECHO-scan-results.txt"),
    (4, "-sn -PP", "ICMP-Timestamp-scan-results.txt"),
    (5, "-sn -PM", "ICMP-Mask-scan-results.txt"),
    (6, "-sn -PS", "TCP-SYN-scan-results.txt"),
    (7, "-sn -PA", "TCP-ACK-scan-results.txt"),
    (8, "-sn -PO", "TCP-ACK-scan-results.txt")
]

for cmd_number, scan_opt, output in commands:
    run_nmap(cmd_number, scan_opt, output)

print("Successfully scanned the environment")


""""
Key Points:
Use of subprocess: Python's subprocess module is used to run shell commands (in this case, nmap).

Function run_nmap: Encapsulates the logic for running each nmap command. It prints the command being run, executes it, and checks for success or failure.

Exception Handling: The script uses a try-except block to handle any errors that occur when running a command. If a command fails, the script prints an error message and exits.

Command Parameters: The run_nmap function takes the command number, nmap options, and output file as arguments, similar to the Bash script.

Loop Through Commands: The script iterates over a list of tuples containing the command number, scan options, and output file names, reducing repetition.

Shell=True Warning: The shell=True argument in subprocess.run can be a security hazard if used with untrusted input. Since the script uses hardcoded, trusted inputs, it's safe in this context.

This Python script achieves the same functionality as the Bash script but in a more Pythonic way, with improved readability and maintainability.
"""