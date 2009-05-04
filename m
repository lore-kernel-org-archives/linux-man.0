From: Samuel Bronson <naesten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: vm86.2: having a go at documenting the API
Date: Mon, 04 May 2009 00:49:36 -0400
Message-ID: <87ab5t8obj.fsf@naesten.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dosemu-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dosemu-devel>,
	<mailto:dosemu-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dosemu-devel>
List-Post: <mailto:dosemu-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:dosemu-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dosemu-devel>,
	<mailto:dosemu-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: dosemu-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: dosemu-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi there, linux-man@VGER.

I got fed-up with the way vm86(2) didn't have any actual information
about how to use vm86(), so I've started documenting it.

My work so far is can be seen in gitweb at:

    http://repo.or.cz/w/man-pages/vm86.git?a=blob;f=man2/vm86.2;hb=HEAD

or fetched from:

    git://repo.or.cz/man-pages/vm86.git master

though I'm nowhere near done, and would NOT suggest merging it at this
time.

Any tips about things I'm doing wrong, what to do when I feel it's
actually finished, etc. would be appreciated.

I'm getting help from dosemu-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org (which seems to
consist mostly of Bart Oldeman) as far as the technical accuracy goes;
I'm more wondering about style, whether it's a huge deal that I don't
have Signed-off-by: lines in my commit messages (patches.html didn't say
anything about that; then again, it doesn't say anything about offering
git commits either), etc.

Here's one part I'm especially wondering how to do better:

112 .in +4n
113 .IR irqnumber "\ =\ " sig "\ <<\ 8 +\ " irq .
114 .in

It seems a bit overly spaced-out, but it doesn't seem right to allow a
line break in the middle of the equation.

Due to the length of what I've written (especially in nroff form),
I don't expect it would be particularly useful to include the nroff
here. If you'd like to see the output of man2html or troff, or you'd
like to see the nroff source anyway, I'd be happy to oblige.

Sorry about the bad email address in most of the commits -- I thought
I'd configured that, but apparantly I was mistaken. It's fixed
now. Email sent to bronson-qSosuJVU5ZIdM9mxuWur+tAIK75dWmlW@public.gmane.org may or may not reach
me, depending on whether that computer is running linux or windows (or
even DOS) at the time -- do I need to rewrite my commits? (How should I
do this, if so?)

p.s. Is anyone interested in the code I added to my ~/.emacs.el file to
automatically update the date in the ".TH" line?

p.p.s. What are you using to serve the online manpages?

--
Hi! I'm a .signature virus! Copy me into your ~/.signature to help me spread!


------------------------------------------------------------------------------
Register Now & Save for Velocity, the Web Performance & Operations 
Conference from O'Reilly Media. Velocity features a full day of 
expert-led, hands-on workshops and two days of sessions from industry 
leaders in dedicated Performance & Operations tracks. Use code vel09scf 
and Save an extra 15% before 5/3. http://p.sf.net/sfu/velocityconf
