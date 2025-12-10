# static-website-s3-terraform

This repo basically shows how I hosted a static website on AWS S3 using Terraform.  
No AWS console login, no drag-drop uploads — everything automated.

---

##  Why I built this?

Manually going to console → creating bucket → uploading files → changing permissions  
was giving major **headache**

So I went:

> “Main code likhunga, terraform apply karunga, aur website LIVE ho jayegi.”

And that's exactly what happened 

---

##  What this automation does

✔ Creates an S3 bucket  
✔ Enables website hosting mode  
✔ Uploads HTML, PDF & Image  
✔ Applies correct bucket policy  
✔ Outputs final live website URL  

One command → everything ready.

---

##  Files included & why I added them

| File | Why this exists |
|-------|----------------|
| `main.tf` | Bucket creation + hosting config + uploads + output |
| `index.html` | Actual website page hosted online |
| `resume.pdf` | A downloadable resume in the website |
| `adityap.jpg` | Image file hosted publicly |

Chhota project → legit results 

---

##  Deployment Process

Bas ye teen commands chalaye:

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

Deployment ke baad output mila:

```
website_url = "http://bucketname.s3-website-us-east-1.amazonaws.com"
```

Link open kara → Website LIVE 

---

##  What’s next?

Ho sakta hai future mein:

✨ Add CloudFront distribution  
✨ Attach domain from Route53  
✨ Enable HTTPS  
✨ Upload full portfolio site  
✨ Store Terraform state in remote backend  

---

Small repo → Clean infrastructure → Public hosted site.  
This is how real DevOps looks 
