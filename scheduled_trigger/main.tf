resource "aws_cloudwatch_event_rule" "schedule" {
  name_prefix = "lambda-schedule-trigger"
  description = "${var.description}"
  schedule_expression = "${var.schedule}"
}

resource "aws_cloudwatch_event_target" "target" {
  rule = "${aws_cloudwatch_event_rule.schedule.name}"
  arn = "${var.lambda_arn}"
  input = "${var.event}"
}

resource "aws_lambda_permission" "invoke-lambda-permission" {
  action = "lambda:InvokeFunction"
  function_name = "${var.lambda_arn}"
  principal = "events.amazonaws.com"
  source_arn = "${aws_cloudwatch_event_rule.schedule.arn}"
}
