## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

<img width="528" alt="image" src="https://user-images.githubusercontent.com/92961860/153985912-ee01bae9-491b-4d20-a54a-39c2bee27b0c.png">
Azure Diagrams/Azure ELK Stack 2022-02-14 22-01-32.png 

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Filebeat.

  - Web Vm's configuration playbook
  - Elk Server Configuration Playbook
  - Filebeat and Metricbeat Installation playbook

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- What aspect of security do load balancers protect? 
- Load balancers protect by helping to distribute traffic evenly across the servers that mitigates DoS attacks. Also, because of its's significant importance in the computing world, load balancers defend/protect several organizations against distributed denial-of-service (DDoS) attacks. This is caried out by by shifting attack traffic from the corporate server to a public cloud provider.

- What is the advantage of a jump box? The Jump box is identical to a gateway router. It is exposed to the public internet. it sits in front of other machines that are not exposed to the public internet. It helps provide a measure of security to other compute resources. It serves as a single entry point. It controls access to the other machines by allowing connections from specific IP addresses, and forwarding to those machines.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system logs.

- What does Filebeat watch for? 
- "It monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing." 

- What does Metricbeat record? 
- "Metricbeat helps to monitor your servers by collecting metrics from the system and services running on the server, such as: Apache."

The configuration details of each machine may be found below.

| Name           | Function            | IP Address   | Operating System |
|--------------- |---------------------|--------------|------------------|
| Jump Box       | Gateway             | 10.0.0.4     | Linux            |
| web 1          | Web Server          | 10.0.0.5     | Linux            |
| Web 2          | Web Server          | 10.0.0.6     | Linux            |
| Load Balancer  | Traffic Distributor | 20.124.96.253| N/A              |
| ELK Server     | Network Monitor     | 10.1.0.4     | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 
Only the JumpBox and Load balancer machines can accept connections from the Internet. Access to these servers are only allowed from the following IP addresses:
- 23.96.23.32 can access the Jump Box
- HTTP web traffic can access the Load Balancer

Machines within the network can only be accessed by:
- SSH connection from the Jump Box via Pot 22
- HTTP traffic from the load balancer via Port 80

- Which machine did you allow to access your ELK VM? The Local Machine
- What was its IP address? 23.96.23.32

A summary of the access policies in place can be found in the table below.

| Name          | Publicly Accessible | Allowed IP Addresses  |
|---------------|---------------------|---------------------- |
| Jump Box      | Yes                 | 23.96.23.32           |
| Web-1         | No                  | 10.0.0.4 20.124.96.253|
| Web-2         | No                  | 10.0.0.4 20.124.96.253|
| Load Balancer | Yes                 | Any                   |
| ELK Server    | Yes                 | 20.122.166.144        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because not performing it manually makes the configuration of a new machine much easier and faster.

- What is the main advantage of automating configuration with Ansible? 
- It enables configuration of several servers at scale, which ebnables faster configurations.

The playbook implements the following tasks:
- Install Docker
- Install Python Pip3
- Install Docker Python Module
- Update vm.max_map_Count to 262144
- Download and launch the ELK docker container
- The following screenshot displays the result of running docker ps  afer successfully configuring the ELK instance. 

'docker ps' Results

![image](https://user-images.githubusercontent.com/92961860/155660543-12bdb370-df83-463c-9bc6-c2ba45a9803e.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.4
- 10.0.0.5
- 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat:  
- "It monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing."


- Metricbeat:
- "It collects metric data from your target servers, this could be operating system metrics such as CPU or memory or data related to services running on the server. It can also be used to monitor other beats and ELK stack itself"

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat Configuration file to /etc/ansible/files/filebet-configuration.yml
- Update the Filebea Configuration file to include the private IP address of the virtual machine that has been configured to run Elk.
- Run the playbook, and navigate to http://[elk_server_ip_address to check that the installation worked as expected.

FAQ & Answers:

- Which file is the playbook? 
-   Filebeat-playbook.yml

- Where do you copy it?_
    /etc/ansible/roles directory
    
- _Which file do you update to make Ansible run the playbook on a specific machine? 

- How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
 
 [webservers]
     
 <img width="609" alt="image" src="https://user-images.githubusercontent.com/92961860/155654630-9b3ae32b-f140-4645-9f1b-c99dea3c6770.png">
 
 [elk]
     
 <img width="612" alt="image" src="https://user-images.githubusercontent.com/92961860/155654780-b313ab04-d6b8-49d9-a907-c0993791cbe2.png">
		


- _Which URL do you navigate to in order to check that the ELK server is running?
  
      http://[ELK_SERVER_PUBLIC_IP_ADDRESS]:5601/app/kibana
 
Commands needed to run to... (download the playbook, & file updates)

-Command: To copy File beat cnfiguration to the Ansible container:

curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/filebeat-config.yml

-Command: to edit Filebeat Configuration file:

 vi /etc/ansible/files/filebeat-config.yml
  
  
- Edit configuration file by scrolling to line #1106 and replace the IP address with the IP address of your ELK machine.

output.elasticsearch:
hosts: ["10.1.0.4:9200"]
username: "elastic"
password: "changeme"


- Scroll to line #1806 and replace the IP address with the IP address of your ELK machine.
setup.kibana:
host: "10.1.0.4:5601"

- Save and exit

- Command to copy the Metricbeat Configuration file to the Ansible container:

- curl https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > /etc/ansible/files/metricbeat-configuration.yml

- Command: To edit metricbeat configuration file:
  vi /etc/ansible/files/metricbeat-config.yml
  
  The same changes made in the filebeat file shoulf be made in the metricbeat configuration file.
  
- Command to run the playbook:

  ansible-playbook /etc/ansible/roles/filebeat-playbook.yml
  
  
 
