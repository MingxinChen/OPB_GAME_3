/// @description 

// Increase sprites Alpha value over time to fade out
image_alpha -= 0.04;

// if the debris has "Faded"
if (image_alpha <= 0) {
	// Destroy the debris particle
	instance_destroy();
}