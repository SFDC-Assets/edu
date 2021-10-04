sfdx shane:org:create -f config/project-scratch-def.json -d 7 -s --wait 60 --userprefix edu -o work.shop
sfdx force:mdapi:deploy -d unpackaged/pre/acc_record_types -w 10
sfdx force:mdapi:deploy -d unpackaged/pre/contact_key_affl_fields -w 10
sfdx force:package:install -w 20 -r -p 04t1R000001QiXrQAK
sfdx force:mdapi:deploy -d unpackaged/post/case_behavior_record_types -w 10
sfdx force:mdapi:deploy -d unpackaged/post/course_connection_record_types -w 10
sfdx force:mdapi:deploy -d unpackaged/post/eda_app -w 10
sfdx force:mdapi:deploy -d unpackaged/post/facility_display_name -w 10
sfdx force:source:push
sfdx force:user:permset:assign -n edu_user
sfdx shane:user:password:set -g User -l User -p salesforce1
sfdx force:org:open -p /lightning/page/home