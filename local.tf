locals {
  prefex = substr("lzwebserver${var.project}${var.environment}", 3, 24)
}

