From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 17:13:36 +0100
Message-ID: <20161125161336.GJ3174@twins.programming.kicks-ass.net>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <20161125160456.GP3092@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161125160456.GP3092-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Nov 25, 2016 at 05:04:56PM +0100, Peter Zijlstra wrote:
> That is; the whole thing
> becomes, where l denotes the level in the hierarchy and i an
> entity on that level:
> 
>                  l      w_g,i
>   dt_l,i = dt \Prod  ----------
>                 g=0  \Sum w_g,j
> 
> 
> Or more concretely, for E:
> 
>                       w_E
>   dt_1,E = dt_0,C -----------
>                   (w_E + w_F)
> 
>                         w_C               w_E
>          = dt ----------------------- -----------
>               (w_A + w_B + w_C + w_D) (w_E + w_F)
> 

And this also immediately shows one of the 'problems' with it. Since we
don't have floating point in kernel, these fractions are evaluated with
fixed-point arithmetic. Traditionally (and on 32bit) we use 10bit fixed
point, recently we switched to 20bit for 64bit machines.

That change is what bit you on the nice testing.

But it also means that once we run out of fractional bits things go
wobbly. The fractions, as per the above, increase the deeper the group
hierarchy goes but are also affected by the number of CPUs in the system
(not immediately represented in that equation).

Not to mention that many scheduler operations become O(depth) in cost,
which also hurts. An obvious example being task selection, we pick a
runnable entity for each level, until the resulting entity has no
further children (iow. is a task).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
