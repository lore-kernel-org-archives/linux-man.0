From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] qsort.3: document qsort_r
Date: Thu, 8 Mar 2012 10:40:58 +1300
Message-ID: <CAKgNAkgCPruyL+2RKcdLPDrkX1K64NOJ60ZS718HAd61ZysHCQ@mail.gmail.com>
References: <55128.1325592712@proseconsulting.co.uk> <CAKgNAkhgUnrHnxhOhjL8+tH=Msq_+ASgqvzWAwHc5+TpqOzx7w@mail.gmail.com>
 <1330984528.3439.13.camel@tinky.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330984528.3439.13.camel-P4ps6/jurk3DOqzlkpFKJg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben <software-QW8DL1zPdzBaa/9Udqfwiw@public.gmane.org>
Cc: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Ben,

On Tue, Mar 6, 2012 at 10:55 AM, Ben <software-QW8DL1zPdzBaa/9Udqfwiw@public.gmane.org> wrote:
> On Tue, 2012-03-06 at 08:00 +1300, Michael Kerrisk (man-pages) wrote:
>> Mark, Ben,
>>
>> Mark submitted an initial patch that I have been slow to respond to.
>> Mark, is there anything in Ben's patch that could be included in you=
r
>> patch?
>
> I included a reference to the feature test macros used to enable
> qsort_r. =A0That's pretty much the only significant difference. =A0Th=
e other
> changes were to alter the spacing in the SYNOPSIS section to reflect =
the
> more usual style for function pointers.
>
> I've attached a new patch that (a) has all of Mark's patch, (b) a
> reference to the feature test macros, (c) the two spacing changes in =
the
> type of the function pointers, and (d) replacing "sorts an array" wit=
h
> "sort and array" which, I think, is better when two functions are bei=
ng
> described. =A0I hope that helps. =A0If it doesn't please feel free to=
 ignore
> it.

Ben, thanks for that. I've applied all of the above.

Mark, thanks for the initial patch!

Cheers,

Michael
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
