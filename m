From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 8/9] Consistently define the Epoch
Date: Sun, 17 Jan 2010 17:58:10 +1300
Message-ID: <cfd18e0f1001162058r3ced2ba0q47949b0bb0a3efeb@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-9-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-9-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> All definitions of the Epoch have been refactored to the following:
>
> =A01970-01-01 00:00:00 +0000 (UTC)
>
> That form is more consistent, logical, precise, and internationally
> recognizable than the other variants.
>
> Also, some wording has been altered as well.

Thanks! Applied.

Cheers,

Michael


> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/stime.2 =A0 =A0 =A0| =A0 =A04 ++--
> =A0man2/time.2 =A0 =A0 =A0 | =A0 =A04 ++--
> =A0man2/utimensat.2 =A0| =A0 =A06 +++---
> =A0man3/ctime.3 =A0 =A0 =A0| =A0 =A03 +--
> =A0man3/difftime.3 =A0 | =A0 =A06 +++---
> =A0man3/ftime.3 =A0 =A0 =A0| =A0 =A04 ++--
> =A0man3/getspnam.3 =A0 | =A0 =A04 ++--
> =A0man3/mq_receive.3 | =A0 =A02 +-
> =A0man3/mq_send.3 =A0 =A0| =A0 =A02 +-
> =A0man3/rtime.3 =A0 =A0 =A0| =A0 =A04 ++--
> =A0man3/sem_wait.3 =A0 | =A0 =A02 +-
> =A0man3/strftime.3 =A0 | =A0 =A03 +--
> =A0man3/strptime.3 =A0 | =A0 =A03 +--
> =A0man3/timeradd.3 =A0 | =A0 =A03 +--
> =A0man4/rtc.4 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0man5/core.5 =A0 =A0 =A0 | =A0 =A02 +-
> =A0man5/proc.5 =A0 =A0 =A0 | =A0 =A02 +-
> =A0man7/icmp.7 =A0 =A0 =A0 | =A0 =A02 +-
> =A0man7/time.7 =A0 =A0 =A0 | =A0 =A02 +-
> =A019 files changed, 28 insertions(+), 32 deletions(-)
>
> diff --git a/man2/stime.2 b/man2/stime.2
> index 530d223..534e297 100644
> --- a/man2/stime.2
> +++ b/man2/stime.2
> @@ -45,8 +45,8 @@ _SVID_SOURCE
> =A0.SH DESCRIPTION
> =A0.BR stime ()
> =A0sets the system's idea of the time and date.
> -Time, pointed
> -to by \fIt\fP, is measured in seconds from 00:00:00 UTC January 1, 1=
970.
> +The time, pointed
> +to by \fIt\fP, is measured in seconds since the Epoch, 1970-01-01 00=
:00:00 +0000 (UTC).
> =A0.BR stime ()
> =A0may only be executed by the superuser.
> =A0.SH "RETURN VALUE"
> diff --git a/man2/time.2 b/man2/time.2
> index 5fae9d9..c4b7679 100644
> --- a/man2/time.2
> +++ b/man2/time.2
> @@ -35,8 +35,8 @@ time \- get time in seconds
> =A0.BI "time_t time(time_t *" t );
> =A0.SH DESCRIPTION
> =A0.BR time ()
> -returns the time since the Epoch
> -(00:00:00 UTC, January 1, 1970), measured in seconds.
> +returns the time as the number of seconds since the Epoch,
> +1970-01-01 00:00:00 +0000 (UTC).
>
> =A0If
> =A0.I t
> diff --git a/man2/utimensat.2 b/man2/utimensat.2
> index a87e66e..76725b2 100644
> --- a/man2/utimensat.2
> +++ b/man2/utimensat.2
> @@ -78,9 +78,9 @@ specifies the new "last access time" (\fIatime\fP);
> =A0specifies the new "last modification time" (\fImtime\fP).
> =A0Each of the elements of
> =A0.I times
> -specifies a time in seconds and nanoseconds
> -since the Epoch (00:00:00, 1 Jan 1970, UTC),
> -in a structure of the following form:
> +specifies a time as the the number of seconds and nanoseconds
> +since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
> +This information is conveyed in a structure of the following form:
> =A0.in +4n
> =A0.nf
>
> diff --git a/man3/ctime.3 b/man3/ctime.3
> index 75e2f76..132c364 100644
> --- a/man3/ctime.3
> +++ b/man3/ctime.3
> @@ -78,8 +78,7 @@ and
> =A0functions all take
> =A0an argument of data type \fItime_t\fP which represents calendar ti=
me.
> =A0When interpreted as an absolute time value, it represents the numb=
er of
> -seconds elapsed since 00:00:00 on January 1, 1970, Coordinated Unive=
rsal
> -Time (UTC).
> +seconds elapsed since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
> =A0.PP
> =A0The
> =A0.BR asctime ()
> diff --git a/man3/difftime.3 b/man3/difftime.3
> index 5567751..79887b1 100644
> --- a/man3/difftime.3
> +++ b/man3/difftime.3
> @@ -40,9 +40,9 @@ The
> =A0function returns the number of seconds elapsed
> =A0between time \fItime1\fP and time \fItime0\fP, represented as a
> =A0.IR double .
> -The two times are specified in calendar time, which represents the t=
ime
> -elapsed since the Epoch
> -(00:00:00 on January 1, 1970, Coordinated Universal Time (UTC)).
> +Each of the times is specified in calendar time, which means its
> +value is a measurement (in seconds) relative to the Epoch,
> +1970-01-01 00:00:00 +0000 (UTC).
> =A0.SH "CONFORMING TO"
> =A0SVr4, 4.3BSD, C89, C99.
> =A0.SH NOTES
> diff --git a/man3/ftime.3 b/man3/ftime.3
> index ce01574..2304b9a 100644
> --- a/man3/ftime.3
> +++ b/man3/ftime.3
> @@ -36,8 +36,8 @@ ftime \- return date and time
> =A0.sp
> =A0.BI "int ftime(struct timeb *" tp );
> =A0.SH DESCRIPTION
> -This function returns the current time, in seconds and milliseconds
> -since the Epoch (00:00:00 UTC, 1 January 1970).
> +This function returns the current time as seconds and milliseconds
> +since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
> =A0The time is returned in
> =A0.IR tp ,
> =A0which is declared as follows:
> diff --git a/man3/getspnam.3 b/man3/getspnam.3
> index fdfc1fb..d4ca057 100644
> --- a/man3/getspnam.3
> +++ b/man3/getspnam.3
> @@ -194,7 +194,7 @@ struct spwd {
> =A0 =A0 char *sp_namp; =A0 =A0 /* Login name */
> =A0 =A0 char *sp_pwdp; =A0 =A0 /* Encrypted password */
> =A0 =A0 long =A0sp_lstchg; =A0 /* Date of last change (measured
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in days since 1 =
Jan 1970) */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in days since 19=
70-01-01 00:00:00 +0000 (UTC)) */
> =A0 =A0 long =A0sp_min; =A0 =A0 =A0/* Min # of days between changes *=
/
> =A0 =A0 long =A0sp_max; =A0 =A0 =A0/* Max # of days between changes *=
/
> =A0 =A0 long =A0sp_warn; =A0 =A0 /* # of days before password expires
> @@ -202,7 +202,7 @@ struct spwd {
> =A0 =A0 long =A0sp_inact; =A0 =A0/* # of days after password expires
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 until account is =
disabled */
> =A0 =A0 long =A0sp_expire; =A0 /* Date when account expires (measured
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in days since 1 =
Jan 1970) */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in days since 19=
70-01-01 00:00:00 +0000 (UTC)) */
> =A0 =A0 unsigned long sp_flag; =A0/* Reserved */
> =A0};
> =A0.fi
> diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
> index 32343a0..9a55812 100644
> --- a/man3/mq_receive.3
> +++ b/man3/mq_receive.3
> @@ -83,7 +83,7 @@ flag is not enabled for the message queue descripti=
on, then
> =A0points to a structure which specifies a ceiling on the time for wh=
ich
> =A0the call will block.
> =A0This ceiling is an absolute timeout in seconds and nanoseconds
> -since the Epoch (midnight on the morning of 1 January 1970),
> +since the Epoch, 1970-01-01 00:00:00 +0000 (UTC), and it is
> =A0specified in the following structure:
> =A0.sp
> =A0.in +4n
> diff --git a/man3/mq_send.3 b/man3/mq_send.3
> index 3271d88..52eda2a 100644
> --- a/man3/mq_send.3
> +++ b/man3/mq_send.3
> @@ -89,7 +89,7 @@ flag is not enabled for the message queue descripti=
on, then
> =A0points to a structure which specifies a ceiling on the time for wh=
ich
> =A0the call will block.
> =A0This ceiling is an absolute timeout in seconds and nanoseconds
> -since the Epoch (midnight on the morning of 1 January 1970),
> +since the Epoch, 1970-01-01 00:00:00 +0000 (UTC), and it is
> =A0specified in the following structure:
> =A0.sp
> =A0.in +4n
> diff --git a/man3/rtime.3 b/man3/rtime.3
> index 24be759..cd84f44 100644
> --- a/man3/rtime.3
> +++ b/man3/rtime.3
> @@ -22,8 +22,8 @@ RFC\ 868 to obtain the time from a remote machine.
> =A0The Time Server Protocol gives the time in seconds since
> =A000:00:00 UTC, 1 Jan 1900,
> =A0and this function subtracts the appropriate constant in order to
> -convert the result to seconds since
> -00:00:00 UTC, 1 Jan 1970, the Unix Epoch.
> +convert the result to seconds since the Epoch,
> +1970-01-01 00:00:00 +0000 (UTC).
> =A0.LP
> =A0When
> =A0.I timeout
> diff --git a/man3/sem_wait.3 b/man3/sem_wait.3
> index 526f57d..062e436 100644
> --- a/man3/sem_wait.3
> +++ b/man3/sem_wait.3
> @@ -77,7 +77,7 @@ should block if the decrement cannot be immediately=
 performed.
