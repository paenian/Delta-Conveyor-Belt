#  Prusa Mini Conveyor Belt!

Status: Fully Functional!

Quick overview - this repo contains all the files I used to add a conveyor belt to my Prusa Mini.

BELT MATERIAL
The belt is made from .2mm thick Kapton, ordered from AliExpress and lasercut.  You can totally hand-cut it, but tracking of the belt is a bit of a pain.

CONTROL
The belt is controlled by a microswitch mounted on the top of the Z axis.  When the Z gets high enough and Y is forward enough, your parts scoot.  The nice part is no modification of the firmware is required - just some special start and end GCODE in your slicer.  I do take power for the motor from inside the Prusa Mini box for neatness - I like my printers as self-contained as possible.

The other modifications to the Prusa Mini involve raising the bed 4mm - so combined with the switch up top, you're losing about 15mm of usable Z axis.

Right now, the belt is 150mm in width - so your Y axis shrinks a bit when printing on the belt.  You can, however, still print using the entire bed - just put the metal build plate on top of the belt!  I plan to work on widening the belt, but for now I want the machine to be as rigid as possible.


PARTS NEEDED
.2mm thick KAPTON film - 150mm by ~400mm
 - Alternative bed material is PEI film or Dur-a-lar

5/16" diameter tool steel rod, for the rollers
5/16" ID EPDM rubber tubing, goes on the drive rod to grip and move the belt

V-156-1C25 microswitch to actuate the belt - https://smile.amazon.com/Cylewet-V-155-1C25-Switch-Arduino-CYT1081/dp/B075PTBML8/ref=sr_1_1_sspa?dchild=1&keywords=V-156-1C25&qid=1596996683&s=industrial&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExTTBSSEhVRlU3UFZRJmVuY3J5cHRlZElkPUEwMDUwNDIyMURGMFFCRUI0UEVCWSZlbmNyeXB0ZWRBZElkPUEwMzY0NTkwMzNBS1VYN1VFQkRTSiZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=

24v, 30rpm , 6mm worm gear motor to drive the belt: https://smile.amazon.com/gp/product/B01N1JQLG4/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1


various screws and wires
10mm long M3 hex standoffs: https://www.mcmaster.com/94868A166/


INSTALLATION
For all the printed parts, I used PETG with carbon-fiber embedded.  Not all need the strength, but I'd say the gears and the LM8UU clamps definitely benefit.


First dismantle the heated bed and set aside - then take the entire Y axis apart.  The belt needs to run flat, so first we replace the U-bolt clamps holding the LM8UUs on with printed clamps.
 - I used a chamfer drill to make countersink holes in the aluminum Y carriage, and used M3x16mm flat top screws.  Clearance is pretty tight on the electronics side.
 - Printed Part: lm8uu clamp.stl
While you're down here, remove all the hexagonal standoffs.  We need taller ones.

Replace the front three and back three hex standoffs with 10mm long ones - middle standoffs never get replaced.





![Netty is the official mascot](https://github.com/paenian/Delta-Conveyor-Belt/blob/master/netty_printer.jpg)
