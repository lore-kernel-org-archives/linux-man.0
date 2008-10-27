From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Apparent bug in dlopen(3) documentation
Date: Mon, 27 Oct 2008 10:40:41 -0500
Message-ID: <cfd18e0f0810270840s617b5767lbf3e45fb7d08f20a@mail.gmail.com>
References: <20081021165334.02caa540@zest>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081021165334.02caa540@zest>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael B. Trausch" <mike-cRPrJ27hGUicqzYg7KEe8g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On Tue, Oct 21, 2008 at 3:53 PM, Michael B. Trausch <mike-cRPrJ27hGUicqzYg7KEe8g@public.gmane.org> wrote:
> The documentation says:
>
>       o   If  the  environment  variable  LD_LIBRARY_PATH  is
>           defined to contain a colon-separated list of direc‐
>           tories, then these are searched.   (As  a  security
>           measure  this  variable  is ignored for set-user-ID
>           and set-group-ID programs.)
>
> However, this is not (completely) the case, as demonstrable by:

I had to study this mail for a moment to work out what the referent of
"this" was (e.g., were you referring to the first or the second of the
quoted sentences?  it would have helped if you had included the
example program...).

> Tuesday, 2008-Oct-21 at 16:50:55 - mbt@zest - Linux v2.6.27
> Ubuntu Intrepid:[1-59/7133-0]:dl-test> ./dlc dl1.so
> LD_LIBRARY_PATH=(null)
> LD_LIBRARY_PATH=.
> dlc: dl-caller.c:46: main: Assertion `module != ((void *)0)' failed.
> zsh: abort (core dumped)  ./dlc dl1.so
>
> Tuesday, 2008-Oct-21 at 16:50:57 - mbt@zest - Linux v2.6.27
> Ubuntu Intrepid:[1-60/7134-134]:dl-test> LD_LIBRARY_PATH=. ./dlc dl1.so
> LD_LIBRARY_PATH=.
> LD_LIBRARY_PATH=.
> entrypoint_1() has been called.
> entrypoint_2() has been called.
> 1
>
> It would appear that dlopen(3) only considers LD_LIBRARY_PATH at the
> time the executable was run, not after the executable alters its own
> environment.

Yes, that's the way it looks from my reading of the source, and also
from some light testing that I've done.

> Either that, or it uses the LD_LIBRARY_PATH from the
> process' parent, not its own environment.

(The parent's environment is inside the parent's VM, so the latter is
not really possible.)

> Not sure which, but the
> documentation should probably be updated to reflect this fact.  The way
> it is written now would indicate that you could modify LD_LIBRARY_PATH
> from within the program and load libraries in different locations.  I
> suspect this is done for reasons of security, but it'd still be good to
> be documented.

Given that LD_LIBRARY_PATH is anyway under user control, I suspect
that the reason is not security; probably it's done for efficiency --
i.e., look up LD_LIBRARY_PATH just once, rather than on every
dlopen().

Anyway, as you rightly point out, the man page could be clearer on
this point.  For man-pages-3.12, I made the the change shown below.
Thanks for reporting this!

Cheers,

Michael

diff --git a/man3/dlopen.3 b/man3/dlopen.3
index 9b2522b..d302360 100644
--- a/man3/dlopen.3
+++ b/man3/dlopen.3
@@ -90,9 +90,9 @@ for further details):
 contains a DT_RPATH tag, and does not contain a DT_RUNPATH tag,
 then the directories listed in the DT_RPATH tag are searched.
 .IP o
-If the environment variable
+If, at the time that the program was started, the environment variable
 .B LD_LIBRARY_PATH
-is defined to contain a colon-separated list of directories,
+was defined to contain a colon-separated list of directories,
 then these are searched.
 (As a security measure this variable is ignored for set-user-ID and
 set-group-ID programs.)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
