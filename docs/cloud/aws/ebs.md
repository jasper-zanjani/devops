# EBS

[**Elastic Block Store**](https://docs.aws.amazon.com/ebs/latest/userguide/what-is-ebs.html) offers block volumes for use with [EC2](#ec2) instances.
Volumes are categorized by underlying technology ([SSD](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volume-types.html#vol-type-ssd) or HDD) as well as by use case ([IOPS](https://docs.aws.amazon.com/ebs/latest/userguide/provisioned-iops.html) or [throughput](https://docs.aws.amazon.com/ebs/latest/userguide/hdd-vols.html)).

- [**gp2**](https://docs.aws.amazon.com/ebs/latest/userguide/general-purpose.html#EBSVolumeTypes_gp2) and [**gp3**](https://docs.aws.amazon.com/ebs/latest/userguide/general-purpose.html#gp3-ebs-volume-type) are general-purpose SSD-backed volumes intended for use as boot volumes
- [**io1**](https://docs.aws.amazon.com/ebs/latest/userguide/provisioned-iops.html#EBSVolumeTypes_piops) and [**io2**](https://docs.aws.amazon.com/ebs/latest/userguide/provisioned-iops.html#io2-block-express) are SSD-backed volumes optimized for IOPS and intended for use with transaction databases
- [**st1**](https://docs.aws.amazon.com/ebs/latest/userguide/hdd-vols.html#EBSVolumeTypes_st1) or "standard" is a HDD-backed volume optimized for throughput which cannot be used as a boot volume
- [**sc1**](https://docs.aws.amazon.com/ebs/latest/userguide/hdd-vols.html#EBSVolumeTypes_sc1) is a cold volume intended for low-cost HDD-backed storage of data requiring infrequent access

EBS volumes must be **in the same region and AZ** as the EC2 instance to which it is attached.

EBS volumes are encrypted with AES-256 using [KMS](#kms) customer master keys.

#### Snapshots

EBS volumes can be backed up by taking [snapshots](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-snapshots.html), which are stored in S3 buckets which cannot be accessed directly, although snapshots can be managed through the EC2 console.
Snapshots are also how you would copy an EBS volume to another region.