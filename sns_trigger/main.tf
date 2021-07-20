resource "aws_sns_topic_subscription" "update-trigger" {
  topic_arn = "${var.topic_arn}"
  protocol = "lambda"
  endpoint = "${var.lambda_arn}"
}

resource "aws_lambda_permission" "update-trigger" {
  action = "lambda:InvokeFunction"
  function_name = "${var.lambda_arn}"
  principal = "sns.amazonaws.com"
  source_arn = "${var.topic_arn}"
}