> =A0The
> =A0.I abs_timeout
> =A0argument points to a structure that specifies an absolute timeout
> -in seconds and nanoseconds since the Epoch (00:00:00, 1 January 1970=
).
> +in seconds and nanoseconds since the Epoch, 1970-01-01 00:00:00 +000=
0 (UTC).
> =A0This structure is defined as follows:
>
> =A0.nf
> diff --git a/man3/strftime.3 b/man3/strftime.3
> index ee7b097..89b3a32 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -187,8 +187,7 @@ For a version including the seconds, see
> =A0below.
> =A0.TP
> =A0.B %s
> -The number of seconds since the Epoch, that is, since 1970-01-01
> -00:00:00 UTC. (TZ)
> +The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UT=
C). (TZ)
> =A0.TP
> =A0.B %S
> =A0The second as a decimal number (range 00 to 60).
> diff --git a/man3/strptime.3 b/man3/strptime.3
> index aaba1d1..37b5fcb 100644
> --- a/man3/strptime.3
> +++ b/man3/strptime.3
> @@ -374,8 +374,7 @@ is accepted as a synonym for
> =A0Finally
> =A0.TP
> =A0.B %s
> -The number of seconds since the Epoch,
> -that is, since 1970-01-01 00:00:00 UTC.
> +The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UT=
C).
> =A0Leap seconds are not counted unless leap second support is availab=
le.
> =A0.LP
> =A0The glibc implementation does not require whitespace between
> diff --git a/man3/timeradd.3 b/man3/timeradd.3
> index 869b9e7..67a7fb5 100644
> --- a/man3/timeradd.3
> +++ b/man3/timeradd.3
> @@ -96,8 +96,7 @@ zeros out the
> =A0.I timeval
> =A0structure pointed to by
> =A0.IR tvp ,
> -so that it represents the time at midnight
> -on the morning of 1 January 1970 (the Epoch).
> +so that it represents the Epoch: 1970-01-01 00:00:00 +0000 (UTC).
>
> =A0.BR timerisset ()
> =A0returns true (non-zero) if either field of the
> diff --git a/man4/rtc.4 b/man4/rtc.4
> index c4578b3..77ba983 100644
> --- a/man4/rtc.4
> +++ b/man4/rtc.4
> @@ -59,7 +59,7 @@ and
> =A0.BR time (2),
> =A0as well as setting timestamps on files, etc.
> =A0The system clock reports seconds and microseconds since a start po=
int,
> -defined to be the POSIX Epoch: Jan 1, 1970, 0:00 UTC.
> +defined to be the POSIX Epoch: 1970-01-01 00:00:00 +0000 (UTC).
> =A0(One common implementation counts timer interrupts, once
> =A0per "jiffy", at a frequency of 100, 250, or 1000 Hz.)
> =A0That is, it is supposed to report wall clock time, which RTCs also=
 do.
