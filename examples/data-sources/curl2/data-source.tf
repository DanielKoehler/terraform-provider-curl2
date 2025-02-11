terraform {
  required_providers {
    curl2 = {
      source  = "DanielKoehler/curl2"
      version = "1.7.1"
    }
  }
}

provider "curl2" {
  #  disable_tls = true
  #  timeout_ms = 500
  #  retry {
  #    retry_attempts = 5
  #    min_delay_ms = 5
  #    max_delay_ms = 10
  #  }
}

data "curl2" "getPosts" {
  http_method = "GET"
  uri         = "https://jsonplaceholder.typicode.com/posts"
  #  auth_type = "Basic"
  #  basic_auth_username = "<UserName>"
  #  basic_auth_password = "<Password>"
  #  headers = {
  #    Accept = "*/*"
  #  }
}

output "all_posts_response" {
  value = jsondecode(data.curl2.getPosts.response.body)
}

output "all_posts_status" {
  value = data.curl2.getPosts.response.status_code
}

data "curl2" "postPosts" {
  http_method = "POST"
  uri         = "https://jsonplaceholder.typicode.com/posts"
  data        = "{\"title\":\"foo\",\"body\":\"bar\",\"userId\":\"1\"}" // data could be json..
  #  auth_type = "Bearer"
  #  bearer_token = "<Any Bearer Token>"
  #  headers = {
  #    Accept = "*/*"
  #    Content-Type = "application/json"
  #  }
}

output "post_posts_output" {
  value = data.curl2.postPosts.response
}
