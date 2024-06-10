import os
import azure.cognitiveservices.speech as speechsdk
import openai

openai.api_key = os.environ['OPENAI_API_KEY']


def recognize_from_microphone():

    speech_config = speechsdk.SpeechConfig(subscription=os.environ.get(
        'SPEECH_KEY'), region=os.environ.get('SPEECH_REGION'))
    speech_config.speech_recognition_language = "en-US"

    audio_config = speechsdk.audio.AudioConfig(use_default_microphone=True)
    speech_recognizer = speechsdk.SpeechRecognizer(
        speech_config=speech_config, audio_config=audio_config)

    # print("Ask your question into your microphone.")
    print("...")
    speech_recognition_result = speech_recognizer.recognize_once_async().get()

    if speech_recognition_result.reason == speechsdk.ResultReason.RecognizedSpeech:
        # print("Recognized: {}".format(speech_recognition_result.text))
        print("> {}".format(speech_recognition_result.text))

    elif speech_recognition_result.reason == speechsdk.ResultReason.NoMatch:
        print("No speech could be recognized: {}".format(
            speech_recognition_result.no_match_details))
    elif speech_recognition_result.reason == speechsdk.ResultReason.Canceled:
        cancellation_details = speech_recognition_result.cancellation_details
        print("Speech Recognition canceled: {}".format(
            cancellation_details.reason))
        if cancellation_details.reason == speechsdk.CancellationReason.Error:
            print("Error details: {}".format(
                cancellation_details.error_details))
            print("Did you set the speech resource key and region values?")
    return speech_recognition_result.text

# def response_chat(text):
#     response = openai.ChatCompletion.create(
#         model="gpt-3.5-turbo",
#         messages=[
#             {'role': 'system', 'content': 'You answer questions about Car rental customer'},
#             {'role': 'user', 'content': text},
#         ],
#         temperature=0.5
#     )
#     return response['choices'][0]['message']['content']
