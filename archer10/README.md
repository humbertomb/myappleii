Some weeks ago I had notice of a retro programming contest, yes through one of these wasap groups, the 10th Edition of BASIC 10 Liner Contest. The main idea is that you develop a game in BASIC with no more than 10 lines of code for 8 bit legacy computers. There are different categories depending on the maximum number of characters per line allowed. Simple, isn't it? I decided to go for a try, and made a MSX-1 program which I submitted to the contest. You can find a detailed description of the program in Archer 10 (MSX). Submission to the 2021 10-Liner Contest. After I finished, I asked myself: why not an Apple II port? Although I developed some programs in the 80s for Apple II, those were mostly CP/M with the Microsoft BASIC. You can find an example in Recuperación de código MBASIC para Apple II desde listados (it is in Spanish, but you can get the idea from the many pictures. Google translate might also be of some help). Anyway, it is never late for learning. And I had the appropriate material for getting into the job:

D. Finningan (2012) The New Apple II User's Guide. Mac GUI, Lincoln, IL (book)
M.L. Callerey, R. Schwarz (1984) Apple Graphics Tools and Techniques. Prentice-Hall (PDF)
I decided to mimic as much as possible the MSX-1 program mentioned above and develop an AppleSoft BASIC one. I had a gameplay and a sample 10-liner source code. That should be more than enough. I wanted to keep high resolution graphics, colors and sounds, even if those for the MSX were a little bit weird (disclaimer: I am very bad at gaming, coloring and music. The perfect combination :-).

<B>The programming</B>

The first thing I learned is that double high resolution graphics is not available to BASIC. And standard resolution graphics is crazy on coloring, not to mention the small available palette. Anyway, this did not prevented me to going ahead. Because of the small program size, complex sounds are also out of the game. Well, let's go for a simpler and less visually attractive version, but with the same gameplay I decided for the MSX-1 version.

I started to code right from the beginning thinking on a 10 lines program, with the experience of the MSX version. But because there were less graphical possibilities, I tried to enter the PUR-120 category. No way.  I had to reduce even more the visual aspects, and I wanted to support a minimum of them. Thus I ended up in the EXTREME-256 category. In addition to only ten lines of code, each line must not contain more than 256 characters. Overall, the code can not be larger than 2.5 Kb !!! To squeeze the code in this size you play the very old tricks. The BASIC interpreter uses a lexical analyzer that is based on keyword detection and not in delimiters. This basically means that you can write the code without white spaces. Who cares about readability !!! Then you use one-letter variables and single-digit line numbers (after all, remember, you can not use more than 10 :-). 

This was standard stuff in 10-liners. When you have to actually code the gameplay, all of a sudden, you get the headaches. First thing is AppleSoft BASIC does not have ELSE statements. The typical strategy is to leave conditionals at the end of lines, and use ELSEs to better manage decisions (in term of program space and lines usage). Soooo ... you have to decompose decisions and break them apart into different lines. Tricky, isn't it? Let's see.
The code

Lines 0 to 3 initialize the program and do all graphics background drawing and shapes definition. The order in which instructions are performed are related to the available line space. I tried different combinations. One interesting and important thing is that only line 3 is needed to replay, so you can GOTO 3 when the game is finished to start a new one.

Line 9 performs the text updating. It is coded in the form of a subroutine which is called at game initialization and whenever there is a hit or a fail.

Lines 4 to 8 implement the gameplay. They manage arrow and target movement, user input and scoring. The hit or fail of the arrow is checked in lines 6 (hit) and 7 (fail). Line 8 just closes the game loop. Should ELSE statements are available, this single-statement line would not be needed. Line 7 plays a nice trick. When the game is over, the game loop continues but arrow throwing is disabled. Until you press the space key and the game is re-initialized.

Lines 8 to 9 contain DATA definitions for the graphic shapes coded in decimal. These statements are put at the end of actual code, so we can make benefit of characters available in those lines. I tried to get rid of any character which is not ASCII standard. As I develop both on my Mac and on my Apple IIe, doing otherwise would produce me many headaches trying to preserve character coding.

The state of the game is coded using the following variables:
Y (Float): vertical position of the target in pixels. Varies in the 34 .. 125 range
S (Float): amount in pixels which is added/substracted to Y at each time step. It controls the velocity of the target. Its initial value is 1.0. Each time a hit occurs it is increased by 0.25 
X (Integer): horizontal position of the arrow in pixels. Varies in the 200 .. 32 range
D (Integer): linear distance between the arrow y position and the target y position
G (Integer): total score achieved
F (Integer): number of fails
H (Integer): score of the last hit, derived from D
B (Integer): state variable representing whether the arrow is moving (B=1) or not (B=0)
Q (Integer): state variable representing whether the game is active (Q=0) or not (Q=1)
I finally had a code of 1.7 Kb, in 10 lines of BASIC, with standard ASCII character coding. Nice. Goal achieved. You can find the code, a simulator disk file (DSK) and some multimedia materials here:

GitHub: https://github.com/humbertomb/myappleii/tree/main/archer10

<B>Instructions</B>

You are a top-notch archer in the "Outdoor Archery World Series. Moving Target". You throw an arrow by pressing the space bar, and cannot throw a new one until it either makes a hit or a fail. The target moves so you have to carefully synchronize the arrow throwing with the target movement. The target speed gets increasing with each hit. You get points for each hit depending of how close the arrow gets to the target center. You are allowed a maximum of 3 failures, in which case the competition finishes and you get your final score. To start a new game press the space bar.

Are you ready? Can you make more than one hundred points? Let's try it.

Download the file archer10.dsk from GitHub and drag&drop it on the Drive 1 icon on the Virtual II emulator (a fantastic application by Gerard Putter, which is worth the price of the paid version). Once the disk is loaded, type the following command in the console and then press INTRO:

RUN ARCHER10.BAS

The game has sound, so remember to enable audio in your computer.

Enjoy playing!!




