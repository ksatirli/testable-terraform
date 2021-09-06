#!/bin/sh

aws \
  ec2 \
    describe-images \
      --region="eu-north-1" \
      --owners "amazon" \
      --filters "Name=name,Values=amazon/amzn2-ami-hvm-2.0*" \
      --filters "Name=owner-id,Values=137112412989" \
      --filters "Name=root-device-type,Values=ebs" \
      --filters "Name=virtualization-type,Values=hvm"
