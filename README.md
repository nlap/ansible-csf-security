# Ansible CSF Security
This ansible role provides a good server security baseline:

* Installs ConfigServer Firewall (CSF) for:
	* Easy firewall management
	* Intrusion detection/prevention
	* Various other security features
* Configures SSH for better security, including:
	* Moving to alternate listen port
	* Disabling password auth
* Adds script to check other system components for basic security check
	* /etc/csf/servercheck.pl

It's up to you to inform yourself of security best practices, and understand your stack's own security risks. This is just a simple baseline configuration.

Requirements
-----------
**Note**: Make sure your SSH public key is under ~/.ssh/authorized_keys, or you can be locked out of your server after running this role  

CSF will be in testing mode after running this script and will stop in 5 minutes. Disable testing mode (in csf.conf), and restart CSF (csf -r) after testing that the firewall is configured properly.

Role Variables
--------------
	- csf_sec_ssh_port: 22   # moves the SSH port

Dependencies
-----------
None

Example Playbook
--------------

	- hosts: webservers
	   vars:
        - csf_sec_ssh_port: 9090
      roles:
        - { role: nlap.ansible-csf-security }

License
-------
MIT