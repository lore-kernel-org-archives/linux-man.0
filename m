From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97161] bootparam(7): 'debug' parameter: reference to
 <linux/kernel.h> for information on log levels is misleading.
Date: Fri, 24 Apr 2015 11:50:57 +0000
Message-ID: <bug-97161-11311-8cZpWQ6cfB@https.bugzilla.kernel.org/>
References: <bug-97161-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-97161-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D97161

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Alain Kalker from comment #0)
> The section on the 'debug' parameter refers the user to <linux/kernel=
=2Eh> for
> more information on kernel log levels, however, that file contains ne=
ither a
> description of console_loglevel nor nor a description of the various =
log
> levels.
>=20
> The closest I can find is <include/linux/kern_levels.h>, which define=
s the
> various log levels but doesn't explain console_loglevel, Also, it onl=
y
> exists in recent kernels, version 3.5 and up.
> Another candidate would be <include/linux/printk.h>, which does defin=
e
> console_loglevel but doesn't explain the individual log levels.
>=20
> Perhaps both references (<include/linux/printk.h>,
> <include/linux/kern_levels.h>) could be included?

Hello Alain,

I must say I'm generally quite unhappy with the sate of the bootparam(7=
) page.
I'm actually not sure that it was ever a good idea to create it to begi=
n with.
But that happened 20 years ago, well before my time as maintainer. As i=
t is
now, the page is *horribly( dated, and your report made me seriously th=
ink of
just removing the page! As it is, I have settled for discarding 60% of =
the
page, and fixing a few of the more glaring errors in the remainder. Reg=
arding
your report, I amended the test on 'debug' to read:

   Boot arguments for use by kernel developers
       'debug'
              Kernel  messages  are  handed  off  to  a  daemon (e.g.,
              klogd(8) or similar) so that they may be logged to disk.
              Messages with a priority above console_loglevel are also
              printed on the console.  (For a discussion of these lev=E2=
=80=90
              els,  see  syslog(2).)   By default, console_loglevel is
              set to log messages at levels  higher  than  KERN_DEBUG.
              This  boot  argument will cause the kernel to also print
              messages  logged  at  level  KERN_DEBUG.   The   console
              loglevel  can  also  be  set  on a booted system via the
              /proc/sys/kernel/printk file (described  in  syslog(2)),
              the  syslog(2) SYSLOG_ACTION_CONSOLE_LEVEL operation, or
              dmesg(8).


I believe that should address your concerns, so I'm closing the bug.

Cheers,

Michael

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
