import os
import azure.cognitiveservices.speech as speechsdk
import openai

openai.api_key = os.environ['OPENAI_API_KEY']

speech_key, service_region = "your_speech_key", "your_service_region"


def recognize_from_microphone():

    # speech_config = speechsdk.SpeechConfig(subscription=os.environ.get(
    #     'SPEECH_KEY'), region=os.environ.get('SPEECH_REGION'))
    speech_config = speechsdk.SpeechConfig(
        subscription=speech_key, region=service_region)
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


def text_to_speech(text):
    # speech_config = speechsdk.SpeechConfig(subscription=os.environ.get(
    #     'SPEECH_KEY'), region=os.environ.get('SPEECH_REGION'))
    speech_config = speechsdk.SpeechConfig(
        subscription=speech_key, region=service_region)
    audio_config = speechsdk.audio.AudioOutputConfig(use_default_speaker=True)

    speech_config.speech_synthesis_voice_name = 'en-US-AriaRUS'

    speech_synthesizer = speechsdk.SpeechSynthesizer(
        speech_config=speech_config, audio_config=audio_config)

    # print("Enter some text that you want to speak >")
    # text = input()

    speech_synthesis_result = speech_synthesizer.speak_text_async(text).get()

    if speech_synthesis_result.reason == speechsdk.ResultReason.SynthesizingAudioCompleted:
        # print("Speech synthesized for text [{}]".format(text))
        pass
    elif speech_synthesis_result.reason == speechsdk.ResultReason.Canceled:
        cancellation_details = speech_synthesis_result.cancellation_details
        print("Speech synthesis canceled: {}".format(
            cancellation_details.reason))
        if cancellation_details.reason == speechsdk.CancellationReason.Error:
            if cancellation_details.error_details:
                print("Error details: {}".format(
                    cancellation_details.error_details))
                print("Did you set the speech resource key and region values?")
