From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: incorrect clock_nanosleep.2
Date: Sun, 29 Aug 2010 06:32:49 +0200
Message-ID: <AANLkTinvx7UN_Fx2YB-0sqV7PLpm2Y-uiSrdbiufkqRG@mail.gmail.com>
References: <20100812095939.13c8ab26@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100812095939.13c8ab26-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Thu, Aug 12, 2010 at 7:59 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> Next two paragraph is contradict.
>
> If the call is interrupted by a signal handler, clock_nanosleep() ret=
urns
> -1, and sets errno to EINTR.
>
> And below:
> RETURN VALUE
> =9A =9A =9A On successfully sleeping for the requested interval,
> =9A =9A =9A clock_nanosleep() returns 0. =9AIf the call is interrupte=
d by a
> =9A =9A =9A signal handler or encounters an error, then it returns a =
positive
> =9A =9A =9A error number.
>
> So, return value is positive or -1 ?

Thanks. This was in fact independently reported a few weeks ago, and
this fix was applied:

--- a/man2/clock_nanosleep.2
+++ b/man2/clock_nanosleep.2
@@ -124,9 +124,7 @@ that terminates the process.

 If the call is interrupted by a signal handler,
 .BR clock_nanosleep ()
-returns \-1, and sets
-.I errno
-to
+fails with the error
 .BR EINTR .
 In addition, if
 .I remain

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
