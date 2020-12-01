
data "aws_kms_secrets" "code_build_env_vars" {
  secret {
    name    = "access_key"
    payload = "AQICAHgvAltrAJ8P9A31p35WhGJKovAxXTroWy6EdV6Nxono0wEpc6f6dP/4Z33LyUXEkJimAAAAcjBwBgkqhkiG9w0BBwagYzBhAgEAMFwGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMMipUrfS9Jgc5RjFzAgEQgC8KFHsZ1x0r9siyiyQzJgsDyz99shJG75UNzNBd9L0aqHLHeI3dT5MvHEIrBiOhdQ=="
  }
  secret {
    name    = "secret_key"
    payload = "AQICAHgvAltrAJ8P9A31p35WhGJKovAxXTroWy6EdV6Nxono0wHYNiFl566h1vDiEF5XlfGCAAAAhzCBhAYJKoZIhvcNAQcGoHcwdQIBADBwBgkqhkiG9w0BBwEwHgYJYIZIAWUDBAEuMBEEDH1XVzgYME7LNsyWLwIBEIBD4PV0eQVovIZoXk0y1i/IHi56SFp939tOusKh7wfIBW5CICAmyYSZB9x2pGmx75sPewpvqwMJYI7q+GiaVhy2bv9LNg=="
  }
  secret {
    name    = "github_token"
    payload = "AQICAHgvAltrAJ8P9A31p35WhGJKovAxXTroWy6EdV6Nxono0wGCoTN8wsaZHi5tW7E2sfc0AAAAhzCBhAYJKoZIhvcNAQcGoHcwdQIBADBwBgkqhkiG9w0BBwEwHgYJYIZIAWUDBAEuMBEEDI7L4vBbOxdpnB2DcwIBEIBDreqn5YL9AYaP5LnOUQliR1pLrsvjiGI5lwPHbyhlblZFd2Bt/YEtkw4VyYIvP4m1BbkXbcDt+BlsvNH2atRi9geoSA=="
  }

}

module "pipeline" {
  source               = "git@github.com:bitpesa/terraform-reusable-modules.git//modules/codebuild?ref=v1.1.0"
  environment_name     = "staging"
  eks_cluster_name     = "none"
  service_name         = "incubator-superset"
  ecr_repository_uri   = "753253020381.dkr.ecr.eu-west-1.amazonaws.com/superset"
  eks_kubectl_role_arn = "none"
  github_organization  = "bitpesa"
  github_repository    = "incubator-superset"
  github_branch        = "master"
  github_token         = data.aws_kms_secrets.code_build_env_vars.plaintext["github_token"]
  access_key           = data.aws_kms_secrets.code_build_env_vars.plaintext["access_key"]
  secret_key           = data.aws_kms_secrets.code_build_env_vars.plaintext["secret_key"]
  enable_pr_build      = false
  build_compute_type   = "BUILD_GENERAL1_LARGE"
  aws_region           = "eu-west-1"
}
