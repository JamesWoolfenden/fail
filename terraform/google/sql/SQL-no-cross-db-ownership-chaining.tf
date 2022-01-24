
resource "google_sql_database_instance" "db" {
  name             = "db"
  database_version = "SQLSERVER_2017_STANDARD"
  region           = "us-central1"
  settings {
    tier = "any_old_guff"
  }
}
