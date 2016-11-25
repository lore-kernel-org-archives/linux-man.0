From: Mike Galbraith <efault@gmx.de>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 16:51:03 +0100
Message-ID: <1480089063.4075.80.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479901185.4306.38.camel@gmx.de>
         <327586fa-4672-d070-0ded-850654586273@gmail.com>
         <1479915229.4306.106.camel@gmx.de>
         <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
         <1479921075.4306.153.camel@gmx.de>
         <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
         <1480078973.4075.58.camel@gmx.de>
         <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

On Fri, 2016-11-25 at 16:04 +0100, Michael Kerrisk (man-pages) wrote:

> > >        ┌─────────────────────────────────────────────────────┐
> > >        │FIXME                                                │
> > >        ├─────────────────────────────────────────────────────┤
> > >        │How do the nice value of  a  process  and  the  nice │
> > >        │value of an autogroup interact? Which has priority?  │
> > >        │                                                     │
> > >        │It  *appears*  that the autogroup nice value is used │
> > >        │for CPU distribution between task groups,  and  that │
> > >        │the  process nice value has no effect there.  (I.e., │
> > >        │suppose two  autogroups  each  contain  a  CPU-bound │
> > >        │process,  with  one  process  having nice==0 and the │
> > >        │other having nice==19.  It appears  that  they  each │
> > >        │get  50%  of  the CPU.)  It appears that the process │
> > >        │nice value has effect only with respect to  schedul‐ │
> > >        │ing  relative to other processes in the *same* auto‐ │
> > >        │group.  Is this correct?                             │
> > >        └─────────────────────────────────────────────────────┘
> > 
> > Yup, entity nice level affects distribution among peer entities.
> 
> Huh! I only just learned about this via my experiments while
> investigating autogroups. 
> 
> How long have things been like this? Always? (I don't think
> so.) Since the arrival of CFS? Since the arrival of
> autogrouping? (I'm guessing not.) Since some other point?
> (When?)

Always.  Before CFS there just were no non-peers :)

> It seems to me that this renders the traditional process
> nice pretty much useless. (I bet I'm not the only one who'd 
> be surprised by the current behavior.)

Yup, group scheduling is not a single edged sword, those don't exist. 
 Box wide nice loss is not the only thing that can bite you, fairness,
whether group or task oriented cuts both ways.

	-Mike
