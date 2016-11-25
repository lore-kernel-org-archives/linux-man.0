From: Afzal Mohammed <afzal.mohd.ma@gmail.com>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 18:22:46 +0530
Message-ID: <20161125125246.GA7600@afzalpc>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Mike Galbraith <efault@gmx.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

Hi,

On Thu, Nov 24, 2016 at 10:41:29PM +0100, Michael Kerrisk (man-pages) wrote:

>        Suppose  that  there  are two autogroups competing for the same
>        CPU.  The first group contains ten CPU-bound processes  from  a
>        kernel build started with make -j10.  The other contains a sin‐
>        gle CPU-bound process: a video player.   The  effect  of  auto‐
>        grouping  is  that the two groups will each receive half of the
>        CPU cycles.  That is, the video player will receive 50% of  the
>        CPU  cycles,  rather  just 9% of the cycles, which would likely
                            ^^^^
                            than ?

Regards
afzal

>        lead to degraded video playback.  Or to put things another way:
>        an  autogroup  that  contains  a large number of CPU-bound pro‐
>        cesses does not end up overwhelming the CPU at the  expense  of
>        the other jobs on the system.
