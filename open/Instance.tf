//------------------------------------
//instance
//------------------------------------
resource "aws_instance" "game1001" {
    ami                    = "ami-078296f82eb463377"
    instance_type          = "t3.nano"
    subnet_id              = data.aws_subnet.open_public_1a.id
    vpc_security_group_ids = [ aws_security_group.open_public_outboud.id,aws_security_group.open_public_orient_inbound.id ]
    iam_instance_profile   =  "BaseInstanceRole"
    key_name               = null 
    tags = {
        Name = "game1001"
    }
}

/*
resource "aws_cloudwatch_metric_alarm" "cw"{
    alarm_name               = "temptemp"
    comparison_operator      = "GreaterThanOrEqualToThreshold"
    evaluation_periods       = 1   
    alarm_actions            = ["arn:aws:sns:ap-northeast-1:862806302714:Default_CloudWatch_Alarms_Topic"]
    datapoints_to_alarm      = 1
    metric_name              = "StatusCheckFailed"
    namespace                = "AWS/EC2"
    period                   = 60 
    statistic                = "Maximum"
    threshold                = 2
    treat_missing_data       = "missing"
    dimensions={"InstanceId" = "i-02fe301f878a98251"}
}
*/
