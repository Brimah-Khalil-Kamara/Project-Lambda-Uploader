import json
import urllib.parse
import boto3

print("Loading function...")

s3 = boto3.client('s3')

def lambda_handler(event, context):
    try:
        # Log the incoming event for debugging
        print("Received event: " + json.dumps(event, indent=2))

        # Extract bucket name and object key
        record = event['Records'][0]['s3']
        bucket = record['bucket']['name']
        key = urllib.parse.unquote_plus(record['object']['key'], encoding='utf-8')

        # Get the object metadata
        response = s3.head_object(Bucket=bucket, Key=key)
        content_type = response.get('ContentType', 'unknown')

        # Log filename and content type
        print(f"File uploaded: {key}")
        print(f"Content type: {content_type}")

        return {
            'statusCode': 200,
            'body': json.dumps({
                'filename': key,
                'content_type': content_type
            })
        }

    except Exception as e:
        print(f"Error processing object {key} from bucket {bucket}.")
        print(str(e))
        raise e
