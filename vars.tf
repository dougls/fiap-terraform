variable "projectName" {
   default     = "sonarqube"
 }
 
 variable "clusterName" {
   default     = "SonarQube"
 }

variable "regionDefault" {
  default = "<inserir-região-padrão>"
}

variable "engineRds" {
  default = "postgres"
}

variable "engineRdsVersion" {
  default = "13.10"
}

variable "rdsUser" {
  description = "Inserir usuario do banco em secrets"
}

variable "rdsPass" {
  description = "Inserir senha do banco em secrets"
}

variable "instanceClass" {
  default = "db.t3.micro"
}

variable "storageType" {
  default = "gp3"
}

variable "minStorage" {
  default = "20"
}

variable "maxStorage" {
  default = "30"
}

variable "subnet01" {
   default = "<inserir-subnet-id-01>"
 }
 
 variable "subnet02" {
   default = "<inserir-subnet-id-02>"
 }
 
 variable "subnet03" {
   default = "<inserir-subnet-id-03>"
 }
 
 variable "vpcId" {
   default = "<inserir-vpc-id>"
 }
 
 variable "vpcCIDR" {
   default = "<inserir-vpc-CIDR>"
 }

 variable "AWSAccount" {
   default     = "<inserir-id-aws-account>"
 }

 variable "tags" {
   type        = map(string)
   default = {
     App          = "sonarqube",
     Ambiente     = "Desenvolvimento"
    }
}