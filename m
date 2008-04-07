From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: manpages: explicit set SIGCHLD to SIG_IGN is distinct from SIG_DFL
Date: Mon, 7 Apr 2008 23:08:02 +0200
Message-ID: <cfd18e0f0804071408k6a559321xd80a792f62879d81@mail.gmail.com>
References: <20080407161651.GA22034@cetus>
	 <cfd18e0f0804071404j630a631ev6991dfff67fc406e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0804071404j630a631ev6991dfff67fc406e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Justin Pryzby <justinpryzby-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 7, 2008 at 11:04 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>
> On Mon, Apr 7, 2008 at 6:16 PM, Justin Pryzby
> <justinpryzby-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> wrote:
> > Version: 2.79-2
> > File: /usr/share/man/man2/wait.2.gz
> >
> > What do people think of something like the attached change?  While
> > working with Debian's cron package, I found that explicitly setting
> > the SIGCHLD action to SIG_IGN inhibits the creation of zombie
> > processes, even though kill(1) gives the "ignore" as the default
> > disposition.
> >
> > Consider the attached example program.  Any of the following changes
> > will cause a zombie process to be visible in a ps -ef process listing:
> >
> >  . remove the call to signal();
> >  . change SIG_IGN to SIG_DFL;
> >  . remove the sleep(1); (due to process scheduling, the zombie is only
> >   sometimes visible);
> >  . ???
> >
> > --- /usr/share/man/man2/wait.2.gz
> > +++ /tmp/wait2.gz.22000 2008-04-07 12:02:31.000000000 -0400
> > @@ -46,7 +46,7 @@
> >  .\"    Much other text rewritten
> >  .\" 2005-05-10, mtk, __W* flags can't be used with waitid()
> >  .\"
> > -.TH WAIT 2  2007-07-26 "Linux" "Linux Programmer's Manual"
> > +.TH WAIT 2  2008-04-07 "Linux" "Linux Programmer's Manual"
> >  .SH NAME
> >  wait, waitpid, waitid \- wait for process to change state
> >  .SH SYNOPSIS
> > @@ -429,7 +429,7 @@
> >
> >  POSIX.1-2001 specifies that if the disposition of
> >  .B SIGCHLD
> > -is set to
> > +is set explicitly to
> >  .B SIG_IGN
> >  or the
> >  .B SA_NOCLDWAIT
>
> I would not favor this.  It suggests that there is the notion of
> "implicitly" setting the disposition to SIG_IGN, which of course there
> isn't.  What I've instead done is added a sentence:
>
>    Note that even though

Ooops -- I accidentally sent an incomplete draft.

The sentence I added was:

    Note that even though the default disposition of SIGCHLD is
"ignore", explicitly
    setting the disposition to SIG_IGN results in different treatement of zombie
    children.

Seem okay?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
