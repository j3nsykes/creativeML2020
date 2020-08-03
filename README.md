# creativeML2020
Creative Machine Learning Examples for 2020


Teaching resources for projects and workshops exploring machine learning (ML)

## Main teaching webpage 
Detailed explanations, walk-throughs and direct links to each teaching exercise sketch live on the teaching website but collections and corresponding Arduino code can be downloaded from this repo. 

### Teachable Machine
These  examples all run in the P5JS editor and import simple image classification models trained using the [teachable Machine](https://teachablemachine.withgoogle.com/) 

To view the full list of examples see the [P5JS Teachable Machine Collection](https://editor.p5js.org/jen_GSA/collections/GXB0ygNcE)

<strong>Key examples include:</strong>
* [Image Classification Template](https://editor.p5js.org/jen_GSA/sketches/x8tRUnLsRJ)
* [Sound Classification template](https://editor.p5js.org/jen_GSA/sketches/4he-Drz54)
* [Image Classification + Emoji Output](https://editor.p5js.org/jen_GSA/sketches/VQw04nIh3)
* [Image Classification + Image Output](https://editor.p5js.org/jen_GSA/sketches/89VZKT1Re)
* [Image Classification + Sound Output](https://editor.p5js.org/jen_GSA/sketches/_sAp4K-GL)

### ML5
These examples run in the P5JS editor and explore varying ML5 functions such as classification, regression and pre-trained models. 

To view the full list of examples see the [ML5 Collection](https://editor.p5js.org/jen_GSA/collections/62PzgvAoj)

<strong>Key examples include:</strong>
* [Webcam Image Classifier](https://editor.p5js.org/jen_GSA/sketches/1q_93qGx0)
* [Webcam Classifier sound trigger](https://editor.p5js.org/jen_GSA/sketches/iuLXVwnGk)
* [MobileNet classification](https://editor.p5js.org/AndreasRef/sketches/H1L-KrzFQ)
* [WebCam Regression](https://editor.p5js.org/jen_GSA/sketches/3e1Kfy9c0)
* [PoseNet Classifier](https://editor.p5js.org/AndreasRef/sketches/g8zrnIlng)

### DIY Neural Nets in ML5
These examples live in the P5JS editor and explore how to use the ML5 Neural Net function to build templates for training any input, in particular, Physical Computing inputs. 

To view the full list of examples see the [DIY Neural Net Collection](https://editor.p5js.org/jen_GSA/collections/XLcVf38z2)

<strong>Key examples include:</strong>
* [Basic template](https://editor.p5js.org/jen_GSA/sketches/oRKaOHzK)
* [Mouse XY Classifier](https://editor.p5js.org/jen_GSA/sketches/0kaQK8DJI)

### Physical Teachable Machines
These examples work with a range of methods:
* Training directly in ML5 with the neural net function
* Training in the Arduino IDE with the Simple_KNN library.
* Training with Tensorflow Lite using the Arduino_TensorflowLite library and Google Colabs

Each method will be outlined below. 

#### Training directly in ML5 with the neural net function
You can send serial messages from any Arduino input directly into P5JS and use the ML5 neural net function to train these. You will need the corresponding Arduino code uplaoded on to your board for each example to work. The corresponding Arduino code can be found in the [Physical teachable Machines folder]() on this repo or each .ino file is directly referenced at the top of P5JS code. 

To view the full list of examples see the [ML5 Teachable Machine collection](https://editor.p5js.org/jen_GSA/collections/FWD_DfCPa)

<strong>Key examples include:</strong>
* [Classify 3 serial inputs](https://editor.p5js.org/jen_GSA/sketches/dns24nOSN)
* [Classify 3 web USB inputs](https://editor.p5js.org/jen_GSA/sketches/DTCsb7qus)
* [Classify an array of LDR inputs](https://editor.p5js.org/jen_GSA/sketches/-meXI41cH)
* [Classify Capacitive Touch](https://editor.p5js.org/jen_GSA/sketches/9MQHS3KC)
* [Classify Gestures with IMU sensors and visula confidence output](https://editor.p5js.org/jen_GSA/sketches/P776cKng)

If you are using the <strong>serial</strong> examples you will also need to run the [P5 Serial App](https://github.com/p5-serial/p5.serialport) alongside them.

If you are using the <strong>webUSB</strong> examples you do not require any 3rd party apps. However, you will need to make sure your Arduino board is compatible. A list of compatible boards can be found [here](https://github.com/webusb/arduino)

#### Training in the Arduino IDE with the Simple_KNN library.
In the past year is has become more accessible to train sensor inputs directly on the micro-controller (Arduino) using [TensorflowLite](https://github.com/arduino/ArduinoTensorFlowLiteTutorials) and [KNN libraries](https://github.com/arduino-libraries/Arduino_KNN). 

This repo contains examples to get you started training classification models all self-contained in Arduino. You can also find examples taking the basic structure one or two steps further to trigger different physical outputs. 

<strong>Key examples include:</strong>
* [Simple KNN template](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalTeachableMachines/Arduino_KNN/SimpleKNN)
* [Classify Colour](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalTeachableMachines/Arduino_KNN/ColorClassifier)
* [Classify Orientation](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalTeachableMachines/Arduino_KNN/BoardOrientation)
* [Classify Color to physical output](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalTeachableMachines/Arduino_KNN/ColorClassifier_to_Output)
* [Classify Orientation to LED output](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalTeachableMachines/Arduino_KNN/BoardOrientation_to_LEDoutput)
* [Classify Color to neopixel output](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalTeachableMachines/Arduino_KNN/ColorClassifier_to_neoPixel)

These examples require the <strong>Arduino Nano 33 BLE Sense</strong> board. A guide to starting with Arduino and libraries can be found [here](https://j3nsykes.github.io/ArduinoSetup/).

<!--As there are different positives and negatives to the varioous approaches with Physical Computing and ML an in-depth walk- through of the examples can be found [here]().-->


#### Training with Tensorflow Lite using the Arduino_TensorflowLite library and Google Colabs. 
You can train more detailed inputs using TensorFlow Lite and Google CoLabs. They provide detailed tutorials and pre-trained models to train on top of. These examples are a little more advanced and require some familiarity with Google Colab, file structures and working with multiple .ino files. 

The example listed are referenced from <strong>Dominic Pajak and Sandeep Mistry</strong>

<strong>Key examples include:</strong>
* [Gesture to Emojis](https://blog.arduino.cc/2019/10/15/get-started-with-machine-learning-on-arduino/)
* [Fruit to Emoji](https://github.com/arduino/ArduinoTensorFlowLiteTutorials/tree/master/FruitToEmoji)
* [Magic Wand](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/micro/examples/magic_wand)
* [Full list](https://www.tensorflow.org/lite/microcontrollers/get_started)


### RunwayML
These examples build upon the existing [RunwayML Processing library] and [P5JS examples] taking these further to explore experimental interactions with text generating chat bots, capacitive touch latent walks, speech feedback loops and motorised outputs to name a few. Have an explore!

<strong>Key Processing examples include:</strong>
* [Trill Capacitive Touch to StyleGAN latent space](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalRunwayExperiements/Processing/TrillCapacitiveTouch_StyleGAN)
* [ElizaChatBot to AttGAN](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalRunwayExperiements/Processing/Eliza_AttGAN)
* [GPT2- SpokenOutput](https://github.com/j3nsykes/creativeML2020/tree/master/PhysicalRunwayExperiements/Processing/GPT2-SpokenOutput/GPT2_speech)

<strong>Key P5JS examples include:</strong>
* [StyleGAN Latent Walk](https://editor.p5js.org/jen_GSA/sketches/WKRBKt88)
* [Speech Recognition to GPT2](https://editor.p5js.org/jen_GSA/sketches/gTuBw-ki)
* [Hosted Model Template](https://editor.p5js.org/jen_GSA/sketches/9dtBZ75NT)

The P5JS [Runway Collection](https://editor.p5js.org/jen_GSA/collections/NIHmmfpXs) houses all the examples including new ways of connecting via hosted models. 


#### Acknowledgements and references:
The code used in the examples above reference, adapt and expanded upon functionality from original sources by...
* [Rebecca Fiebrink and Wekinator](http://www.wekinator.org/examples/)
* [Andreas Refsgaard](https://github.com/AndreasRef)
* [Sandeep Mistry](https://github.com/sandeepmistry)
* [Dominic Pajak](https://github.com/8bitkick/Arduino_KNN_p5js)
* [Dan Shiffman and The Coding Train](https://thecodingtrain.com/learning/ml5/)
* [Bérenger Recoules](https://github.com/b2renger/workshop_ml_PCD2019)
* [Gene Kogan and ML4A](https://ml4a.github.io/demos/) 
* [Runway + Cristóbal Valenzuela](https://runwayapp.ai/)
* [George Profenza](https://github.com/orgicus)
* [Yining Shi](https://github.com/yining1023)

