
# (PART) Enrichment {-}

# Using the cloud

**STATUS: Under construction.**

**Required reading**

- 

**Recommended reading**

- Edmondson, Mark, 2020, 'googleComputeEngineR documentation', version 0.3.0.9000, freely available at: https://cloudyr.github.io/googleComputeEngineR/.
- McDermott, Grant R., 2020, 'Cloud computing with Google Compute Engine', *Data Science for Economists*, freely available at: https://raw.githack.com/uo-ec607/lectures/master/14-gce/14-gce.html.
- Morris, Mitzi, 2020, 'Stan Notebooks in the Cloud', freely available at: https://mc-stan.org/users/documentation/case-studies/jupyter_colab_notebooks_2020.html.

**Key concepts/skills/etc**

- Benefits/costs of cloud.
- Getting started in the cloud.
- Starting virtual machines with R Studio.
- Stopping virtual machines.





## Introduction

Cloud benefits:
- Costs can be reduced, or more easily amortized.
- Can scale as you need.
- Many platforms are already sorted out e.g. R Studio just works.


I stole this from someone and I can't remember who, but the cloud is another name for 'someone else's computer'. That's it. Nonetheless, learning to use someone else's computer can be great for a number of reasons including:

1) Scalability: It can be quite expensive to buy a new computer, especially if you only need it to run something every now and then, but by using someone else's computer, you can just rent for a few hours or days. 
2) Portability: If you can shift your analysis workflow from your laptop to the cloud, then that suggests that you are likely doing good things in terms of reproducibility and portability. At the very least, your code is capable of running on your laptop and the cloud.
3) Set-and-forget: If you are doing something that will take a while, then it can be great to not have to worry about your laptop's fan running overnight, or your partner/baby/pet/housemate/etc accidently closing your computer, or not being able to watch Netflix on that same computer. 

When you use the cloud you are running your code on a 'virtual machine'. This is a part of a larger bunch of computers that has been designed to act like a computer with specific features. For instance you may specify that your virtual machine has 8 GB RAM, 128 storage, and 4 CPUs. Your VM would then act like a computer with those specifications. The cost to use cloud options increases based on the specifications of the virtual machine that you choose.

There are a few downsides:

- Cost: While most cloud options are cheap, they are rarely free. (While there are free options, they tend to not be very powerful, and so you end up having to pay to get a computer that is better than your laptop.) To give you an idea of cost, when I use AWS, I typically end up spending five to ten dollars for a couple of days. So it's fairly cheap, but it's not nothing. It's also pretty easy to accidently forget about something and run up an unexpected bill, especially initially. 
- Public: It is pretty easy to make mistakes and accidently make everything public.
- Time: It takes time to get set-up and comfortable on the cloud.

In these notes we are going to introduce the cloud starting with some options that pretty much anyone can (and should) take advantage of: Google Colab; and then moving to more general cloud options including Google Compute Engine, AWS, and Azure, which may be useful to some of you in some cases. If you want to get a job in industry, then the advice of pretty much every speaker from industry at the Toronto Data Workshop is that you learn at least one of those cloud options. For instance, Munich Re is an Azure shop, Receptiviti uses AWS, etc.




## Google Colab

Google Colab is similar to R Studio Cloud, in that it is set-up to allow you to just log in and get started. In this case, you need a Google account. It's better than R Studio because they have more resources to put into its development and you can use GPUs, but but on the other hand it is designed for Python, and while we can use it for R, it's not really focused on that.

To get started you need to tell Google Colab that you want to use R. You can do this by using this: https://colab.research.google.com/notebook#create=true&language=r.

At this point you have a Jupyter notebook open that will run R. (But it is not a R Markdown document.) You can install packages as normal, e.g. `install.packages("tidyverse")`, and then call the package e.g. `library(tidyverse)`.

Google Colab is a good option if you have a good reason for using the broader capabilities that it has. If you want to go deeper into that then the Morris reading has a bunch of options that you can explore, but as Morris puts it 'Colab is a gateway drug - for large-scale processing pipelines you'll need to move up to Google Cloud Platform or one of its competitors AWS, Azure, etc.' and that is what we will do now.



## AWS

Amazon Web Services is a cloud service from Amazon. To get started you need an AWS Developer account which you can create here: https://aws.amazon.com/developer/.

After you have created an account, you need to select a region where the computer that you will access is located. After this, you will want to "Launch a virtual machine" (with EC2). 

The first step is to choose an Amazon Machine Image (AMI). This provides the details of the computer that you will be using. For instance, your local computer may be a MacBook running Catalina. Helpfully, Louis Aslett provides a bunch of these already set up - http://www.louisaslett.com/RStudio_AMI/. You can either select the code for the region that you registered for, or you can click on the link. The benefit of this AMI is that they are set-up specifically for R Studio, however the trade-off is that they are a little out-dated, as they were compiled in May 2019.

In the next step you can choose how powerful the computer will be. The free tier has a fairly basic computer, but you can choose better ones when you need them. At this point you can pretty much just launch the instance. If you start using AWS more seriously then you should look into different security settings.

Your instance is now running. You can go to it by pasting the 'public DNS' into a browser. The username is 'rstudio' and the password is your instance ID.

You should have R Studio running, which is exciting. The first thing to do is probably to change the default password using the instructions in the instance.

You don't need to install, say, the tidyverse, instead you can just call the library and keep going. You can see the list of packages that are installed with `installed.packages()`. For instance, `rstan` is already installed. And you can use GPUs if you want.

Perhaps as important as being able to start an AWS instance is being able to stop it (so that you don't get billed). The free tier is pretty great, but you do need to turn it off. To stop an instance, in the AWS instances page, select it, then 'Actions -> Instance State -> Terminate'.




## Google Compute Engine

The main R package related to Google Compute Engine seems to be: `googleComputeEngineR`.

The reading from Grant McDermott is a pretty good walk-through. 


## Azure

There are a bunch of R packages related to Azure here: https://github.com/Azure/AzureR.






## Exercises and tutorial

### Exercises

### Tutorial


