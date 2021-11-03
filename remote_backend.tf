terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "roman-gcp-training"
    workspaces {
      name = "hashicat-gcp"
    }
  }
}
