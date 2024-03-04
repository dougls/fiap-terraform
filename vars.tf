variable "projectName" {
   default     = "sonarqube"
 }
 
 variable "clusterName" {
   default     = "SonarQube"
 }

variable "regionDefault" {
  default = "<inserir-região-padrão>" # example: us-east-1
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
   default = "<inserir-subnet-id-01>" # example: subnet-abcdef1
 }
 
 variable "subnet02" {
   default = "<inserir-subnet-id-02>" # example: subnet-abcdef1
 }
 
 variable "subnet03" {
   default = "<inserir-subnet-id-03>" # example: subnet-abcdef1
 }
 
 variable "vpcId" {
   default = "<inserir-vpc-id>" # example: vpc-abcdef1
 }
 
 variable "vpcCIDR" {
   default = "<inserir-vpc-CIDR>" # example: 10.10.0.0/16
 }

 variable "AWSAccount" {
   default     = "<inserir-id-aws-account>" # example: 123456789
 }

 variable "tags" {
   type        = map(string)
   default = {
     App          = "sonarqube",
     Ambiente     = "Desenvolvimento"
    }
}
