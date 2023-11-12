module "Homologacao" {
  source = "../../infra"
  name = "homologacao"
  descricao = "aplicacao-de-homologacao"
  max = 1
  maquina = "t2.micro"
  ambiente = "ambiante-de-homologacao"
}