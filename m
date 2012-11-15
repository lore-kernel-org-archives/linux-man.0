From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Wed, 14 Nov 2012 19:21:14 -0800 (PST)
Message-ID: <alpine.DEB.2.00.1211141910050.14414@chino.kir.corp.google.com>
References: <20121107105348.GA25549@lizard> <20121107112136.GA31715@shutemov.name> <CAOJsxLHY+3ZzGuGX=4o1pLfhRqjkKaEMyhX0ejB5nVrDvOWXNA@mail.gmail.com> <20121107114321.GA32265@shutemov.name>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121107114321.GA32265-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Cc: Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 7 Nov 2012, Kirill A. Shutemov wrote:

> > > Sorry, I didn't follow previous discussion on this, but could you
> > > explain what's wrong with memory notifications from memcg?
> > > As I can see you can get pretty similar functionality using memory
> > > thresholds on the root cgroup. What's the point?
> > 
> > Why should you be required to use cgroups to get VM pressure events to
> > userspace?
> 
> Valid point. But in fact you have it on most systems anyway.
> 
> I personally don't like to have a syscall per small feature.
> Isn't it better to have a file-based interface which can be used with
> normal file syscalls: open()/read()/poll()?
> 

I agree that eventfd is the way to go, but I'll also add that this feature 
seems to be implemented at a far too coarse of level.  Memory, and hence 
memory pressure, is constrained by several factors other than just the 
amount of physical RAM which vmpressure_fd is addressing.  What about 
memory pressure caused by cpusets or mempolicies?  (Memcg has its own 
reclaim logic and its own memory thresholds implemented on top of eventfd 
that people already use.)  These both cause high levels of reclaim within 
the page allocator whereas there may be an abundance of free memory 
available on the system.

I don't think we want several implementations of memory pressure 
notifications, so a more generic and flexible interface is going to be 
needed and I think it can't be done in an extendable way through this 
vmpressure_fd syscall.  Unfortunately, I think that means polling on a 
per-thread notifier.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
