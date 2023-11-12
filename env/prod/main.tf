module "Producao" {
  source = "../../infra"
  name = "producao"
  descricao = "aplicacao-de-producao"
  max = 5
  maquina = "t2.micro"
  ambiente = "ambiante-de-producao"
}