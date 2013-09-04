From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: ffix
Date: Wed, 04 Sep 2013 08:12:22 +0200
Message-ID: <5226CF46.9020703@gmail.com>
References: <1378178181-12859-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378178181-12859-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 09/03/13 05:16, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index c7f577d..f96df8c 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -164,7 +164,7 @@ This flag re-routes the output from an event to t=
he group leader.
>  This flag activates per-container system-wide monitoring.
>  A container
>  is an abstraction that isolates a set of resources for finer grain
> -control (CPUs, memory, etc...).
> +control (CPUs, memory, etc.).
>  In this mode, the event is measured
>  only if the thread running on the monitored CPU belongs to the desig=
nated
>  container (cgroup).
> @@ -2010,15 +2010,17 @@ Each entry has an optional value (either hex =
or decimal).
>  If no value is specified than it is assumed to be a single-bit
>  field with a value of 1.
>  An example entry may look like this:
> -.I event=3D0x2,inv,ldlat=3D3
> +.IR event=3D0x2,inv,ldlat=3D3 .
>  .TP
>  .I /sys/bus/event_source/devices/*/uevent
>  This file is the standard kernel device interface
>  for injecting hotplug events.
>  .TP
>  .IR /sys/bus/event_source/devices/*/cpumask " (Since Linux 3.7)"
> -The cpumask file contains a comma-separated list of integers that
> -indicate a representative cpu number for each socket (package)
> +The
> +.I cpumask
> +file contains a comma-separated list of integers that
> +indicate a representative CPU number for each socket (package)
>  on the motherboard.
>  This is needed when setting up uncore or northbridge events, as
>  those PMUs present socket-wide events.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
