From: Mike Galbraith <efault@gmx.de>
Subject: Re: RFC: documentation of the autogroup feature
Date: Wed, 23 Nov 2016 18:11:15 +0100
Message-ID: <1479921075.4306.153.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479901185.4306.38.camel@gmx.de>
         <327586fa-4672-d070-0ded-850654586273@gmail.com>
         <1479915229.4306.106.camel@gmx.de>
         <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

On Wed, 2016-11-23 at 17:04 +0100, Michael Kerrisk (man-pages) wrote:

> > > In what circumstances does a process get moved back to the root 
> > > task group?
> > 
> > Userspace actions, tool or human fingers.
> 
> Could you say a little more please. What Kernel-user-space 
> APIs/system calls/etc. cause this to happen?

Well, the system call would be write(), scribbling in the cgroups vfs
interface.. not all that helpful without ever more technical detail.

> > > Actually, can you define for me what the root task group is, and 
> > > why it exists? That may be worth some words in this man page.
> > 
> > I don't think we need group scheduling details, there's plenty of
> > documentation elsewhere for those who want theory.  
> 
> Well, you suggested above 
> 
>     Perhaps mention that moving a task back to the root task
>     group will result in the autogroup again taking effect.

Dang, evolution doesn't have an unsend button :)

	-Mike
