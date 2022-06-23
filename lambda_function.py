import json
from util import blurQRCodes
import cv2 
import base64

def lambda_handler(event, context):
    # TODO implement
    print(event)
    if event['Content-Type'] != 'image/jpeg':
        return {
            'statusCode': 400,
            'body': json.dumps("Body not image")
        }
    image = blurQRCodes(event.body, '')
    if len(image) == 0:
        return {
            'statusCode': 200,
            'body': event.body,
            'headers': {
                'Content-Type': 'image/jpeg'
            }
        }
    retval, buffer = cv2.imencode('.jpg', image)
    return {
        'statusCode': 200,
        'body': base64.b64encode(buffer),
        'headers': {
            'Content-Type': 'image/jpeg'
        }
    }
