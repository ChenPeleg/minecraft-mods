package com.example.mixin.client;

import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.client.gui.components.Button;
import net.minecraft.client.gui.screens.Screen;
import net.minecraft.client.gui.screens.TitleScreen;
import net.minecraft.network.chat.Component;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(TitleScreen.class)
public abstract class TitleScreenMixin extends Screen {
    protected TitleScreenMixin(Component title) {
        super(title);
    }

    @Inject(method = "init", at = @At("RETURN"))
    private void addCustomButton(CallbackInfo ci) {
        // Add a button with the name "Nimrod"
        // Position it below the existing buttons
        this.addRenderableWidget(
            Button.builder(
                Component.literal("Nimrod"),
                button -> {
                    // Button doesn't need to do anything
                    System.out.println("Nimrod button clicked!");
                })
                .bounds(this.width / 2 - 100, this.height / 4 + 48 + 72 + 12, 200, 20)
                .build()
        );
    }
}
