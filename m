From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Reference to Documentation/perf-record.txt broken
Date: Sat, 22 Oct 2016 13:52:27 +0200
Message-ID: <CAKgNAki-EmLK1U5PTWsCzXYvFDPcTWaybijzVzNLqCV2Gq22Hw@mail.gmail.com>
References: <415EAD72-096F-47F4-AB66-26BDFCCEA939@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <415EAD72-096F-47F4-AB66-26BDFCCEA939-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Hausenblas <michael.hausenblas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael

On 22 October 2016 at 12:50, Michael Hausenblas
<michael.hausenblas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> In http://man7.org/linux/man-pages/man7/cgroups.7.html within the 'Cgroups version 1 controllers' section the following is stated under the 'perf_event' entry:
>
> [[
> Further information can be found in the kernel source file
>
> Documentation/perf-record.txt.
> ]]
>
> Which suggests that there is more information at https://www.kernel.org/doc/Documentation/perf-record.txt

Thanks for the report. The pathname should be
tools/perf/Documentation/perf-record.txt. I've made a fix to the
manual page.

Cheers,

Michael


>
> I was however not able to find anything there or, FWIW, in https://www.kernel.org/doc/Documentation/cgroup-v1/ where one would expect it in the first place.
>
> Cheers,
>                 Michael
>
> --
> Michael Hausenblas
> Ireland, Europe
> http://mhausenblas.info
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
