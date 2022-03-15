# fails
# Do not admit privileged containersCheckov CKV_K8S_2
# Do not admit containers wishing to share the host IPC namespaceCheckov CKV_K8S_18
# Do not admit containers wishing to share the host process ID namespaceCheckov CKV_K8S_17
resource "kubernetes_pod" "fail_ipc" {
  metadata {
    name = "terraform-example"
  }

  spec {
    host_ipc = true
    host_pid = true


    container {
      image             = "nginx"
      image_pull_policy = "Never"
      name              = "example"

      security_context {
        privileged = true
      }
      env {
        name  = "environment"
        value = "test"
      }

      port {
        container_port = 8080
      }

      # resources = {
      #   requests = {
      #     memory = "50Mi"
      #   }
      #   limits ={
      #     memory = "50Mi"
      #   }
      # }
      # liveness_probe {
      #   http_get {
      #     path = "/nginx_status"
      #     port = 80

      #     http_header {
      #       name  = "X-Custom-Header"
      #       value = "Awesome"
      #     }
      #   }

      #   initial_delay_seconds = 3
      #   period_seconds        = 3
      # }
    }
    # readiness_probe {
    #     failure_threshold = 3
    #     http_get {
    #       path = "/health"
    #       port = "10254"
    #       scheme = "http"
    #     }
    #     period_seconds = 10
    #     success_threshold = 1
    #     timeout_seconds = 10
    #   }
    # }
    dns_config {
      nameservers = ["1.1.1.1", "8.8.8.8", "9.9.9.9"]
      searches    = ["example.com"]

      option {
        name  = "ndots"
        value = 1
      }

      option {
        name = "use-vc"
      }
    }

    dns_policy = "None"
  }
}
