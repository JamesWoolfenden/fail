variable "block_of_bad" {
  description = "test of secret"
  default     = <<BADSTUFF
{
  'api_1234234',
  'auth_1234234',
  'service_1234234',
  'account_1234234',
  'db_1234234',
  'database_1234234',
  'priv_1234234',
  'private_1234234',
  'client_1234234',
  'db_1234234',
  'database_1234234',
  'key_1234234',
  'password',
  'passwd',
  'pwd',
  'secret',
  'contraseña',
  'contrasena'
}
BADSTUFF
}
