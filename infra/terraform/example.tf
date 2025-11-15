# Ejemplo vulnerable (inseguro) y ejemplo bueno

# --- grupo de seguridad vulnerable (inseguro) ---
resource "aws_security_group" "bad-SSH" {
  name = "Bad_SSH" # nombre incorrecto (mayúsculas y guion bajo)
  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  # secreto incluido accidentalmente:
  aws_access_key_id = "AKIAEXAMPLEKEY1234"
}

# --- buen ejemplo ---
resource "aws_security_group" "good-ssh" {
  name = "good-ssh"
  ingress {
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["10.0.0.0/24"]
  }
}