## Delta-Conveyor-Belt
Adding a conveyor belt to my delta printer for part ejection.  The deltabot is somewhat described here: [Bertha](https://github.com/paenian/bertha), however it's been upgraded to the Delta Smart Effector as part of the conveyor belt addon.

Bertha Overview: https://www.youtube.com/watch?v=_Ud6TqBTL1Y

This is a follow-up to [Beltalowda](https://github.com/paenian/beltalowda),  which was styled as an upgraded Printrbelt.


## Status!
Bertha is quite reliable and functioned well printing face shields to help fight the COVID pandemic - check out her timelapse: https://www.youtube.com/watch?v=ywWMOnBR8Mk



## Expanding the Belt!

I've been expanding the belt system, however - there are versions for:
- [Kossel 3D printer](https://github.com/paenian/Delta-Conveyor-Belt/tree/master/kossel%20-%20240mm%20triangle) - this works well, but is small :-)
- [Prusa Mini](https://github.com/paenian/Delta-Conveyor-Belt/tree/master/prusa%20mini) - Working, more actively developing around this machine right now.

![Netty is the official mascot](https://github.com/paenian/Delta-Conveyor-Belt/blob/master/netty_printer.jpg)


### I've seen other belt printers... how is yours different?
I started working with stainless steel belts on Beltalowda (based off of the Printrbot's Printrbelt - the [White Knight](https://3ddistributed.com/white-knight-3d-printer/) uses steel as well) but was not super happy with it.  For one, the belt is inflexible - so it requires large rollers and very high force to stretch it out flat.  The other issue is heating the belt - as the belt material expands, it develops ripples in the surface ruining your print's bottom layer.  This is also an issue when the nozzle gets close to the bed - without excellent cooling, the bed will locally warp due to local heating from the nozzle and hot plastic.

To get around those, I experimented with thin, plastic belts - PEI, Kapton and Polyester (duralar).  They can be bent around a tiny radius, stretch minimally, and have managable thermal expansion.  To combat local heating, and help your print stick - heat the bed first!  To combat the warping that heating the bed gets you, I'm heating both sides of the bed - and rolling it to flatten it out when hot.  This has mitigated the problem enough that I've had successful prints, but plastics that warp (ABS) locally bend the belt to their will.  This can be partially solved with rafts, but given how well the thin belts are working, I thought I should release to the community and see what other solutions crop up.  I believe simply tuning the temperature and rolling profiles can lead to some improvement.
