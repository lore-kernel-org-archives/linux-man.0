From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: core_pattern pipe documentation
Date: Wed, 23 Apr 2008 14:09:14 +0200
Message-ID: <cfd18e0f0804230509g4e7456ecgd40c0bfee874a82c@mail.gmail.com>
References: <cfd18e0f0804151409q178addf4t4c6cba683bd0bff4@mail.gmail.com>
	 <cfd18e0f0804151411x62080f10y833493db7f1b8cfd@mail.gmail.com>
	 <48051FBA.60503@firstfloor.org> <4808D1F4.7050705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4808D1F4.7050705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Petr Gajdos <pgajdos-AlSwsSmVLrQ@public.gmane.org>, michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andi -- ping!

Adding Neil to CC, since it looks like he also did some work here, and
so can perhaps comment.

On Fri, Apr 18, 2008 at 6:53 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Andi,
>
> I wrote the following description of the core_pattern pipe feature.  Does this
> seem okay?
>
>   Piping core dumps to a program
>       Since kernel 2.6.19, Linux supports an  alternate  syntax
>       for the /proc/sys/kernel/core_pattern file.  If the first
>       character of this file is a pipe  symbol  (|),  then  the
>       remainder  of  the line is interpreted as a program to be
>       executed.  Instead of being written to a disk  file,  the
>       core  dump  is  given  as  standard input to the program.
>       Note the following points:
>
>       *  The program must be specified using an absolute  path-
>          name  (or  a  pathname relative to the root directory,
>          /), and must immediately follow the '|' character.
>
>       *  The process created to run the program  runs  as  user
>          and group root.
>
>       *  Arguments can be supplied to the program, delimited by
>          white space (up to a total line length of 128  bytes).
>
> Cheers,
>
> Michael
>
>
> Andi Kleen wrote:
> > Michael Kerrisk wrote:
> >> On Tue, Apr 15, 2008 at 11:09 PM, Michael Kerrisk
> >> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> >>> Hi Andi,
> >>>
> >>> In 2.6.19 you added the pipiing syntax
> >>> (http://lwn.net/Articles/195310/) to core_pattern.  Petr pointed out
> >>> that this is not yet documented in core(5), so I set to testing it.
> >>>
> >>> The change log has the text:
> >>>
> >>>    The core dump proces will run with the privileges and in the name space
> >>>    of the process that caused the core dump.
> >
> > My memory is fuzzy but something might have changed this afterwards
> > (there were some semantics changes afterwards by other people)  I think
> > my original version ran as non root.
> >
> > Anyways the reference as usual is the code, not the change log.
> >
> >>> This appears not to be true (as tested on 2.6.25-rc8).  Instead the
> >>> pipe program is run as root.  I'm not sure what "in the name space of
> >>> the process that caused the core dump" means
> >
> > namespace is a concept from plan9. It basically means the tree
> > of mounts the current process has access to. On 99+% of the systems
> > that is only a single global tree, but there is support for processes
> > creating their own name space using clone CLONE_NEWNS and then
> > mount/umount/mount --bind etc. Linux VFS had this support for
> > some time.
> >
> > The whole thing is very obscure but perhaps some more
> > coverage in the man pages would be not bad. It seems to move
> > slowly out of obscurity now with all the new container work.
> >
> > There is some scattered information in Documentation/*. You'll need
> > someone else to explain you all the finer details though.
> >
> > Also there are lots of different mounts now since a few 2.6 kernels --
> > to be honest I don't understand what they are all good for.
> >
> >
> > -- I wondered if it might
> >>> mean that the current working directory of the program would be the
> >>> same as that of the process that caused the core dump.  However that
> >>> is not so: the current directory for the pipe program is the root
> >>> directory.
> >
> > Basically with a different namespace the paths can change completely,
> > which can in theory have some unpleasant effects on the core dumper
> > script. I skimped this by just always using the same as the process.
> >
> > -Andi
> >
> >
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Want to report a man-pages bug?  Look here:
> http://www.kernel.org/doc/man-pages/reporting_bugs.html
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
