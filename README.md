<h1 align="center">Project-Lambda-Uploader</h1>

<br>



<details>
  <summary>Table Of Contents</summary>

  - <a href="https://github.com/Brimah-Khalil-Kamara/Project-Lambda-Uploader?tab=readme-ov-file#-description">Description</a>
  - <a href="https://github.com/Brimah-Khalil-Kamara/Project-Lambda-Uploader?tab=readme-ov-file#-tools--technologies-used">Tools & Technologies Used</a>
  - <a href="https://github.com/Brimah-Khalil-Kamara/Project-Lambda-Uploader?tab=readme-ov-file#%EF%B8%8F-step-1-create-repository">Step 1 Create Repository</a>
  - <a href="https://github.com/Brimah-Khalil-Kamara/Project-Lambda-Uploader?tab=readme-ov-file#-tools--technologies-used">Step 2 Connect Local Project With Git Repository</a>


  </details>


<h2 align="center">📌 Description</h2>

<br>

This project demonstrates an event-driven AWS architecture. It deploys a simple web page on an EC2 instance that allows users to upload images to an S3 bucket. Each upload triggers a Lambda function that reads and logs the Content-Type of the uploaded file. To create the Terraform configuration for the Architecture the following will be deployed

<br>

- EC2 instance with a simple web server (Flask)
- S3 bucket for uploads
- Lambda function to read Content-Type
- S3 event trigger for Lambda

<br>

The Terraform files will define the infrastructure, while the Python file will define the Lambda function code.

<br>
We’ll keep it simple and functional so you can deploy it easily.


<br>

<br>

<h2 align="center">🛠 Tools & Technologies Used</h2>

<br>

- Terraform  (_Infrastructure as Code to provision AWS networking resources_)  
- AWS  (_VPC, Subnets, NAT Gateway, Router, and Storage Bucket_)  
- GitHub  (_Source control for Terraform scripts) 
- Visual Studio Code

<br>

<br>

<h2 align="center">🗒️ Step 1 Create Repository</h2>

<br>

Create a blank repository name it whatever you want and check the readme box and select create. This will allow you to connect the local project to Github.



<br>

<br>

<h2 align="center">🗒️ Step 2 Connect Local Project With Git Repository</h2>

<br>

In some cases you might want to clone the repository created. In my case I cloned using 

```bash
git clone git@github.com:Brimah-Khalil-Kamara/Project-Lambda-Uploader.git
```

When you clone a GitHub repo, Git automatically creates origin for you and sets it to the URL you cloned from. In other cases you might connect yor local project if youve been working locally with your remote git repository. 

In this case you would using gitbash in the right folder project path use the git init command. 

<br>

```bash
git init
```

<br>

What this does is it initialises an empty repository. To connect it to remote to push the existing repository the git remote add origin command is used 

<br>

```bash
git remote add origin git@github.com:Brimah-Khalil-Kamara/Project-Lambda-Uploader.git
```


<br>