> diff --git a/man5/core.5 b/man5/core.5
> index 886e88a..2d417f0 100644
> --- a/man5/core.5
> +++ b/man5/core.5
> @@ -125,7 +125,7 @@ PID of dumped process
> =A0number of signal causing dump
> =A0.TP
> =A0%t
> -time of dump, expressed as seconds since the Epoch (00:00h, 1\ Jan 1=
970, UTC)
> +time of dump, expressed as seconds since the Epoch, 1970-01-01 00:00=
:00 +0000 (UTC)
> =A0.TP
> =A0%h
> =A0hostname (same as \fInodename\fP returned by \fBuname\fP(2))
> diff --git a/man5/proc.5 b/man5/proc.5
> index 3da30af..a9b24ff 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1683,7 +1683,7 @@ each subsequent column is the total for a parti=
cular interrupt.
> =A0The number of context switches that the system underwent.
> =A0.TP
> =A0\fIbtime 769041601\fP
> -boot time, in seconds since the Epoch (January 1, 1970).
> +boot time, in seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UT=
C).
> =A0.TP
> =A0\fIprocesses 86031\fP
> =A0Number of forks since boot.
> diff --git a/man7/icmp.7 b/man7/icmp.7
> index c5b676a..e777023 100644
> --- a/man7/icmp.7
> +++ b/man7/icmp.7
> @@ -176,7 +176,7 @@ routing table and the redirect routes are expired=
 after some time.
> =A0.PP
> =A0The 64-bit timestamp returned by
> =A0.B ICMP_TIMESTAMP
> -is in milliseconds since January 1, 1970.
> +is in milliseconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
> =A0.PP
> =A0Linux ICMP internally uses a raw socket to send ICMPs.
> =A0This raw socket may appear in
> diff --git a/man7/time.7 b/man7/time.7
> index 69c08cd..7c22da0 100644
> --- a/man7/time.7
> +++ b/man7/time.7
> @@ -124,7 +124,7 @@ HRTs are not supported on all hardware architectu=
res.
> =A0.SS "The Epoch"
> =A0Unix systems represent time in seconds since the
> =A0.IR Epoch ,
> -which is defined as 0:00:00 UTC on the morning of 1 January 1970.
> +1970-01-01 00:00:00 +0000 (UTC).
>
> =A0A program can determine the
> =A0.I "calendar time"
> --
> 1.6.6.102.gd6f8f
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
