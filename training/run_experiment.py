import lightning as L
from lightning.pytorch.callbacks import EarlyStopping, ModelCheckpoint
from lightning.pytorch.cli import LightningCLI
from lightning.pytorch.loggers import TensorBoardLogger

import text_recognizer.data_model
import text_recognizer.model


def cli_main() -> None:
    logger: TensorBoardLogger = TensorBoardLogger(
        save_dir="training/logs", name="default", version="test"
    )
    early_stopping_callback: EarlyStopping = EarlyStopping(
        monitor="val_loss", mode="min"
    )
    model_checkpoint_callback: ModelCheckpoint = ModelCheckpoint(
        dirpath="training/logs",
        filename="{epoch:03d}-{val_loss:.3f}-{val_cer}:.3f",
        monitor="val_loss",
        mode="min",
    )
    callbacks: list[EarlyStopping, ModelCheckpoint] = [
        early_stopping_callback,
        model_checkpoint_callback,
    ]
    trainer: L.pytorch.Trainer = L.Trainer(callbacks=callbacks, logger=logger)
    cli: LightningCLI = LightningCLI()


if __name__ == "__main__":
    cli_main()
