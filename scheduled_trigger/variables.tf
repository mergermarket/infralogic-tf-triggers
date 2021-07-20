variable "schedule" {
  description = "schedule definition- cron() or rate()"
}

variable "lambda_arn" {
  description = "ARN of lambda to invoke"
}

variable "event" {
  description = "JSON of event to invoke lambda with"
  default = "{}"
}

variable "description" {
  description = "Description to attach to trigger"
  default = "Scheduled"
}
