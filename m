From: Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man ptrace: add extended description of various ptrace quirks
Date: Fri, 30 Sep 2011 16:28:23 +0200
Message-ID: <CAK1hOcPqVYY93VFbDbMZ39iCr7VH+hP-bQT3u0SPJXmezN7H3Q@mail.gmail.com>
References: <CAK1hOcPFXMoYsP6N6Hx5Qz3J4xj31TmSj7xo6SRVPegNCbhx7g@mail.gmail.com>
 <CAKgNAkicbgpSLZE6Wn_5ickGojJuGd4x2vMUG0491OB+O1Z_HA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkicbgpSLZE6Wn_5ickGojJuGd4x2vMUG0491OB+O1Z_HA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Chuck Ebbert <76306.1226-Crc3fnV8OO0XQ3Lr6voeyA@public.gmane.org>, Blaisorblade <blaisorblade-whZMOeQn8C0@public.gmane.org>, Daniel Jacobowitz <dan-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Sep 29, 2011 at 9:08 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> So, I took your patch, and then did a global edit of the page to fix
> various pieces (in the existing text, as well as do some language
> clean-ups for the new text). In the process, I found a number of
> pieces that are still unclear (some in the old text, some in your new
> text). I also made some changes to your text that I'd like you to
> check. I've marked each of these with FIXME below. Could you please
> take a look at the FIXMEs, and write me a comment for each of these.
> (I appreciate that in some cases, especially for the existing text,
> you may not have a handy answer Denys, but if you (and others) can
> give any help, that would be great.)
>
> Rather than you writing a new patch to this version of the page, I
> think it might be easiest if you just replied to the FIXMEs inline
> below, then I can revise the page in the light of your comments.

       Another group of commands makes the ptrace-stopped  tracee  run.   They
       have the form:

           ptrace(PTRACE_cmd, pid, 0, sig);

       where  cmd  is  PTRACE_CONT, PTRACE_DETACH, PTRACE_SYSCALL, PTRACE_SIN-
       GLESTEP, PTRACE_SYSEMU, or PTRACE_SYSEMU_SINGLESTEP.

Cosmetics: cmd is, of course, CONT, DETACH,..., not PTRACE_CONT,
PTRACE_DETACH...


       If the tracee  is
       in  signal-delivery-stop,  sig  is  the signal to be injected (if it is
       nonzero).  Otherwise, sig may be ignored.  (Recommended practice is  to
       always pass 0 in these cases.)

Looks like (my) text in last sentence is confusing. I meant:
"If you are resterting thracee from a ptrace-stop other than
signal-delivery-stop, recommended practice is  to always pass
sig == 0".

-- 
vda
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
