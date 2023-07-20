import subprocess
from concurrent.futures import ThreadPoolExecutor
import itertools

def get_used_ports():
    output = subprocess.check_output(["netstat", "-tuln"])
    lines = output.decode("utf-8").split("\n")
    used_ports = {line.split()[-1].split(":")[-1] for line in lines if "LISTEN" in line}
    return used_ports

def allow_ports(ports):
    subprocess.run(["ufw", "allow", str(ports)])

def deny_port(port):
    subprocess.run(["ufw", "deny", str(port)])

def main():
    used_ports = get_used_ports()
    allowed_ports = {22, 80, 443}

    with ThreadPoolExecutor() as executor:
        executor.map(allow_ports, allowed_ports)

    with ThreadPoolExecutor() as executor:
        executor.map(deny_port, itertools.filterfalse(lambda p: p in used_ports or p in allowed_ports, range(1, 65536)))

    subprocess.run(["ufw", "default", "deny", "incoming"])
    subprocess.run(["ufw", "default", "allow", "outgoing"])
    subprocess.run(["ufw", "enable"])

if __name__ == "__main__":
    main()
