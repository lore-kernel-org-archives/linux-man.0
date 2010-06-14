From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 3/3] getrusage.2: Bump revision
Date: Mon, 14 Jun 2010 07:34:21 +0200
Message-ID: <AANLkTilIJP0qepLuCReHIbVvia5ajVjyJ25Xxrhop4pR@mail.gmail.com>
References: <1272228153-11825-1-git-send-email-mark@pogo.org.uk>
	<1272228153-11825-4-git-send-email-mark@pogo.org.uk> <AANLkTikYUdg2o9JAH8NOK0Wjk6aWQlr-x2k4-Ts_XF3Z@mail.gmail.com>
	<alpine.NEB.2.01.1005271220220.21247@jrf.vwaro.pbz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.NEB.2.01.1005271220220.21247-4Gsws06j5aKxDRllUHgonQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

On Thu, May 27, 2010 at 1:49 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> On Mon, 24 May 2010, Michael Kerrisk wrote:
>
>> Your patches prompted me to add various other pieces to the man page=
=2E
>> Your comments welcome, if you have a chance to review.
>
> Sure, no problem.
>
> The extra detail to the descriptions is good, but I have some comment=
s on
> the unmaintained ones:
>
>> .IR ru_ixrss " (unmaintained)"
>> On some systems, this is the integral of the text segment memory con=
sumption,
>> expressed in kilobyte-seconds.
>> .TP
>> .IR ru_idrss " (unmaintained)"
>> On some systems, this is the integral of the data segment memory con=
sumption,
>> expressed in kilobyte-seconds.
>> .TP
>> .IR ru_isrss " (unmaintained)"
>> On some systems, this is the integral of the stack memory consumptio=
n,
>> expressed in kilobyte-seconds.
>> .TP
> [...]
>> .IR ru_nswap =A0" (unmaintained)"
>> On some systems, this is the number of swaps out of physical memory.
>> .TP
> [...]
>> .IR ru_msgsnd " (unmaintained)"
>> .\" On FreeBSD 6.2, this appears to measure messages sent on sockets
>> On some systems,
>> this field records the number of messages sent over sockets.
>> .TP
>> .IR ru_msgrcv " (unmaintained)"
>> .\" On FreeBSD 6.2, this appears to measure messages received on soc=
kets
>> On some systems,
>> this field records the number of messages received over sockets.
>> .TP
>> .IR ru_nsignals " (unmaintained)"
>> On some systems, this field records the numner of signals received.
>> .TP
>
> In my changes I decided specifically to leave out the unmaintained fi=
elds.
> My reasoning was an assumption that the man page is to document the L=
inux
> getrusage() call. If something is unimplemented on Linux then a
> explanation of what it does or "appears to" do on another platform is=
 not
> relevant, and will easily be misleading or out of date; that informat=
ion
> can easily and definitively be found in documentation for the other
> platforms.
>
> Including them has opened a can of worms already: what is the differe=
nce
> between messages "sent on" sockets, or "sent over" sockets?

Hmmm -- that's just a language issue.

> There's a typo: "numner".

Thanks.

> Thanks for applying the patches.

I see your point, but on the other hand, people will always ask: why
are those fields there? The text was my attempt to address that
question. But, perhaps you are right. I've commented out my text, and
added a generic statement for each of the fields that it is currently
unused on Linux, and an overall statement about why the unmaintained
fields even appear in the structure.

Cheers,

Michael

--- a/man2/getrusage.2
+++ b/man2/getrusage.2
@@ -36,7 +36,7 @@
 .\"     document ru_maxrss
 .\" 2010-05-24, mtk, enhanced description of various fields
 .\"
-.TH GETRUSAGE 2 2010-05-24 "Linux" "Linux Programmer's Manual"
+.TH GETRUSAGE 2 2010-06-14 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getrusage \- get resource usage
 .SH SYNOPSIS
@@ -93,8 +93,11 @@ struct rusage {
 .fi
 .in
 .PP
-Not all fields are completed; unmaintained fields are set to zero by
-the kernel. The fields are interpreted as follows:
+Not all fields are completed;
+unmaintained fields are set to zero by the kernel.
+(The unmaintained fields are provided for compatibility with other sys=
tems,
+and because they may one day be supported on Linux.)
+The fields are interpreted as follows:
 .TP
 .I ru_utime
 This is the total amount of time spent executing in user mode,
@@ -115,16 +118,20 @@ this is the resident set size of the largest
child, not the maximum
 resident set size of the process tree.
 .TP
 .IR ru_ixrss " (unmaintained)"
-On some systems, this is the integral of the text segment memory consu=
mption,
-expressed in kilobyte-seconds.
+This field is currently unused on Linux.
+.\" On some systems,
+.\" this is the integral of the text segment memory consumption,
+.\" expressed in kilobyte-seconds.
 .TP
 .IR ru_idrss " (unmaintained)"
-On some systems, this is the integral of the data segment memory consu=
mption,
-expressed in kilobyte-seconds.
+This field is currently unused on Linux.
+.\" On some systems, this is the integral of the data segment memory
consumption,
+.\" expressed in kilobyte-seconds.
 .TP
 .IR ru_isrss " (unmaintained)"
-On some systems, this is the integral of the stack memory consumption,
-expressed in kilobyte-seconds.
+This field is currently unused on Linux.
+.\" On some systems, this is the integral of the stack memory consumpt=
ion,
+.\" expressed in kilobyte-seconds.
 .TP
 .I ru_minflt
 The number of page faults serviced without any I/O activity; here
@@ -135,7 +142,8 @@ the list of pages awaiting reallocation.
 The number of page faults serviced that required I/O activity.
 .TP
 .IR ru_nswap  " (unmaintained)"
-On some systems, this is the number of swaps out of physical memory.
+This field is currently unused on Linux.
+.\" On some systems, this is the number of swaps out of physical memor=
y.
 .TP
 .IR ru_inblock " (since Linux 2.6.22)"
 The number of times the file system had to perform input.
@@ -144,17 +152,20 @@ The number of times the file system had to perfor=
m input.
 The number of times the file system had to perform output.
 .TP
 .IR ru_msgsnd " (unmaintained)"
+This field is currently unused on Linux.
 .\" On FreeBSD 6.2, this appears to measure messages sent over sockets
-On some systems,
-this field records the number of messages sent over sockets.
+.\" On some systems,
+.\" this field records the number of messages sent over sockets.
 .TP
 .IR ru_msgrcv " (unmaintained)"
+This field is currently unused on Linux.
 .\" On FreeBSD 6.2, this appears to measure messages received over soc=
kets
-On some systems,
-this field records the number of messages received over sockets.
+.\" On some systems,
+.\" this field records the number of messages received over sockets.
 .TP
 .IR ru_nsignals " (unmaintained)"
-On some systems, this field records the number of signals received.
+This field is currently unused on Linux.
+.\" On some systems, this field records the number of signals received=
=2E
 .TP
 .IR ru_nvcsw " (since Linux 2.6)"
 The number of times a context switch resulted due to a process
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
