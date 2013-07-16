From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open() -- improve sysfs files documentation
Date: Tue, 16 Jul 2013 10:21:20 +0200
Message-ID: <51E50280.4070204@gmail.com>
References: <alpine.DEB.2.10.1307160134570.31834@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1307160134570.31834-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/16/13 07:36, Vince Weaver wrote:
> 
> This improves the documentation of the various perf_event_open()
> related sysfs files.

Thanks, Vince. Applied.

Cheers,

Michael



> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 504e801..e7ddcb2 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1926,6 +1926,7 @@ The default value is
>  
>  Maximum number of pages an unprivileged user can mlock (2) .
>  The default is 516 (kB).
> +
>  .RE
>  Files in
>  .I /sys/bus/event_source/devices/
> @@ -1936,30 +1937,59 @@ Information on how to program these PMUs can be found under
>  .IR /sys/bus/event_source/devices/ .
>  Each subdirectory corresponds to a different PMU.
>  .TP
> -.I /sys/bus/event_source/devices/*/type
> +.IR /sys/bus/event_source/devices/*/type " (Since Linux 2.6.38)"
>  This contains an integer that can be used in the
>  .I type
>  field of perf_event_attr to indicate you wish to use this PMU.
>  .TP
> -.I /sys/bus/event_source/devices/*/rdpmc
> -[To be documented]
> +.IR /sys/bus/event_source/devices/*/rdpmc " (Since Linux 3.4)"
> +If this file is 1, then direct user-space access to the 
> +performance counter registers is allowed via the rdpmc instruction.
> +This can be disabled by echoing 0 to the file.
>  .TP
> -.I /sys/bus/event_source/devices/*/format/
> -This sub-directory contains information on what bits in the
> +.IR /sys/bus/event_source/devices/*/format/ " (Since Linux 3.4)"
> +This sub-directory contains information on the architecture-specific
> +sub-fields available for programming the various
>  .I config
> -field of perf_event_attr correspond to.
> -.TP
> -.I /sys/bus/event_source/devices/*/events/
> +fields in the perf_event_attr struct.
> +
> +The content of each file is the name of the config field, followed
> +by a colon, followed by a series of integer bit ranges separated by
> +commas.
> +For example, the file 
> +.I event
> +may contain the value
> +.I config1:1,6-10,44
> +which indicates that event is an attribute that occupies bits 1,6-10, and 44
> +of perf_event_attr::config1.
> +.TP
> +.IR /sys/bus/event_source/devices/*/events/ " (Since Linux 3.4)"
>  This sub-directory contains files with pre-defined events.
>  The contents are strings describing the event settings
> -expressed in terms of the fields found in the
> +expressed in terms of the fields found in the previously mentioned
>  .I ./format/
>  directory.
>  These are not necessarily complete lists of all events supported by
>  a PMU, but usually a subset of events deemed useful or interesting.
> +
> +The content of each file is a list of attribute names
> +separated by commas.  
> +Each entry has an optional value (either hex or decimal).  
> +If no value is specified than it is assumed to be a single-bit
> +field with a value of 1.
> +An example entry may look like this:
> +.I event=0x2,inv,ldlat=3
>  .TP
>  .I /sys/bus/event_source/devices/*/uevent
> -[To be documented]
> +This file is the standard kernel device interface
> +for injecting hotplug events.
> +.TP
> +.IR /sys/bus/event_source/devices/*/cpumask " (Since Linux 3.7)"
> +The cpumask file contains a comma-separated list of integers that 
> +indicate a representative cpu number for each socket (package)
> +on the motherboard.
> +This is needed when setting up uncore or northbridge events, as
> +those PMUs present socket-wide events.
>  .RE
>  .SH RETURN VALUE
>  .BR perf_event_open ()
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
