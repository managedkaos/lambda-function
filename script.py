#!/usr/bin/env python
import sys
import json

def lambda_handler(event, context):
    return {
            'statusCode': 200,
            #'body': json.dumps(event['pathParameters'])
            'body': json.dumps(event)
            }

if __name__ == '__main__':
     print(sys.argv)