# serverless-object-recognition

## A (mostly free) serverless object recognition API hosted on AWS

### About

This project uses AWS Lambda and AWS API Gateway in conjunction with OpenCV powered by a (tiny) version of the [YoloV3](https://pjreddie.com/darknet/yolo/) Object
detection system trained on the coco dataset. This architecture enables an event driven, serverless, self-contained 
object detection API that is extremely fast, accurate, and most importantly, nearly free!

The [Chalice Microframework](https://chalice.readthedocs.io/en/latest/) is used for turning the Lambda and API Gateway configuration into Flask style python code.

Currently the API only supports images (png/jpeg).

### Cost

AWS provides us with 400,000 GB seconds of lambda compute and 1 millions requests free every month alongside 1 million API Gateway requests
for a fee of $3.50

My estimates (not including time-bounded free tiers) for processing 100,000 object detection requests/month turns out to roughly $1.52 (1600 MS average lambda duration * 100,000 = 1.17, 1m (3.50) / 10 = .35)

A comparable service on AWS, Rekognition, would be an estimated cost of $100 for 100,000 object detection requests/month. 

This means we can see a 98% decrease in cost for simple object detection analysis.

## Sample responses
```
{
    "Results": [
        {
            "Object": "person",
            "Confidence": 0.9470769166946411,
            "BoundingBoxes": {
                "x": 29,
                "y": 297,
                "w": 365,
                "h": 512
            }
        },
        {
            "Object": "person",
            "Confidence": 0.5962204933166504,
            "BoundingBoxes": {
                "x": 715,
                "y": 197,
                "w": 300,
                "h": 649
            }
        },
        {
            "Object": "person",
            "Confidence": 0.5856237411499023,
            "BoundingBoxes": {
                "x": 343,
                "y": 168,
                "w": 253,
                "h": 704
            }
        }
    ]
}
```
### Deployment

TBD

