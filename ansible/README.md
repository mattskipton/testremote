# Ansible Automation in the Unified Repo World

## Ansible Collateral
All of your project specific content shall be created in the `ansible` subfolder in the root of the lab repository.  This will include playbooks, inventory files, variable files, etc.

## Ansible Roles and Collections
If you project include **roles** and **collections** you will need to have those components installed on the Ansible Tower Server.  Luckily for you, Ansible Tower makes this really easy.

At the root of the project directory you will see two folders named `roles` and `collections`.  Including a file named `requirements.yml` in each of these directories will facilitate the dynamic discovery and installation of the dependent code for your automation.

Here is an example of a `roles/requirements.yml` file:

```yaml
roles:
  # from galaxy
    - src: yatesr.timezone

    # from GitHub
    - src: https://github.com/bennojoy/nginx

    # from GitHub, overriding the name and specifying a specific tag
    - src: https://github.com/bennojoy/nginx
    version: master
    name: nginx_role

    # from a webserver, where the role is packaged in a tar.gz
    - src: https://some.webserver.example.com/files/master.tar.gz
    name: http-role

    # from Bitbucket
    - src: git+http://bitbucket.org/willthames/git-ansible-galaxy
    version: v1.4

    # from Bitbucket, alternative syntax and caveats
    - src: http://bitbucket.org/willthames/hg-ansible-galaxy
    scm: hg

    # from GitLab or other git-based scm
    - src: git@gitlab.company.com:mygroup/ansible-base.git
    scm: git
    version: "0.1"  # quoted, so YAML doesn't parse this as a floating-point value
```
> above taken from: https://galaxy.ansible.com/docs/using/installing.html

...and an example `collections/requirements.yml`

```yaml
collections:
  # Install a collection from Ansible Galaxy.
  - name: geerlingguy.php_roles
    version: 0.9.3
    source: https://galaxy.ansible.com
```
> above take from: https://docs.ansible.com/ansible/devel/user_guide/collections_using.html#install-multiple-collections-with-a-requirements-file

If you are not using roles or collections don't add a requirements.yml file.

# PATHs

Ansible Tower will automatically install the roles and collections in the `./roles` and `./collections` subdirectories.

Your playbooks will find them based on the configuration attributes in the `./ansible.cfg`. These settings are required since these roles and collections haven't been installed in a path that is known by default.  The `ansible.cfg` file is required to be at the root of the project for Ansible Tower to utilize the values.


```ini
[defaults]
roles_path=./roles
collections_path=./collections
```

If there are other settings that you need to override from the defaults for your automation you can update the `ansible.cfg` file but this is very uncommon.

## Building a Tower Project

## Building a Tower Template

## Examples

#### Ex 1: Run show command on a device, register and write out to a file as attachment to email
```yaml
  tasks:
    - name: Get License info from BIG-IP
      bigip_command:
        commands: show sys license
        provider: "{{ provider }}"
      delegate_to: localhost
      register: license_info
      when: inventory_hostname == provider.server

    - name: Copy license info to a file
      copy:
        content: "{{ license_info.stdout_lines | to_nice_json }}"
        dest: "./license_info_bigip"
      when: inventory_hostname == provider.server
```

#### Ex 1: Hosts file
```yaml
[smtp]
10.253.181.39

[bigip]
10.246.48.87
```

#### Ex 1: License show report
```yaml
[
    [
        "Sys::License",
        "Licensed Version    5.3.0",
        "Registration key    MTQSQ-QVQZR-VSFOP-HDYHA-HIVBYLC",
        "Licensed On         2021/02/23",
        "License Start Date  2021/02/22",
        "License End Date    2021/04/10",
        "Service Check Date  2020/11/26",
        "Platform ID         BIG-IQ-Pool",
        "",
        "Active Modules",
        "  MSP, APM (500 CCU) (NSQUWWY-MWWDCDS)",
        "    Anti-Virus Checks",
        "    Base Endpoint Security Checks",
        "    Firewall Checks",
        "    Network Access",
        "    Secure Virtual Keyboard",
        "    APM, Web Application",
        "    Machine Certificate Checks",
        "    Protected Workspace",
        "    Remote Desktop",
        "    App Tunnel",
        "  MSP, Best + FIPS, 10 Gbps (OAWIYKK-DAWUGVP)",
        "    Rate Shaping",
        "    SDN Services, VE",
        "    SSL, VE",
        "    ASM, VE",
        "    DNS-GTM, Base, 10Gbps",
        "    Max Compression, VE",
        "    AFM, VE",
        "    DNSSEC",
        "    GTM Licensed Objects, Unlimited",
        "    DNS Licensed Objects, Unlimited",
        "    DNS Rate Fallback, 250K",
        "    GTM Rate Fallback, 250K",
        "    GTM Rate, 250K",
        "    DNS Rate Limit, 250K QPS",
        "    Routing Bundle, VE",
        "    VE, Carrier Grade NAT (AFM ONLY)",
        "    PSM, VE"
    ]
]
```

#### Ex. 1 - Runtime
```yaml
ansible-playbook -i hosts health-report.yml
```