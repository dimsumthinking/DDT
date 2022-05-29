# DDT

This is a small project to calculate Water temperature for a given dough temp

I make no claims that it works or is any way something you should use or even enjoy.

There is a toggle so that you can calculate the water temperature for doughs with or without preferments.

If you enter the desired dough temperature and temps of the flour, water, friction, and, if appropriate, the preferment the temperature of the water will be calculated.

The app supports both F and C.

New in version 2 you can save mixes and the friction will update based on the recording of the final temperature after a mix.

# Instructions

Enter the Desired Dough Temperature.

The ideal range is 75 - 78 º F  or 24 - 25.5 º C.

Enter room temperature as the ambient value and also enter your flour temp. 

If there's a preferment, toggle the switch and enter its temperature. 

As you move any slider, the Water temperature is updated.

Measure your water at this temperature to achieve your desired dough temperature.

This simple change will improve your bread.

Until you have determined the correct friction factor, measure the temperature of the final dough as it comes off the mixer.

If the actual temperature differs from the desired dough temperature, use the slider in Settings to  adjust the friction factor.

To tune the friction factor, measure the actual dough temperature.

If the actual dough temperature is higher than the desired dough temperature, increase the friction by that amount to compensate next time. 

If the actual dough temperature is lower, decrease the friction by that amount to compensate next time.

If you save your mixes and use them from production this adjustment will be automatic - just record the final dough temperature after the mix to train the friction for that particular mix. This allows you to use different friction factors for different mixes that are wetter or use different mixing times and techniques.

After a couple of bakes, your friction factor should be close enough.

# Bugs

There is only one bug that I know of (and certainly more that I don't). The first time the user selects settings or + the Settings will always appear. This is due to a situation I don't yet understand using SwiftUI sheets switching on an optional.

# Developers

You are welcome to this code and can pretty much do whatever you want with it subject to the included MIT license.

This was a project I worked on to scratch my own itches as a baker and as a developer. You can see from the code that this iteration was an experiment in using many modules each contained in their own Swift Package.

If you do anything with this code, I'd appreciate you letting me know.


