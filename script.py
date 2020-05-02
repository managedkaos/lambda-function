#!/usr/bin/env python
import sys
import json

def lambda_handler(event, context):
    if 'pathParameters' in event:
        return { 'statusCode': 200, 'body': json.dumps(event['pathParameters']) }
    else:
        return { 'statusCode': 404, 'body': json.dumps('No path paramters found') }

if __name__ == '__main__':
     print(sys.argv)
