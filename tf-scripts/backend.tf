terraform {
  backend "gcs"{
    bucket = "terraform1-state-renderer"
    prefix = "dev"
  }
}
