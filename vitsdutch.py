import os

from trainer import Trainer,TrainerArgs

from TTS.config.shared_configs import BaseAudioConfig
#from TTS.trainer import Trainer, TrainingArgs
from TTS.tts.configs.shared_configs import BaseDatasetConfig
# from TTS.tts.configs.tacotron2_config import Tacotron2Config
from TTS.tts.configs.vits_config import VitsConfig
from TTS.tts.datasets import load_tts_samples
# from TTS.tts.models.tacotron2 import Tacotron2
from TTS.tts.models.vits import Vits
from TTS.utils.audio import AudioProcessor

from TTS.tts.utils.text.tokenizer import TTSTokenizer

output_path = os.path.dirname(os.path.abspath(__file__))


# init configs
dataset_config = BaseDatasetConfig(
    #name="ljspeech",
    formatter="ljspeech",
    meta_file_train="onespeakernl_metadata.csv",
    path=os.path.join(output_path, "../commonspeechnlonespeaker/")
)

audio_config = BaseAudioConfig(
    sample_rate=22050,
    do_trim_silence=True,
    trim_db=60.0,
    signal_norm=False,
    mel_fmin=0.0,
    mel_fmax=8000,
    spec_gain=1.0,
    log_func="np.log",
    ref_level_db=20,
    preemphasis=0.0,
)

config = VitsConfig(
    audio=audio_config,
    #batch_size=64,
    batch_size=16,
    #eval_batch_size=16,
    eval_batch_size=16,
    num_loader_workers=4,
    num_eval_loader_workers=4,
    run_eval=True,
    test_delay_epochs=-1,
    ga_alpha=5.0,
    #added below
    decoder_loss_alpha=0.25,
    postnet_loss_alpha=0.25,
    postnet_diff_spec_alpha=0,
    decoder_diff_spec_alpha=0,
    decoder_ssim_alpha=0,
    postnet_ssim_alpha=0,
    #added above
    r=2,
    attention_type="dynamic_convolution",
    double_decoder_consistency=True,
    epochs=2,
    # text_cleaner="phoneme_cleaners",
    text_cleaner="basic_cleaners",
    # use_phonemes=True,
    use_phonemes=False,
    # phoneme_language="en-us",
    phoneme_cache_path=os.path.join(output_path, "phoneme_cache"),
    print_step=50,
    print_eval=True,
    mixed_precision=False,
    output_path=output_path,
    datasets=[dataset_config],
    test_sentences=[
        "Ik lust geen pannenkoeken",
        "Die grand slam wedstrijd werd pas beslecht in de allerlaatste set",
        "Een kapitein blijft aan boord tot het einde als het schip zinkt of vergaat"
    ]
)

# init audio processor
#ap = AudioProcessor(**config.audio.to_dict())
ap = AudioProcessor.init_from_config(config)

tokenizer,config = TTSTokenizer.init_from_config(config)

# load training samples
#added last two below
train_samples,eval_samples = load_tts_samples(
   dataset_config,
   eval_split=True,
   eval_split_max_size=config.eval_split_max_size,
   eval_split_size=config.eval_split_size,
)

# init model
print("[Tacdutch] defining Tacotron2 model...")
#model = Tacotron2(config)
model = Vits(config,ap,tokenizer)

# init the trainer and 🚀
print("[Tacdutch] initialize Tacotron2 model...")
trainer = Trainer(
    #TrainingArgs(),
    TrainerArgs(),
    config,
    output_path,
    model=model,
    train_samples=train_samples,
    eval_samples=eval_samples,
    training_assets={"audio_processor": ap},
)
print("[Tacdutch] training Tacotron2 model...")
trainer.fit()

