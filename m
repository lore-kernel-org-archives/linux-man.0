From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/2] perf_event_open.2: cfix
Date: Tue, 23 Jul 2013 20:22:15 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1307232019570.22444@vincent-weaver-1.um.maine.edu>
References: <1374519679-1390-1-git-send-email-taffit@debian.org> <1374519679-1390-2-git-send-email-taffit@debian.org> <51EE6858.1050607@gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1617610819-1374625341=:22444"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51EE6858.1050607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?ISO-8859-15?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1617610819-1374625341=:22444
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Tue, 23 Jul 2013, Michael Kerrisk (man-pages) wrote:

> On 07/22/13 21:01, David Prévot wrote:
> > ---
> >  man2/perf_event_open.2 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I'm not so sure that the change below is correct. Maybe Vince has some
> input.

it's probably best to have consistent capitalization, and lower case 
is probably fine.

I should research further what "remote cache 2 hops" really means, but 
that is probably a job for another day.

Vince



> > diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> > index b1a7114..ef89b05 100644
> > --- a/man2/perf_event_open.2
> > +++ b/man2/perf_event_open.2
> > @@ -1673,7 +1673,7 @@ memory hierarchy level hit or miss, a bitwise combination of
> >  .B PERF_MEM_LVL_REM_CCE1
> >  (remote cache 1 hop),
> >  .B PERF_MEM_LVL_REM_CCE2
> > -(remote Cache 2 hops),
> > +(remote cache 2 hops),
> >  .B PERF_MEM_LVL_IO
> >  (I/O memory), and
> >  .B PERF_MEM_LVL_UNC
> 
> 
--8323329-1617610819-1374625341=:22444--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
