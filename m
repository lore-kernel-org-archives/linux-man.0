From: Cyrill Gorcunov <gorcunov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Sun, 14 Aug 2016 11:40:26 +0300
Message-ID: <20160814084026.GA1857@uranus.lan>
References: <1470097536-17377-1-git-send-email-jann@thejh.net>
 <b97bbf47-1180-0d32-ba08-1482020cc883@gmail.com>
 <20160803225254.GA14948@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160803225254.GA14948-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Iago =?iso-8859-1?Q?L=F3pez?= Galeiras <iago-973cpzSjLbNWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Aug 04, 2016 at 12:52:54AM +0200, Jann Horn wrote:
...
> > 
> > Thanks for this! I tweaked your text somewhat, and added some
> > details about kernel configuration options, so that now the text
> > reads:
> > 
> >        /proc/[pid]/task/[tid]/children (since Linux 3.5)
> >               A  space-separated  list  of child tasks of this task.
> >               Each child task is represented by its TID.
> > 
> >               This option is intended for  use  by  the  checkpoint-
> >               restore (CRIU) system, and reliably provides a list of
> >               children only  if  all  of  the  child  processes  are
> >               stopped or frozen.  It does not work properly if chil‐
> >               dren of the target task exit while the file  is  being
> >               read!  Exiting children may cause non-exiting children
> >               to be omitted from the list.  This makes  this  inter‐
> >               face  even  more  unreliable  than  classic  PID-based
> >               approaches if the  inspected  task  and  its  children
> >               aren't  frozen,  and most code should probably not use
> >               this interface.

Hi! First of all, sorry for delay. Guys, this is not really true. The same
applies to plain "ls /proc". You can fetch pid from the procfs and then
process get dead just right after you've finished reading. So this interface
works "properly" all the time, but if one needs precise results it should
stop/freeze processes first. In contrary I think it worth switching into
children interface in user-space programs because it incredibly fast.

> > 
> >               Until Linux 4.2, the presence of this  file  was  gov‐
> >               erned by the CONFIG_CHECKPOINT_RESTORE kernel configu‐
> >               ration option.  Since Linux 4.2, it it is governed  by
> >               the CONFIG_PROC_CHILDREN option.
> > 
> > Look okay?
> 
> Looks good to me.



	Cyrill
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
