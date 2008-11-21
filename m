From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: TCP_CONGESTION documentation
Date: Fri, 21 Nov 2008 15:32:54 -0500
Message-ID: <cfd18e0f0811211232q5025a785q52dfa1bbb846e0eb@mail.gmail.com>
References: <4926DC7B.7020203@gmail.com> <20081121115759.5a53aaa4@extreme>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <20081121115759.5a53aaa4@extreme>
Content-Disposition: inline
Sender: linux-net-owner@vger.kernel.org
To: Stephen Hemminger <shemminger@linux-foundation.org>
Cc: David Miller <davem@davemloft.net>, linux-net@vger.kernel.org, Andi Kleen <ak@suse.de>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi Stephen,

On Fri, Nov 21, 2008 at 2:57 PM, Stephen Hemminger
<shemminger@linux-foundation.org> wrote:
> On Fri, 21 Nov 2008 11:06:19 -0500
> Michael Kerrisk <mtk.manpages@googlemail.com> wrote:
>
>> Hello Stephen,
>>
>> Back in 2.6.13, you added the TCP_CONGESTION sockopt, but
>> provided no man-page patch...
>>
>> Below is my attempt to document this sockopt.  Could you please
>> review.  Please don't assume I've well understood the code: I
>> may well have messed up in my reading of it, so review what
>> I've written with care.
>>
>> Also, a question: was the silent truncation of the returned
>> string on getsockopt() if optlen is too small really intended?
>> Would it not be/have been better to error on this case?

You added some other stuff below, but I got no response to the review
request and the question above?

>>    TCP_CONGESTION (since Linux 2.6.13)
>>       Get  or  set  the  congestion-control algorithm for this
>>       socket.   The  optval  argument  is  a  pointer   to   a
>>       character-string buffer.
>>
>>       For  getsockopt()  *optlen specifies the amount of space
>>       available in the buffer  pointed  to  by  optval,  which
>>       should  be  at  least  16  bytes (defined by the kernel-
>>       internal  constant  TCP_CA_NAME_MAX).   On  return,  the
>>       buffer  pointed to by optval is set to a null-terminated
>>       string containing the  name  of  the  congestion-control
>>       algorithm  for  this  socket,  and *optlen is set to the
>>       minimum of its original value and  TCP_CA_NAME_MAX.   If
>>       the  value  passed  in  *optlen  is  too small, then the
>>       string returned in *optval is silently truncated, and no
>>       terminating  null  byte is added.  If an empty string is
>>       returned, then the socket is using the  default  conges-
>>       tion-control  algorithm,  determined  as described under
>>       tcp_congestion_control above.
>>
>>       For setsockopt() optlen specifies the length of the con-
>>       gestion-control  algorithm  name contained in the buffer
>>       pointed to by optval; this length need not  include  any
>>       terminating  null  byte.  The algorithm "reno" is always
>>       permitted; other algorithms may be available,  depending
>>       on  kernel configuration.  Possible errors from setsock-
>>       opt() include: algorithm not  found/available  (ENOENT);
>>       setting  this algorithm requires the CAP_NET_ADMIN capa-
>>       bility  (EPERM);  and  failure  getting  kernel   module
>>       (EBUSY).

> The tcp(7) man page is related

(I'm a little confused by that remark: the patch at the end of my mail
was *for* the tcp(7) man page; maybe you missed that.)

> and seems out of date as well.

Yes, many things on it are out of date.  (I've made occasional
requests to linux-net for help on this point, but have had little
response.)

> At least on this sytem (Ubuntu 8.04).it seems to be stuck back in pre 2.6.12

Yes, 2.6.12 sounds about right.

> timewarp (see tcp_bic, tcp_bic_low_window, ...) values that no
> longer exist.

And when they disappear, no one CCs the man-page maintainer :-(.

Anyway, thanks for the heads up

tcp_bic* is now fixed (disappeared in 2.6.13)
and
tcp_westwood is now fixed (disappeared in 2.6.13)
and
tcp_vegas_cong_avoid is now fixed (disappeared in 2.6.13)

> Should be updated as well.

I'm working on it.  Many updates to tcp(7) will be in man-pages-3.14.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
